/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SessionConfig.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.config;

import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Configuration
@Slf4j
public class SessionConfig {

	@Autowired
	private DefaultWebSecurityManager securityManager;

	@Value("${cors.withCredentials:false}")
	private boolean withCredentials;

	/**
	 * 
	 * @return Object
	 */
	@Bean
	public Object configSessionEnable() {
		log.debug("configSessionEnable:" + withCredentials);
		DefaultSubjectDAO subjectDAO = (DefaultSubjectDAO) securityManager.getSubjectDAO();
		DefaultSessionStorageEvaluator defaultSessionStorageEvaluator = (DefaultSessionStorageEvaluator) subjectDAO
				.getSessionStorageEvaluator();
		defaultSessionStorageEvaluator.setSessionStorageEnabled(withCredentials);
		return null;
	}

//	[urls]
//			...
//			/rest/** = noSessionCreation, authcBasic, ...
//			This filter allows session usage for any existing session, but will not allow new sessions to be created during the filtered request.
//	That is, any of the four following method calls on a request or subject that do not already have an existing session will automatically 
//	trigger a DisabledSessionException:
//
//			httpServletRequest.getSession()
//			httpServletRequest.getSession(true)
//			subject.getSession()
//			subject.getSession(true)
//			If a Subject already has a session prior to visiting the noSessionCreation-protected-URL, the above 4 calls will still work as expected.
//
//			Finally, the following calls will always be allowed in all cases:
//
//			httpServletRequest.getSession(false)
//			subject.getSession(false)

}
