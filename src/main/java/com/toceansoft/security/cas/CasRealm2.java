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

import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.pac4j.core.profile.CommonProfile;
import org.springframework.beans.factory.annotation.Autowired;

import com.toceansoft.sys.entity.SysUserEntity;
import com.toceansoft.sys.service.ShiroService;

import io.buji.pac4j.realm.Pac4jRealm;
import io.buji.pac4j.subject.Pac4jPrincipal;
import io.buji.pac4j.token.Pac4jToken;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Slf4j
public class CasRealm2 extends Pac4jRealm {
	@Autowired
	private ShiroService shiroService;

	// @Autowired
	// private SysUserService sysUserService;

	private String clientName;

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	/**
	 * 认证
	 * 
	 * @param authenticationToken
	 * @return
	 * @throws AuthenticationException
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// 根据每个项目的需求，重写以下代码
		final Pac4jToken pac4jToken = (Pac4jToken) authenticationToken;
		final List<CommonProfile> commonProfileList = pac4jToken.getProfiles();
		final CommonProfile commonProfile = commonProfileList.get(0);
		log.info("单点登录返回的信息2==>" + commonProfile.toString());
		final Pac4jPrincipal principal = new Pac4jPrincipal(commonProfileList,
				getPrincipalNameAttribute());
		final PrincipalCollection principalCollection = new SimplePrincipalCollection(principal,
				getName());
		// 登陆成功，应该创建该cas用户信息表，并且该表要与系统账号表（实体SysUserEntity）进行关联（绑定）
		// code...
		return new SimpleAuthenticationInfo(principalCollection, commonProfileList.hashCode());
	}

	/**
	 * 授权/验权（todo 后续有权限在此增加）
	 * 
	 * @param principals
	 * @return
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 根据每个项目的需求，重写以下代码
		SysUserEntity user = shiroService.getCurrentUser(principals.getPrimaryPrincipal());
		Long userId = user.getUserId();

		// 用户权限列表
		Set<String> permsSet = shiroService.getUserPermissions(userId);
		Set<String> rolesSet = shiroService.getUserRoles(userId);

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setStringPermissions(permsSet);
		// 也可以设置角色
		info.setRoles(rolesSet);
		for (String role : rolesSet) {
			log.debug("role:" + role);
		}
		return info;
	}
}
