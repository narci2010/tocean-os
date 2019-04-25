/*  
 * Copyright 2010-2018 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：CasLoginController.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2018年11月1日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.security.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toceansoft.common.exception.RRException;
import com.toceansoft.common.exception.ServiceException;
import com.toceansoft.common.utils.R;
import com.toceansoft.sys.controller.AbstractUserController;
import com.toceansoft.sys.oauth2.ExcludeUrlsVo;
import com.toceansoft.sys.service.SysUserService;
import com.toceansoft.sys.service.SysUserTokenService;

import io.buji.pac4j.subject.Pac4jPrincipal;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@Slf4j
@ConditionalOnProperty(prefix = "shiro.cas1", name = "server-url")
@RestController
// @RequestMapping("/api")
public class CasLoginController extends AbstractUserController {

	@Autowired
	private SysUserTokenService sysUserTokenService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private ExcludeUrlsVo oAuth2ExcludeUrls;

	// @Autowired
	// private CasRestFormClient casRestFormClient;
	// @Autowired
	// private JwtGenerator jwtGenerator;
	//
	/** 客户服务1路径 */
	@Value("${shiro.cas1.service-url}")
	private String serviceUrl;
	/** 客户服务1路径 */
	@Value("${shiro.cas1.server-url}")
	private String serverUrl;

	/**
	 * 
	 * @return R
	 */
	@GetMapping(value = "/login/cas1")
	public R loginCas1() {
		log.debug("enter login cas1");
		// 修改此处代码
		Subject subject = SecurityUtils.getSubject();
		log.debug("subject.getPrincipal():" + subject.getPrincipal().getClass());
		if (!(subject.getPrincipal() instanceof Pac4jPrincipal)) {
			throw new RRException("非法CAS登陆。");
		}
		Pac4jPrincipal pac4j = (Pac4jPrincipal) subject.getPrincipal();
		log.debug(pac4j.getName());
		log.debug("getProfile:" + pac4j.getProfile());
		log.debug("getProfiles:" + pac4j.getProfiles());
		R r = sysUserTokenService.createToken(1L);
		return r;
	}

	/**
	 * 
	 * @return R
	 */
	@GetMapping(value = "/login/cas2")
	public R loginCas2() {
		log.debug("enter login cas2");
		// 修改此处代码
		Subject subject = SecurityUtils.getSubject();
		log.debug("subject.getPrincipal():" + subject.getPrincipal().getClass());
		if (!(subject.getPrincipal() instanceof Pac4jPrincipal)) {
			throw new RRException("非法CAS登陆。");
		}
		Pac4jPrincipal pac4j = (Pac4jPrincipal) subject.getPrincipal();
		log.debug(pac4j.getName());
		log.debug("getProfile:" + pac4j.getProfile());
		log.debug("getProfiles:" + pac4j.getProfiles());
		R r = sysUserTokenService.createToken(1L);
		return r;
	}

	/**
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return R //
	 */
	// @RequestMapping("/login/rest")
	// public R login(HttpServletRequest request, HttpServletResponse response) {
	//
	// J2EContext context = new J2EContext(request, response);
	// final ProfileManager<CasRestProfile> manager = new ProfileManager(context);
	// final Optional<CasRestProfile> profile = manager.get(true);
	// // 获取ticket
	// TokenCredentials tokenCredentials =
	// casRestFormClient.requestServiceTicket(serviceUrl,
	// profile.get(), context);
	// // 根据ticket获取用户信息
	// final CasProfile casProfile =
	// casRestFormClient.validateServiceTicket(serviceUrl,
	// tokenCredentials, context);
	// // 生成jwt token
	// String token = jwtGenerator.generate(casProfile);
	// R r = R.ok().put("token", token);
	// return r;
	// }

	/**
	 * 获取登录的用户信息
	 * 
	 * @return R
	 * @throws ServiceException
	 *             se
	 */
	@RequestMapping("/login/info")
	public R info() throws ServiceException {
		log.debug("oAuth2ExcludeUrls:" + oAuth2ExcludeUrls);
		if (oAuth2ExcludeUrls != null) {
			for (String url : oAuth2ExcludeUrls.getOauth2ExcludeUrls()) {
				log.debug(url);
			}
		}
		return R.ok().put("user", getUser());
	}

	/**
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 */
	// @RequestMapping("/login/rest")
	// public void restLogin(HttpServletRequest request, HttpServletResponse
	// response) {
	// final CasConfiguration casConfiguration = new CasConfiguration(this.serverUrl
	// + "/login");
	// casConfiguration.setRestUrl("https://mmoayyed.unicon.net:8433/cas/v1/tickets/login");
	// CasRestFormClient client = new CasRestFormClient();
	// client.setConfiguration(casConfiguration);
	//
	// WebContext webContext = new J2EContext(request, response);
	//
	// try {
	// UsernamePasswordCredentials credentials = client.getCredentials(webContext);
	// String userName = credentials.getUsername();
	// log.debug("userName:" + userName);
	// CasRestProfile profile = client.getUserProfile(credentials, webContext);
	// String tgc = profile.getTicketGrantingTicketId();
	// String redirectUrl = this.serverUrl + "/login" + "?service=" +
	// this.serviceUrl + "&tgc="
	// + tgc;
	// final TokenCredentials casCredentials =
	// client.requestServiceTicket(serviceUrl, profile,
	// webContext);
	// // validate service ticket
	// final CasProfile casProfile = client.validateServiceTicket(serviceUrl,
	// casCredentials,
	// webContext);
	// response.sendRedirect("http://app1.cas.com:9001/hello/restLogin");
	// } catch (HttpAction | IOException e) {
	// // } catch (HttpAction e) {
	// ExceptionUtils.printRootCauseStackTrace(e);
	// }
	// }

	@Override
	protected SysUserService getSysUserService() {

		return this.sysUserService;
	}

}
