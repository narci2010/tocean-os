/*
 * Copyright 2010-2017 Tocean Group.
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：CustomizedModularRealmAuthenticator.java
 * 描述：
 * 修改人：Narci.Lee
 * 修改时间：2018年9月10日
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */
package com.toceansoft.config;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.toceansoft.common.exception.RRException;
import com.toceansoft.common.utils.RequestContextHolderUtil;
import com.toceansoft.framework.security.CustomLoginToken;
import com.toceansoft.framework.security.UserRealm;
import com.toceansoft.security.cas.CasRealm;
import com.toceansoft.security.cas.CasRealm2;
import com.toceansoft.sociallogin.filter.QqToken;
import com.toceansoft.sociallogin.filter.SinaToken;
import com.toceansoft.sociallogin.filter.WechatToken;
import com.toceansoft.sociallogin.realm.QqRealm;
import com.toceansoft.sociallogin.realm.SinaRealm;
import com.toceansoft.sociallogin.realm.WechatRealm;
import com.toceansoft.sys.oauth2.OAuth2Realm;
import com.toceansoft.sys.oauth2.OAuth2Token;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Configuration
@Slf4j
public class CustomizedModularRealmAuthenticator extends ModularRealmAuthenticator {

	/** 客户端1拦截url */
	@Value("${shiro.cas1.callback-url}")
	private String callback;

	/** 客户端2拦截url */
	@Value("${shiro.cas2.callback-url}")
	private String callback2;

	@Override
	protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// 判断getRealms()是否返回为空
		assertRealmsConfigured();

		HttpServletRequest request = RequestContextHolderUtil.getRequest();
		String url = null;
		try {
			url = request.getRequestURI();
			log.debug("CustomizedModularRealmAuthenticator.doAuthenticate.url:" + url);

		} catch (Exception e) {
			throw new RRException("获取URL失败。", e);
		}
		Collection<Realm> realms = getRealms();

		// 登录类型对应的所有Realm

		for (Realm realm : realms) {
			if (realm instanceof UserRealm && authenticationToken instanceof CustomLoginToken) {
				log.debug("CustomizedModularRealmAuthenticator.doAuthenticate.add:" + realm);
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof OAuth2Realm && authenticationToken instanceof OAuth2Token) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof WechatRealm && authenticationToken instanceof WechatToken) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof QqRealm && authenticationToken instanceof QqToken) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof SinaRealm && authenticationToken instanceof SinaToken) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof CasRealm && url.equals(this.callback)) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			} else if (realm instanceof CasRealm2 && url.equals(this.callback2)) {
				return doSingleRealmAuthentication(realm, authenticationToken);
			}

		}

		return null;
	}

	@Override
	protected AuthenticationInfo doMultiRealmAuthentication(Collection<Realm> realms,
			AuthenticationToken token) {
		return super.doMultiRealmAuthentication(realms, token);
	}

	/**
	 * 调用单个realm执行操作
	 */
	@Override
	protected AuthenticationInfo doSingleRealmAuthentication(Realm realm,
			AuthenticationToken token) {

		// 如果该realms不支持(不能验证)当前token
		log.debug("realm:" + realm + " token:" + token);
		if (!realm.supports(token)) {
			throw new AuthenticationException("token类型错误!");
		}
		AuthenticationInfo info = null;

		info = realm.getAuthenticationInfo(token);

		if (info == null) {
			throw new AuthenticationException("token不存在!");
		}

		return info;
	}

}
