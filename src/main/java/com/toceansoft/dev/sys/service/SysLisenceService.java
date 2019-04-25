/*  
 * Copyright 2010-2019 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SysLisenceService.java
 * 描述：  
 * 修改人： Tocean INC.
 * 修改时间：2019-02-15 16:39:57
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.dev.sys.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.toceansoft.dev.sys.entity.SysLisenceEntity;

/**
 * 
 * 
 * @author Tocean INC.
 */
public interface SysLisenceService {

	/**
	 * 查询（指定对象）
	 * 
	 * @param lisenceId
	 *            Long
	 * @return SysLisenceEntity
	 */
	SysLisenceEntity queryObject(Long lisenceId);

	/**
	 * 列表
	 *
	 * @param map
	 *            Map<String, Object>
	 * @return List<SysLisenceEntity>
	 */
	List<SysLisenceEntity> queryList(Map<String, Object> map);

	/**
	 * 总记录数量
	 *
	 * @param map
	 *            Map<String, Object>
	 * @return int
	 */
	int queryTotal(Map<String, Object> map);

	/**
	 * 保存
	 * 
	 * @param sysLisence
	 *            SysLisenceEntity
	 *
	 */
	void save(SysLisenceEntity sysLisence);

	/**
	 * 修改
	 * 
	 * @param sysLisence
	 *            SysLisenceEntity
	 *
	 */
	void update(SysLisenceEntity sysLisence);

	/**
	 * 删除
	 * 
	 * @param lisenceId
	 *            Long
	 *
	 */
	void delete(Long lisenceId);

	/**
	 * 批量删除
	 * 
	 * @param lisenceIds
	 *            Long[]
	 *
	 */
	void deleteBatch(Long[] lisenceIds);

	/**
	 * 
	 * @param paramString
	 *            String
	 * @return SysLisenceEntity
	 */
	SysLisenceEntity queryBySystemuid(String paramString);

	/**
	 * 
	 * @param paramObject
	 *            Object
	 * @return int
	 */
	int countBySystemuid(Object paramObject);

	/**
	 * 
	 * @param paramLong
	 *            Long
	 * @param paramDate
	 *            Date
	 * @param dueDays
	 *            int
	 */
	void grant(Long paramLong, Date paramDate, int dueDays);

	/**
	 * 
	 * @param systemName
	 *            String
	 * @param serverHost
	 *            String
	 * 
	 */
	void setupSystemName(String systemName, String serverHost);

	/**
	 * 
	 * @param serverUrl
	 *            String
	 * @param serverHost
	 *            String
	 * 
	 */
	void setupServerUrl(String serverUrl, String serverHost);
}
