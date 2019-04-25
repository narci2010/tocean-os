/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：CasSingleSignOutConfig.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.security.cas;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;

import com.toceansoft.framework.security.cas.CustomContextThreadLocalFilter;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@ConditionalOnProperty(prefix = "shiro.cas1", name = "server-url")
@Configuration
@Slf4j
public class CasSingleSignOutConfig {

	/**
	 * 不拦截的路径
	 *
	 * @return PathMatcher
	 */
	// @Bean
	// public PathMatcher pathMatcher() {
	// PathMatcher pathMatcher = new PathMatcher();
	// pathMatcher.excludePath("/html/**");
	// return pathMatcher;
	// }

	/**
	 * 
	 * @param shiroFilterFactoryBean
	 *            ShiroFilterFactoryBean
	 * @return FilterRegistrationBean<CustomContextThreadLocalFilter>
	 */
	@Bean
	public FilterRegistrationBean<CustomContextThreadLocalFilter> casAssertionThreadLocalFilter(
			ShiroFilterFactoryBean shiroFilterFactoryBean) {
		log.debug("casAssertionThreadLocalFilter.");
		/**
		 * 所有经过身份过滤拦截的请求、都需要经过CustomAssertionThreadLocalFilter这个过滤器
		 */
		Map<String, String> filterChainDefinitionMap = shiroFilterFactoryBean
				.getFilterChainDefinitionMap();
		List<String> casUrls = new LinkedList<String>();
		for (Entry<String, String> entry : filterChainDefinitionMap.entrySet()) {
			if ("securityFilter".equals(entry.getValue())
					|| "securityFilter2".equals(entry.getValue())
					|| "casSecurityFilter".equals(entry.getValue())) {
				casUrls.add(entry.getKey());
			}
		}
		log.debug("casUrls:" + casUrls);
		final FilterRegistrationBean<CustomContextThreadLocalFilter> assertionTLFilter = new FilterRegistrationBean<CustomContextThreadLocalFilter>();
		assertionTLFilter.setFilter(new CustomContextThreadLocalFilter());
		assertionTLFilter.setOrder(Ordered.LOWEST_PRECEDENCE);
		assertionTLFilter.setUrlPatterns(casUrls);
		return assertionTLFilter;
	}
}
