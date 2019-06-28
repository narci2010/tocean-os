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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
		log.debug("cache从数据库获取数据...:" + paramKey);
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
		log.debug("cache2从数据库获取数据...:" + paramKey);
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

	/**
	 * @param lisenceId Long
	 * @param o         TestObject
	 * @return R
	 */
	@PostMapping(value = "/testObject/{lisenceId}")
	public R saveO(@PathVariable("lisenceId") Long lisenceId, @RequestBody TestObject o) {
		// @RequestBody 前端就不用stringify转换，否则需要转换
		log.debug("lisenceId:" + lisenceId);
		R r = R.ok().put("name", o.getName());
		log.debug("name:" + o.getName());
		log.debug("age:" + o.getAge());
		log.debug("admin:" + o.isAdmin());
		log.debug("getColor:" + o.getAnOther().getColor());
		log.debug("getHeight:" + o.getAnOther().getHeight());
		return r;
	}

	/**
	 * @param o  TestObject
	 * @param o2 TestObject
	 * @return R
	 */
	@PostMapping(value = "/testObjects")
	public R savesO(@RequestBody TestObject o, TestObject o2) {
		// @RequestBody 前端就不用stringify转换，否则需要转换
		R r = R.ok().put("name", o.getName());
		log.debug("name:" + o.getName());
		log.debug("name2:" + o2.getName());
		log.debug("age:" + o.getAge());
		log.debug("admin:" + o.isAdmin());
		log.debug("getColor:" + o.getAnOther().getColor());
		log.debug("getHeight:" + o.getAnOther().getHeight());
		return r;
	}

	/**
	 * @param file 上传文件
	 * @param key  关键词
	 * @return R
	 */
	@PutMapping(value = "/upload")
	public R upload(@RequestBody MultipartFile file, String key) {
		R r = R.ok().put("name", key);
		log.debug("key:" + key);
		log.debug("file:" + file.getName());
		log.debug("filesize:" + file.getSize());
		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@PutMapping(value = "/testObject")
	public R updateO(TestObject o) {
		R r = R.ok().put("name", o.getName());
		log.debug("name:" + o.getName());
		log.debug("age:" + o.getAge());
		log.debug("admin:" + o.isAdmin());
		log.debug("getColor:" + o.getAnOther().getColor());
		log.debug("getHeight:" + o.getAnOther().getHeight());
		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@DeleteMapping(value = "/testObject")
	public R deleteO(TestObject o) {
		R r = R.ok().put("id", o.getName());
		log.debug("id:" + o.getName());

		return r;
	}

	/**
	 * @param lisenceId Long
	 * @param o         TestObject
	 * @param nums      int[]
	 * @return R
	 */
	@GetMapping(value = "/testObject/{lisenceId}")
	public R getO(@PathVariable("lisenceId") Long lisenceId, TestObject o, int[] nums) {
		R r = R.ok().put("id", o.getName());
		log.debug("lisenceId:" + lisenceId);
		log.debug("id:" + o.getName());
		for (int num : nums) {
			log.debug("int[]" + num);
		}
		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@RequestMapping(value = "/testObject", method = RequestMethod.HEAD)
	public R headO(TestObject o) {
		R r = R.ok().put("id", o.getName());
		log.debug("id:" + o.getName());

		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@RequestMapping(value = "/testObject", method = RequestMethod.OPTIONS)
	public R optionsO(TestObject o) {
		R r = R.ok().put("id", o.getName());
		log.debug("id:" + o.getName());

		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@RequestMapping(value = "/testObject", method = RequestMethod.PATCH)
	public R patchO(TestObject o) {
		R r = R.ok().put("id", o.getName());
		log.debug("id:" + o.getName());

		return r;
	}

	/**
	 * @param o TestObject
	 * @return R
	 */
	@RequestMapping(value = "/testObject", method = RequestMethod.TRACE)
	public R traceO(TestObject o) {
		R r = R.ok().put("id", o.getName());
		log.debug("id:" + o.getName());

		return r;
	}
}
