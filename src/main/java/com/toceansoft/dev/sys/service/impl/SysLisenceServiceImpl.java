/*  
 * Copyright 2010-2019 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SysLisenceServiceImpl.java
 * 描述：  
 * 修改人： Tocean INC.
 * 修改时间：2019-02-15 16:39:57
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.dev.sys.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toceansoft.common.exception.RRException;
import com.toceansoft.dev.sys.dao.SysLisenceDao;
import com.toceansoft.dev.sys.entity.SysLisenceEntity;
import com.toceansoft.dev.sys.service.SysLisenceService;

/**
 * 
 * 
 * @author Tocean INC.
 */
@Service("sysLisenceService")
public class SysLisenceServiceImpl implements SysLisenceService {
	@Autowired
	private SysLisenceDao sysLisenceDao;

	@Override
	public SysLisenceEntity queryObject(Long lisenceId) {
		SysLisenceEntity entity = sysLisenceDao.queryObject(lisenceId);
		if (entity == null) {
			throw new RRException("该记录不存在：" + lisenceId);
		}
		return entity;
	}

	@Override
	public List<SysLisenceEntity> queryList(Map<String, Object> map) {
		return sysLisenceDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysLisenceDao.queryTotal(map);
	}

	@Override
	public void save(SysLisenceEntity sysLisence) {
		sysLisenceDao.save(sysLisence);
	}

	@Override
	public void update(SysLisenceEntity sysLisence) {
		sysLisenceDao.update(sysLisence);
	}

	@Override
	public void delete(Long lisenceId) {
		sysLisenceDao.delete(lisenceId);
	}

	@Override
	public void deleteBatch(Long[] lisenceIds) {
		sysLisenceDao.deleteBatch(lisenceIds);
	}

	@Override
	public SysLisenceEntity queryBySystemuid(String paramString) {
		return this.sysLisenceDao.queryBySystemuid(paramString);
	}

	@Override
	public int countBySystemuid(Object paramObject) {
		return this.sysLisenceDao.countBySystemuid(paramObject);
	}

	@Override
	public void grant(Long paramLong, Date paramDate, int dueDays) {
		this.sysLisenceDao.updateGrantDateThruLisenceId(paramLong, paramDate, dueDays);
	}

	@Override
	public void setupSystemName(String systemName, String serverHost) {
		sysLisenceDao.updateSystemNameThruServerHost(systemName, serverHost);

	}

	@Override
	public void setupServerUrl(String serverUrl, String serverHost) {
		sysLisenceDao.updateServerUrlThruServerHost(serverUrl, serverHost);
	}

}
