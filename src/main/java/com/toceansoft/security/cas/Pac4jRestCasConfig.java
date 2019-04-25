/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：Pac4jSingleCasConfig.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.security.cas;

import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.realm.Realm;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.pac4j.cas.client.CasClient;
import org.pac4j.cas.client.rest.CasRestFormClient;
import org.pac4j.cas.config.CasConfiguration;
import org.pac4j.cas.config.CasProtocol;
import org.pac4j.core.client.Clients;
import org.pac4j.core.config.Config;
import org.pac4j.http.client.direct.ParameterClient;
import org.pac4j.jwt.config.encryption.SecretEncryptionConfiguration;
import org.pac4j.jwt.config.signature.SecretSignatureConfiguration;
import org.pac4j.jwt.credentials.authenticator.JwtAuthenticator;
import org.pac4j.jwt.profile.JwtGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;

import com.toceansoft.common.exception.RRException;
import com.toceansoft.framework.security.cas.CasConfigVo;
import com.toceansoft.framework.security.cas.CasFilterMap;
import com.toceansoft.framework.security.cas.CustomCallbackFilter;
import com.toceansoft.framework.security.cas.CustomCasClient;
import com.toceansoft.framework.security.cas.CustomLogoutFilter;
import com.toceansoft.framework.security.cas.CustomSecurityFilter;
import com.toceansoft.framework.security.cas.CustomShiroSessionStore;

import io.buji.pac4j.filter.CallbackFilter;
import io.buji.pac4j.filter.LogoutFilter;
import io.buji.pac4j.filter.SecurityFilter;
import io.buji.pac4j.subject.Pac4jSubjectFactory;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@ConditionalOnProperty(prefix = "shiro.cas1", name = "server-url")
// @Configuration
@Slf4j
public class Pac4jRestCasConfig {
	// 可以处理多个cas服务器
	@Autowired
	private CasConfigVo casConfigVo;

	@Autowired
	private DefaultWebSecurityManager securityManager;

	// jwt秘钥
	@Value("${jwtconfig.jwt.secret}")
	private String salt;

	/**
	 * 
	 * @param subjectFactory
	 *            Pac4jSubjectFactory
	 * @param casRealm
	 *            CasRealm
	 * 
	 * @return Object
	 */
	@Bean
	public Object initCasRealms(Pac4jSubjectFactory subjectFactory, CasRealm casRealm) {
		log.debug("更新securityManager对象。");
		log.debug("CasConfigVo:" + casConfigVo);

		securityManager.setSubjectFactory(subjectFactory);
		Collection<Realm> realms = securityManager.getRealms();
		if (realms == null) {
			throw new RRException("安全认证Realm对象不能为空。");
		}
		realms.add(casRealm);

		return null;
	}

	/**
	 * 
	 * @return CasRealm
	 */
	@Bean
	public CasRealm casRealm() {
		CasRealm realm = new CasRealm();
		// 使用自定义的realm
		realm.setClientName(casConfigVo.getClientName());

		realm.setCachingEnabled(true);

		realm.setAuthenticationCachingEnabled(true);
		realm.setAuthorizationCachingEnabled(true);

		return realm;
	}

	/**
	 * 使用 pac4j 的 subjectFactory
	 * 
	 * @return Pac4jSubjectFactory
	 */
	@Bean
	public Pac4jSubjectFactory subjectFactory() {
		return new Pac4jSubjectFactory();
	}

	/**
	 * 自定义存储
	 * 
	 * @return CustomShiroSessionStore
	 */
	@Bean
	public CustomShiroSessionStore shiroSessionStore() {
		return CustomShiroSessionStore.INSTANCE;
	}

	/**
	 * JWT Token 生成器，对CommonProfile生成然后每次携带token访问
	 * 
	 * @return JwtGenerator
	 */
	@Bean
	protected JwtGenerator jwtGenerator() {
		return new JwtGenerator(new SecretSignatureConfiguration(salt),
				new SecretEncryptionConfiguration(salt));
	}

	/**
	 * 
	 * @return CasClient
	 */
	@Bean
	public CasClient casClient() {
		CasClient casClient = new CustomCasClient();
		casClient.setConfiguration(casConfiguration());
		casClient.setName(casConfigVo.getClientName());
		casClient.setCallbackUrl(casConfigVo.getServiceUrl() + casConfigVo.getCallBackUrl()
				+ "?client_name=" + casConfigVo.getClientName());
		return casClient;

	}

	/**
	 * 通过rest接口可以获取tgt，获取service ticket，甚至可以获取CasProfile
	 * 
	 * @return CasRestFormClient
	 */
	@Bean
	protected CasRestFormClient casRestFormClient() {
		CasRestFormClient casRestFormClient = new CasRestFormClient();
		casRestFormClient.setConfiguration(casConfiguration());
		casRestFormClient.setName("rest");
		return casRestFormClient;
	}

