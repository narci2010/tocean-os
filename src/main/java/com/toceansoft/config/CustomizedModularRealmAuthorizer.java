/*
 * Copyright 2010-2017 Tocean Group.
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：CustomizedModularRealmAuthorizer.java
 * 描述：
 * 修改人：Narci.Lee
 * 修改时间：2018年9月10日
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */
package com.toceansoft.config;

import java.util.Collection;
import java.util.HashSet;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Configuration
@Slf4j
public class CustomizedModularRealmAuthorizer extends ModularRealmAuthorizer {

	private Collection<Realm> cacheRealms = null;

	@Override
	protected void assertRealmsConfigured() throws IllegalStateException {
		// 默认情况下，只要有一个realm具备权限即可.
		if (this.cacheRealms == null) {
			this.cacheRealms = this.getRealms();
		}
		// add code begin
		log.debug("assertRealmsConfigured1:" + realms);
		this.setRealms(this.getRealRealm());
		Collection<Realm> realms = getRealms();

		log.debug("assertRealmsConfigured2:" + realms);
		// add code end
		if (realms == null || realms.isEmpty()) {
			String msg = "Configuration error:  No realms have been configured!  One or more realms must be "
					+ "present to execute an authorization operation.";
			throw new IllegalStateException(msg);
		}
	}

	private Collection<Realm> getRealRealm() {

		Subject subject = SecurityUtils.getSubject();
		Session s = subject.getSession();
		Collection<Realm> realReamls = new HashSet<Realm>();
		String realRealm = (String) s.getAttribute("realRealm");
		log.debug("realRealm:" + realRealm);
		for (Realm r : this.cacheRealms) {
			if (r.getClass().getName().equals(realRealm)) {
				realReamls.add(r);
				break;
			}
		}
		return realReamls;

	}
}
