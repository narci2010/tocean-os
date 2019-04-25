/*  
 * Copyright 2010-2019 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SysLisenceController.java
 * 描述：  
 * 修改人： Tocean INC.
 * 修改时间：2019-02-15 16:39:57
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.dev.sys.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.codec.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.toceansoft.common.exception.RRException;
import com.toceansoft.common.json.JacksonUtil;
import com.toceansoft.common.utils.IPUtils;
import com.toceansoft.common.utils.PageUtils;
import com.toceansoft.common.utils.Query;
import com.toceansoft.common.utils.R;
import com.toceansoft.common.utils.RSAEnhanceUtils;
import com.toceansoft.common.validator.Judge;
import com.toceansoft.common.vo.QueryVo;
import com.toceansoft.dev.sys.entity.SysLisenceEntity;
import com.toceansoft.dev.sys.service.SysLisenceService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * 
 * @author Tocean INC.
 */
@RestController
@Slf4j
@RequestMapping("/sys")
public class SysLisenceController {
	@Autowired
	private SysLisenceService sysLisenceService;

	/**
	 * 列表
	 *
	 * @param queryVo
	 *            QueryVo
	 * @return R
	 */
	@GetMapping("/syslisence")
	@RequiresPermissions("sys:syslisence:list")
	public R list(QueryVo queryVo) {
		// 查询列表数据
		log.debug("enter list.");
		Query query = new Query(queryVo);

		List<SysLisenceEntity> sysLisenceList = sysLisenceService.queryList(query);
		int total = sysLisenceService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(sysLisenceList, total, query.getLimit(),
				query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 查询（指定对象）
	 * 
	 * @param lisenceId
	 *            Long
	 * @return R
	 */
	@GetMapping("/syslisence/{lisenceId}")
	@RequiresPermissions("sys:syslisence:info")
	public R info(@PathVariable("lisenceId") Long lisenceId) {
		log.debug("enter info.");
		SysLisenceEntity sysLisence = sysLisenceService.queryObject(lisenceId);

		return R.ok().put("sysLisence", sysLisence);
	}

	/**
	 * 保存
	 * 
	 * @param sysLisence
	 *            SysLisenceEntity
	 * @return R
	 */
	@PostMapping("/syslisence")
	@RequiresPermissions("sys:syslisence:save")
	public R save(@RequestBody SysLisenceEntity sysLisence) {
		log.debug("enter save.");
		sysLisenceService.save(sysLisence);

		return R.ok();
	}

	/**
	 * 修改
	 * 
	 * @param sysLisence
	 *            SysLisenceEntity
	 * @return R
	 */
	@PutMapping("/syslisence")
	@RequiresPermissions("sys:syslisence:update")
	public R update(@RequestBody SysLisenceEntity sysLisence) {
		log.debug("enter update.");
		sysLisenceService.update(sysLisence);

		return R.ok();
	}

	/**
	 * 删除
	 * 
	 * @param lisenceIds
	 *            Long[]
	 * @return R
	 */
	@DeleteMapping("/syslisence")
	@RequiresPermissions("sys:syslisence:delete")
	public R delete(@RequestBody Long[] lisenceIds) {
		log.debug("enter delete.");
		sysLisenceService.deleteBatch(lisenceIds);

		return R.ok();
	}

	/**
	 * 
	 * @param json
	 *            String
	 * @return R
	 */
	@PostMapping({ "/syslisence/register" })
	public R register(@RequestBody String json) {
		log.debug("enter register:" + json);
		SysLisenceEntity sysLisence = null;
		try {
			sysLisence = (SysLisenceEntity) JacksonUtil.json2Bean(json, SysLisenceEntity.class);
		} catch (JsonParseException e) {
			throw new RRException("解释Json失败。", e);
		} catch (JsonMappingException e) {
			throw new RRException("映射Json失败。", e);
		} catch (IOException e) {
			throw new RRException("IO读写失败。", e);
		}
		SysLisenceEntity sysLisenceEntity = this.sysLisenceService
				.queryBySystemuid(sysLisence.getSystemuid());
		String signKey = null;
		if (sysLisenceEntity == null) {
			Date today = new Date();
			sysLisence.setApplydate(today);
			sysLisence.setGrantdate(today);
			sysLisence.setUsingtype("DEV");
			String originalSystemUid = RSAEnhanceUtils.decryptByPublicKey(sysLisence.getSystemuid(),
					sysLisence.getPublickey());
			log.debug("originalSystemUid:" + originalSystemUid);
			sysLisence.setServerHost(this.getServerHost(originalSystemUid));
			signKey = RSAEnhanceUtils.sign(originalSystemUid, sysLisence.getPrivatekey2());
			sysLisence.setSignkey(signKey);
			this.sysLisenceService.save(sysLisence);
		} else {
			signKey = sysLisenceEntity.getSignkey();
		}
		return R.ok(signKey);
	}

	/**
	 * 
	 * @param json
	 *            String
	 * @return R
	 */
	@PostMapping({ "/syslisence/registerAgain" })
	public R registerAgain(@RequestBody String json) {
		log.debug("enter register:" + json);
		SysLisenceEntity sysLisence = null;
		try {
			sysLisence = (SysLisenceEntity) JacksonUtil.json2Bean(json, SysLisenceEntity.class);
		} catch (JsonParseException e) {
			throw new RRException("解释Json失败。", e);
		} catch (JsonMappingException e) {
			throw new RRException("映射Json失败。", e);
		} catch (IOException e) {
			throw new RRException("IO读写失败。", e);
		}
		SysLisenceEntity sysLisenceEntity = this.sysLisenceService
				.queryBySystemuid(sysLisence.getSystemuid());
		String signKey = null;
		R r = R.ok();
		if (sysLisenceEntity == null) {
			Date today = new Date();
			sysLisence.setApplydate(today);
			// sysLisence.setGrantdate(today);
			sysLisence.setUsingtype("DEP");
			String originalSystemUid = RSAEnhanceUtils.decryptByPublicKey(sysLisence.getSystemuid(),
					sysLisence.getPublickey());
			log.debug("originalSystemUid:" + originalSystemUid);
			sysLisence.setServerHost(this.getServerHost(originalSystemUid));
			signKey = RSAEnhanceUtils.sign(originalSystemUid, sysLisence.getPrivatekey2());
			sysLisence.setSignkey(signKey);
			this.sysLisenceService.save(sysLisence);
		} else {
			signKey = sysLisenceEntity.getSignkey();
			if (sysLisenceEntity.getGrantdate() != null) {
				r.put("granted", "true");
				r.put("dueDays", sysLisenceEntity.getDueDays());
			}
		}
		r.put("msg", signKey);
		return R.ok(signKey);
	}

	/**
	 * 
	 * @param json
	 *            String
	 * @return R
	 */
	@PostMapping({ "/syslisence/apply" })
	public R apply(@RequestBody String json) {
		log.debug("enter apply:" + json);
		SysLisenceEntity sysLisence = null;
		try {
			sysLisence = (SysLisenceEntity) JacksonUtil.json2Bean(json, SysLisenceEntity.class);
		} catch (JsonParseException e) {
			throw new RRException("解释Json失败。", e);
		} catch (JsonMappingException e) {
			throw new RRException("映射Json失败。", e);
		} catch (IOException e) {
			throw new RRException("IO读写失败。", e);
		}
		SysLisenceEntity sysLisenceEntity = this.sysLisenceService
				.queryBySystemuid(sysLisence.getSystemuid());
		String signKey = null;
		R r = R.ok();
		if (sysLisenceEntity == null) {
			Date today = new Date();
			sysLisence.setApplydate(today);

			sysLisence.setUsingtype("PRO");
			String originalSystemUid = RSAEnhanceUtils.decryptByPublicKey(sysLisence.getSystemuid(),
					sysLisence.getPublickey());
			log.debug("originalSystemUid:" + originalSystemUid);
			sysLisence.setServerHost(this.getServerHost(originalSystemUid));
			signKey = RSAEnhanceUtils.sign(originalSystemUid, sysLisence.getPrivatekey2());
			sysLisence.setSignkey(signKey);
			this.sysLisenceService.save(sysLisence);
		} else {
			signKey = sysLisenceEntity.getSignkey();
			if (sysLisenceEntity.getGrantdate() != null) {
				r.put("granted", "true");
				r.put("dueDays", sysLisenceEntity.getDueDays());
			}
		}
		r.put("msg", signKey);
		return r;
	}

	/**
	 * 
	 * @param lisenceId
	 *            Long
	 * @param dueDays
	 *            int
	 * @return R
	 */
	@PutMapping({ "/syslisence/grant/{lisenceId}" })
	@RequiresPermissions({ "sys:syslisence:grant" })
	public R grant(@PathVariable("lisenceId") Long lisenceId, int dueDays) {
		log.debug("enter grant.");
		Date grantDate = new Date();
		this.sysLisenceService.grant(lisenceId, grantDate, dueDays);
		return R.ok();
	}

	/**
	 * 
	 * 
	 * @param systemName
	 *            String
	 * @return R
	 */
	@PutMapping({ "/syslisence/systemname/{systemName}" })
	public R updateSystemName(@PathVariable("systemName") String systemName) {
		String serverHost = IPUtils.getRemoteIpAddr();
		this.sysLisenceService.setupSystemName(systemName, serverHost);
		return R.ok();
	}

	/**
	 * 
	 * 
	 * @param serverUrl
	 *            String
	 * @return R
	 */
	@PutMapping({ "/syslisence/systemurl/{serverUrl}" })
	public R updateServerUrl(@PathVariable("serverUrl") String serverUrl) {
		String serverHost = IPUtils.getRemoteIpAddr();
		try {
			// log.debug("serverUrl:" + URLDecoder.decode(Base64.decodeToString(serverUrl),
			// "UTF-8"));
			String url = URLDecoder.decode(Base64.decodeToString(serverUrl), "UTF-8");
			this.sysLisenceService.setupServerUrl(url, serverHost);
		} catch (UnsupportedEncodingException e) {
			log.debug("操作系统不支持UTF-8编码。");
		}

		return R.ok();
	}

	private String getServerHost(String origin) {
		String ip = "";
		if (!Judge.isBlank(origin)) {
			String[] ips = origin.split("_");
			if (!Judge.isEmtpy(ips)) {
				ip = ips[0];
			}
		}
		return ip;
	}
}