	/**
	 * ?token=xxx
	 * 
	 * @return ParameterClient
	 */
	@Bean
	protected ParameterClient casParameterClient() {
		// token校验器，可以用HeaderClient更安全
		ParameterClient parameterClient = new ParameterClient("token", jwtAuthenticator());
		parameterClient.setSupportGetRequest(true);
		parameterClient.setName("jwt");
		return parameterClient;
	}

	@Bean(name = "casConfig")
	protected Config casConfig() {
		Config config = new Config();
		config.setClients(clients());

		config.setSessionStore(shiroSessionStore());
		return config;
	}

	@Bean
	protected Clients clients() {
		// 可以设置默认client
		Clients clients = new Clients();
		// 支持的client全部设置进去
		clients.setClients(casClient(), casRestFormClient(), casParameterClient());
		return clients;
	}

	/**
	 * JWT校验器，也就是目前设置的ParameterClient进行的校验器，是rest/或者前后端分离的核心校验器
	 * 
	 * @return JwtAuthenticator
	 */
	@Bean
	protected JwtAuthenticator jwtAuthenticator() {
		JwtAuthenticator jwtAuthenticator = new JwtAuthenticator();
		jwtAuthenticator.addSignatureConfiguration(new SecretSignatureConfiguration(salt));
		jwtAuthenticator.addEncryptionConfiguration(new SecretEncryptionConfiguration(salt));
		return jwtAuthenticator;
	}

	/**
	 * cas的基本设置，包括或url等等，rest调用协议等
	 * 
	 * @return CasConfiguration
	 */
	@Bean
	public CasConfiguration casConfiguration() {
		// CAS server登录地址
		final CasConfiguration configuration = new CasConfiguration(
				casConfigVo.getCasServerUrl() + "/login");
		configuration.setRestUrl(casConfigVo.getServiceUrl() + "/login/rest");

		// CAS 版本，默认为 CAS30，我们使用的是 CAS20
		configuration.setProtocol(CasProtocol.CAS30);
		configuration.setPrefixUrl(casConfigVo.getCasServerUrl() + "/");

		return configuration;
	}

	/**
	 * cas核心过滤器，把支持的client写上，filter过滤时才会处理，clients必须在casConfig.clients已经注册
	 *
	 * @return Filter
	 */
	@Bean(name = "casSecurityFilter")
	public Filter casSecurityFilter() {
		SecurityFilter filter = new CustomSecurityFilter();
		filter.setClients(casConfigVo.getClientName() + ",rest,jwt");
		filter.setConfig(casConfig());
		return filter;
	}

	/**
	 * 对shiro的过滤策略进行明确
	 * 
	 * @return
	 */
	@Bean
	protected Map<String, Filter> filters() {
		// 过滤器设置
		Map<String, Filter> filters = new HashMap<>();
		filters.put("casSecurityFilter", casSecurityFilter());

		CallbackFilter callbackFilter = new CustomCallbackFilter();
		callbackFilter.setConfig(casConfig());
		callbackFilter.setDefaultUrl(casConfigVo.getCallBackUrl());
		filters.put("callbackFilter", callbackFilter);

		// 注销 拦截器
		LogoutFilter logoutFilter = new CustomLogoutFilter();
		logoutFilter.setConfig(casConfig());
		logoutFilter.setCentralLogout(true);
		logoutFilter.setLocalLogout(true);
		// 添加logout后 跳转到指定url url的匹配规则 默认为 /.*;
		logoutFilter.setLogoutUrlPattern(".*");
		logoutFilter.setDefaultUrl(casConfigVo.getCasServerUrl() + casConfigVo.getCallBackUrl()
				+ "?client_name=" + casConfigVo.getClientName());
		filters.put("casLogoutFilter", logoutFilter);
		return filters;
	}

	/**
	 * 
	 * @return CasFilterMap
	 */
	@Bean
	public CasFilterMap casFilters() {
		log.debug("enter casFilters...");
		Map<String, String> filterMap = new LinkedHashMap<>();

		filterMap.put(casConfigVo.getCasFilterUrl(), "casSecurityFilter");
		filterMap.put("/login/rest", "casSecurityFilter");
		filterMap.put(casConfigVo.getCallBackUrl(), "callbackFilter");
		filterMap.put(casConfigVo.getCasLogoutUrl(), "casLogoutFilter");

		CasFilterMap casFilterMap = new CasFilterMap();
		casFilterMap.setFilterMap(filterMap);
		casFilterMap.setFilters(filters());
		return casFilterMap;

	}
}
