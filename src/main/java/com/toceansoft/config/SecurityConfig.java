/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SecurityConfig.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.config;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.authc.pam.AtLeastOneSuccessfulStrategy;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.toceansoft.common.validator.Judge;
import com.toceansoft.config.redis.RedisCacheManager2;
import com.toceansoft.framework.security.ExtendFormAuthenticationFilter;
import com.toceansoft.framework.security.RoleAuthenticatingFilter;
import com.toceansoft.framework.security.ToceanLogoutFilter;
import com.toceansoft.framework.security.UserRealm;
import com.toceansoft.framework.security.cas.CasFilterMap;
import com.toceansoft.sociallogin.filter.WechatLoginFilter;
import com.toceansoft.sys.oauth2.OAuth2Filter;
import com.toceansoft.sys.oauth2.OAuth2Realm;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Configuration
@Slf4j
public class SecurityConfig {

	// 注意：安全对象初始化的时候@Value可能取不到值

	/**
	 * 
	 * @param shiroFilterFactoryBean ShiroFilterFactoryBean
	 * @param logoutFilter           ToceanLogoutFilter
	 * @return Object
	 */
	// @Bean(name = "second")
	public Object initProperty(ShiroFilterFactoryBean shiroFilterFactoryBean, ToceanLogoutFilter logoutFilter) {
		log.debug("logoutFilter:" + logoutFilter);
		Map<String, Filter> filters = shiroFilterFactoryBean.getFilters();
		filters.put("logoutFilter", logoutFilter);
		return null;

	}

	/**
	 * 
	 * @return AtLeastOneSuccessfulStrategy
	 */
	@Bean(name = "authenticationStrategy")
	public AtLeastOneSuccessfulStrategy authenticationStrategy() {
		// FirstSuccessfulStrategy
		AtLeastOneSuccessfulStrategy authenticationStrategy = new AtLeastOneSuccessfulStrategy();

		return authenticationStrategy;
	}

	/**
	 * 
	 * @param authenticationStrategy AtLeastOneSuccessfulStrategy
	 * @return CustomizedModularRealmAuthenticator
	 */
	@Bean(name = "authenticator")
	public CustomizedModularRealmAuthenticator authenticator(AtLeastOneSuccessfulStrategy authenticationStrategy) {
		CustomizedModularRealmAuthenticator authenticator = new CustomizedModularRealmAuthenticator();
		authenticator.setAuthenticationStrategy(authenticationStrategy);

		return authenticator;
	}

	// @Bean(name = "authorizer")
	// public CustomizedModularRealmAuthorizer authorizer() {
	// CustomizedModularRealmAuthorizer authorizer = new
	// CustomizedModularRealmAuthorizer();
	// return authorizer;
	// }

	/**
	 * 
	 * @param oAuth2Realm        OAuth2Realm
	 * @param userRealm          UserRealm
	 * @param sessionManager     SessionManager
	 * @param redisCacheManager2 RedisCacheManager2
	 * 
	 * @return SessionManager
	 */
	@Bean("securityManager")
	public DefaultWebSecurityManager securityManager(OAuth2Realm oAuth2Realm, UserRealm userRealm,
			SessionManager sessionManager, RedisCacheManager2 redisCacheManager2) {

		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();

		// 设置authenticator，authorizer之后再设置realm，不然会找不到realms
		securityManager.setAuthenticator(authenticator(authenticationStrategy()));
		// securityManager.setAuthorizer(authorizer);

		Collection<Realm> realms = new HashSet<Realm>();
		log.debug("oAuth2Realm:" + oAuth2Realm);
		log.debug("userRealm:" + userRealm);
		log.debug("redisCacheManager2:" + redisCacheManager2);
		realms.add(oAuth2Realm);
		realms.add(userRealm);
		securityManager.setRealms(realms);
		securityManager.setSessionManager(sessionManager);
		securityManager.setCacheManager(redisCacheManager2);

		// 前后端分离，本地存储token，没必要使用rememberMe
		// securityManager.setRememberMeManager(rememberMeManager);

		return securityManager;
	}

