/*
 * Copyright 2010-2017 Tocean Group.
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：TestController.java
 * 描述：
 * 修改人：Narci.Lee
 * 修改时间：2018年9月10日
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */
package com.toceansoft.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toceansoft.common.utils.R;
import com.toceansoft.common.utils.RequestContextHolderUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author Narci.Lee
 *
 */
@RestController
@RequestMapping("/api")
@Slf4j
public class TestController {

	/**
	 * 
	 * @return R
	 */
	@GetMapping(value = "/precision")
	public R testPrecision() {
		R r = R.ok().put("maxLong", Long.MAX_VALUE);
		r.put("maxFloat", Float.MAX_VALUE);
		r.put("maxDouble", Double.MAX_VALUE);
		log.debug("maxLong:" + Long.MAX_VALUE);
		log.debug("maxFloat:" + Float.MAX_VALUE);
		log.debug("maxDouble:" + Double.MAX_VALUE);
		return r;
	}

	/**
	 * @param paramKey String
	 * @return R
	 */
	@GetMapping(value = "/cache")
	@Cacheable(value = "sysparamCache", key = "#paramKey")
	public R testCache(String paramKey) {
		log.debug("从数据库获取数据...");
		Map<String, String> map = new HashMap<String, String>();
		map.put("1", "ONE");
		map.put("2", "TWO");
		map.put("3", "THREE");
		R r = R.ok().put("current", map.get(paramKey));

		return r;
	}

	/**
	 * @param paramKey String
	 * @return R
	 */
	@GetMapping(value = "/cache2")
	@CacheEvict(value = "sysparamCache", key = "#paramKey")
	public R testCache2(String paramKey) {
		log.debug("从数据库获取数据...");
		Map<String, String> map = new HashMap<String, String>();
		map.put("1", "ONE 更新版");
		map.put("2", "TWO 更新版");
		map.put("3", "THREE 更新版");
		R r = R.ok().put("current", map.get(paramKey));

		return r;
	}

	/**
	 * @param request HttpServletRequest
	 * @return R
	 */
	@GetMapping(value = "/testSession")
	public R testSession(HttpServletRequest request) {
		// https://www.cnblogs.com/OnlyCT/p/8391274.html
		HttpSession session = request.getSession();
		Subject currentUser = SecurityUtils.getSubject();
		Session session2 = currentUser.getSession();
		HttpSession s = RequestContextHolderUtil.getSession();
		log.debug("session:" + session.getId());
		log.debug("session2:" + session2.getId());
		log.debug("session3:" + s.getId());
		return R.ok();
	}

}
