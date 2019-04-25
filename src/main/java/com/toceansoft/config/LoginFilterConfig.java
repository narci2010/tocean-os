/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：LoginFilterConfig.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.toceansoft.config.redis.RedisCacheManager;
import com.toceansoft.framework.security.ExtendFormAuthenticationFilter;
import com.toceansoft.framework.security.ToceanLogoutFilter;
import com.toceansoft.framework.security.UserRealm;
import com.toceansoft.sys.utils.RetryLimitHashedCredentialsMatcher;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Configuration
@Slf4j
public class LoginFilterConfig {

	@Value("${shiro.default.loginurl}")
	private String defaultLoginUrl;
	@Value("${shiro.default.successurl}")
	private String defaultSuccessUrl;
	@Value("${shiro.default.userparam}")
	private String defaultUserParam;
	@Value("${shiro.default.passwordparam}")
	private String defaultPasswordParam;
	@Value("${shiro.default.remembermeparam}")
	private String defaultRemembermeParam;

	// @Autowired
	// private FilterUrlConfig filterUrlConfig;

	/**
	 * 
	 * @return FilterUrlConfig
	 */
	// @Bean
	// public FilterUrlConfig getFilterUrlConfig() {
	// log.debug(filterUrlConfig + ":FilterUrlConfig");
	// return filterUrlConfig;
	// }

	/**
	 * 默认登陆过滤器
	 *
	 * @author Narci.Lee
	 * @return ExtendFormAuthenticationFilter
	 */
	@Bean(name = "formFilter")
	public ExtendFormAuthenticationFilter getFormFilter() {
		log.debug("init ExtendFormAuthenticationFilter.");

		ExtendFormAuthenticationFilter formFilter = new ExtendFormAuthenticationFilter();
		formFilter.setName("formFilter");
		formFilter.setEnabled(true);
		log.debug("defaultLoginUrl:" + defaultLoginUrl);
		formFilter.setLoginUrl(defaultLoginUrl);
		formFilter.setSuccessUrl(defaultSuccessUrl);
		formFilter.setUsernameParam(defaultUserParam);
		formFilter.setPasswordParam(defaultPasswordParam);
		formFilter.setRememberMeParam(defaultRemembermeParam);

		return formFilter;
	}

	/**
	 * 
	 * @param credentialsMatcher
	 *            RetryLimitHashedCredentialsMatcher
	 * @param redisCacheManager
	 *            RedisCacheManager
	 * @return UserRealm
	 */
	@Bean(name = "userRealm")
	public UserRealm userRealm(RetryLimitHashedCredentialsMatcher credentialsMatcher,
			RedisCacheManager redisCacheManager) {
		UserRealm realm = new UserRealm();
		realm.setCacheManager(redisCacheManager);
		realm.setCredentialsMatcher(credentialsMatcher);
		realm.setCachingEnabled(true);
		return realm;
	}
	
	/**
	 * 
	 * @return ToceanLogoutFilter
	 */
	// @Bean(name = "logoutFilter")
	public ToceanLogoutFilter getLogoutFilter() {
		return new ToceanLogoutFilter();
	}
}
