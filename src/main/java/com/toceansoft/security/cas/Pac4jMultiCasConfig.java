/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：Application.java
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
import org.pac4j.cas.config.CasConfiguration;
import org.pac4j.cas.config.CasProtocol;
import org.pac4j.core.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
@Configuration
@Slf4j
public class Pac4jMultiCasConfig {
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
	 * @param casRealm2
	 *            CasRealm2
	 * @return Object
	 */
	@Bean
	public Object initCasRealms(Pac4jSubjectFactory subjectFactory, CasRealm casRealm,
			CasRealm2 casRealm2) {
		log.debug("更新securityManager对象。");
		log.debug("CasConfigVo:" + casConfigVo);

		securityManager.setSubjectFactory(subjectFactory);
		Collection<Realm> realms = securityManager.getRealms();
		if (realms == null) {
			throw new RRException("安全认证Realm对象不能为空。");
		}
		realms.add(casRealm);
		realms.add(casRealm2);
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
	 * 
	 * @return CasRealm2
	 */
	@Bean
	public CasRealm2 casRealm2() {
		CasRealm2 realm = new CasRealm2();
		// 使用自定义的realm
		realm.setClientName(casConfigVo.getClientName2());
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
	 * pac4j配置
	 * 
	 * @param casClient
	 *            CasClient
	 * @param shiroSessionStore
	 *            CustomShiroSessionStore
	 * @return Config
	 */
	@Bean(name = "config")
	public Config config(CasClient casClient, CustomShiroSessionStore shiroSessionStore) {
		Config config = new Config(casClient);
		config.setSessionStore(shiroSessionStore);
		return config;
	}

	/**
	 * pac4j配置
	 * 
	 * @param casClient2
	 *            CasClient
	 * @param shiroSessionStore
	 *            CustomShiroSessionStore
	 * @return Config
	 */
	@Bean(name = "config2")
	public Config config2(CasClient casClient2, CustomShiroSessionStore shiroSessionStore) {
		Config config = new Config(casClient2);
		config.setSessionStore(shiroSessionStore);
		return config;
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
	 * cas 客户端配置
	 * 
	 * @param casConfig
	 *            CasConfiguration
	 * @return CasClient
	 */
	@Bean
	public CasClient casClient(CasConfiguration casConfig) {
		CasClient casClient = new CustomCasClient(casConfig);
		// 客户端回调地址
		casClient.setCallbackUrl(casConfigVo.getServiceUrl() + casConfigVo.getCallBackUrl()
				+ "?client_name=" + casConfigVo.getClientName());
		casClient.setName(casConfigVo.getClientName());
		return casClient;
	}

	/**
	 * cas 客户端配置
	 * 
	 * @param casConfig2
	 *            CasConfiguration
	 * @return CasClient
	 */
	@Bean(name = "casClient2")
	public CasClient casClient2(CasConfiguration casConfig2) {
		CasClient casClient = new CustomCasClient(casConfig2);
		// 客户端回调地址
		casClient.setCallbackUrl(casConfigVo.getServiceUrl2() + casConfigVo.getCallBackUrl2()
				+ "?client_name=" + casConfigVo.getClientName2());
		casClient.setName(casConfigVo.getClientName2());
		return casClient;
	}

	/**
	 * 请求cas服务端配置
	 * 
	 * @return CasConfiguration
	 */
	@Bean
	public CasConfiguration casConfig() {
		final CasConfiguration configuration = new CasConfiguration();
		// CAS server登录地址
		configuration.setLoginUrl(casConfigVo.getCasServerUrl() + "/login");
		// CAS 版本，默认为 CAS30，我们使用的是 CAS20
		configuration.setProtocol(CasProtocol.CAS20);
		configuration.setAcceptAnyProxy(true);
		configuration.setPrefixUrl(casConfigVo.getCasServerUrl() + "/");

		return configuration;
	}

	/**
	 * 请求cas服务端配置
	 * 
	 * @return CasConfiguration
	 */
	@Bean(name = "casConfig2")
	public CasConfiguration casConfig2() {
		final CasConfiguration configuration = new CasConfiguration();
		// CAS server登录地址
		configuration.setLoginUrl(casConfigVo.getCasServerUrl2() + "/login");
		// CAS 版本，默认为 CAS30，我们使用的是 CAS20
		configuration.setProtocol(CasProtocol.CAS20);
		configuration.setAcceptAnyProxy(true);
		configuration.setPrefixUrl(casConfigVo.getCasServerUrl2() + "/");

		return configuration;
	}

	/**
	 * @param config
	 *            Config
	 * @param config2
	 *            Config
	 * 
	 * @return CasFilterMap
	 */
	@Bean
	public CasFilterMap casFilters(Config config, Config config2) {
		log.debug("enter casFilters...");
		Map<String, Filter> filters = new HashMap<>();
		Map<String, String> filterMap = new LinkedHashMap<>();

		// cas 资源认证拦截器
		SecurityFilter securityFilter = new CustomSecurityFilter();
		securityFilter.setConfig(config);
		// securityFilter.setClients("cas,rest,jwt"); 可以多个client
		securityFilter.setClients(casConfigVo.getClientName());
		filters.put("securityFilter", securityFilter);

		SecurityFilter securityFilter2 = new CustomSecurityFilter();
		securityFilter2.setConfig(config2);
		securityFilter2.setClients(casConfigVo.getClientName2());
		filters.put("securityFilter2", securityFilter2);

		// cas 认证后回调拦截器
		CallbackFilter callbackFilter = new CustomCallbackFilter();
		callbackFilter.setConfig(config);
		callbackFilter.setDefaultUrl(casConfigVo.getCallBackUrl());
		filters.put("callbackFilter", callbackFilter);

		CallbackFilter callbackFilter2 = new CustomCallbackFilter();
		callbackFilter2.setConfig(config2);
		callbackFilter2.setDefaultUrl(casConfigVo.getCallBackUrl2());
		filters.put("callbackFilter2", callbackFilter2);

		// 注销 拦截器
		LogoutFilter logoutFilter = new CustomLogoutFilter();
		logoutFilter.setConfig(config);
		logoutFilter.setCentralLogout(true);
		logoutFilter.setLocalLogout(true);
		// 添加logout后 跳转到指定url url的匹配规则 默认为 /.*;
		logoutFilter.setLogoutUrlPattern(".*");
		logoutFilter.setDefaultUrl(casConfigVo.getCasServerUrl() + casConfigVo.getCallBackUrl()
				+ "?client_name=" + casConfigVo.getClientName());
		filters.put("casLogout", logoutFilter);

		LogoutFilter logoutFilter2 = new CustomLogoutFilter();
		logoutFilter2.setConfig(config2);
		logoutFilter2.setCentralLogout(true);
		logoutFilter2.setLocalLogout(true);
		// // 添加logout后 跳转到指定url url的匹配规则 默认为 /.*;
		logoutFilter2.setLogoutUrlPattern(".*");
		logoutFilter2.setDefaultUrl(casConfigVo.getCasServerUrl2() + casConfigVo.getCallBackUrl2()
				+ "?client_name=" + casConfigVo.getClientName2());
		filters.put("casLogout2", logoutFilter2);

		filterMap.put(casConfigVo.getCasFilterUrl(), "securityFilter");
		filterMap.put(casConfigVo.getCasFilterUrl2(), "securityFilter2");

		filterMap.put(casConfigVo.getCallBackUrl(), "callbackFilter");
		filterMap.put(casConfigVo.getCallBackUrl2(), "callbackFilter2");
		filterMap.put(casConfigVo.getCasLogoutUrl(), "casLogout");
		filterMap.put(casConfigVo.getCasLogoutUrl2(), "casLogout2");
		CasFilterMap casFilterMap = new CasFilterMap();
		casFilterMap.setFilterMap(filterMap);
		casFilterMap.setFilters(filters);
		return casFilterMap;

	}

}