	/**
	 * 
	 * @param securityManager          SessionManager
	 * @param formFilter               ExtendFormAuthenticationFilter
	 * @param roleAuthenticatingFilter RoleAuthenticatingFilter
	 * @param filterUrlConfig          FilterUrlConfig
	 * @param casFilterMap             CasFilterMap
	 * @return ShiroFilterFactoryBean
	 */
	@Bean("shiroFilter")
	public ShiroFilterFactoryBean shirFilter(DefaultWebSecurityManager securityManager,
			ExtendFormAuthenticationFilter formFilter, RoleAuthenticatingFilter roleAuthenticatingFilter,
			FilterUrlConfig filterUrlConfig, CasFilterMap casFilterMap) {
		log.debug("security config init...");
		log.debug("casFilterMap:" + casFilterMap);
		Map<String, Filter> socailFilters = filterUrlConfig.getSocailFilters();
		log.debug("socailFilters:" + socailFilters);
		// log.debug(filterUrlConfig + "****");
		ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
		// shiroFilter.setSuccessUrl("/index.html");
		shiroFilter.setSecurityManager(securityManager);

		// oauth过滤
		Map<String, Filter> filters = new HashMap<>();
		filters.put("oauth2", new OAuth2Filter());
		filters.put("formFilter", formFilter);
		filters.put("wechatFilter", new WechatLoginFilter());
		filters.put("myRoles", roleAuthenticatingFilter);

		Map<String, String> filterMap = new LinkedHashMap<>();

		if (casFilterMap != null) {
			filters.putAll(casFilterMap.getFilters());
			filterMap.putAll(casFilterMap.getFilterMap());
		}
		if (!Judge.isEmtpy(socailFilters)) {
			filters.putAll(socailFilters);
		}
		shiroFilter.setFilters(filters);

		Map<String, String> roleConfigs = filterUrlConfig.getRoleFilters();
		log.debug("roleConfigs:" + roleConfigs);
		for (Map.Entry<String, String> roleConfig : roleConfigs.entrySet()) {
			String url = roleConfig.getKey();
			String roleFilter = "myRoles[" + roleConfig.getValue() + "]";
			log.debug("roleFilter:" + roleFilter);
			filterMap.put(url, roleFilter);

		}

		// 针对同一个url，后面配置的过滤器会覆盖前面配置的拦截器（就是后面配置的才会生效）

		Map<String, String> configs = filterUrlConfig.getFilters();
		for (Map.Entry<String, String> aconfig : configs.entrySet()) {
			String filterName = aconfig.getKey();
			// log.debug(filterName + ":" + aconfig.getValue());
			String[] filterUrls = StringUtils.split(aconfig.getValue());
			for (String filterUrl : filterUrls) {
				// log.debug(filterUrl + ":" + filterName);
				filterMap.put(filterUrl, filterName);
			}
		}

		for (Map.Entry<String, String> entry : filterMap.entrySet()) {
			log.debug(entry.getKey() + "==>" + entry.getValue());
		}

		shiroFilter.setFilterChainDefinitionMap(filterMap);

		return shiroFilter;
	}

	/**
	 * 
	 * @return LifecycleBeanPostProcessor
	 */
	@Bean("lifecycleBeanPostProcessor")
	public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
		return new LifecycleBeanPostProcessor();
	}

	/**
	 * 
	 * @return DefaultAdvisorAutoProxyCreator
	 */
	@Bean
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator proxyCreator = new DefaultAdvisorAutoProxyCreator();
		proxyCreator.setProxyTargetClass(true);
		return proxyCreator;
	}

	/**
	 * 
	 * @param securityManager SecurityManager
	 * @return AuthorizationAttributeSourceAdvisor
	 */
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
			DefaultWebSecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
		advisor.setSecurityManager(securityManager);
		return advisor;
	}
}
