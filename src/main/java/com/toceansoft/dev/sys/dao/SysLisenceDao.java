/*  
 * Copyright 2010-2019 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SysLisenceDao.java
 * 描述：  
 * 修改人： Tocean INC.
 * 修改时间：2019-02-15 16:39:57
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.dev.sys.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.toceansoft.dev.sys.entity.SysLisenceEntity;
import com.toceansoft.framework.dao.BaseDao;

/**
 * 
 * 
 * @author Tocean INC.
 */
@Mapper
public interface SysLisenceDao extends BaseDao<SysLisenceEntity> {
	/**
	 * 
	 * @param paramObject
	 *            Object
	 * @return int
	 */
	int countBySystemuid(Object paramObject);

	/**
	 * 
	 * @param paramString
	 *            String
	 * @return SysLisenceEntity
	 */
	SysLisenceEntity queryBySystemuid(String paramString);

	/**
	 * 
	 * @param paramLong
	 *            Long
	 * @param paramDate
	 *            Date
	 * @param dueDays
	 *            int
	 * @return int
	 */
	int updateGrantDateThruLisenceId(@Param("lisenceId") Long paramLong,
			@Param("grantDate") Date paramDate, @Param("dueDays") int dueDays);

	/**
	 * 
	 * @param systemName
	 *            String
	 * @param serverHost
	 *            String
	 * @return int
	 */
	int updateSystemNameThruServerHost(@Param("systemName") String systemName,
			@Param("serverHost") String serverHost);

	/**
	 * 
	 * @param serverUrl
	 *            String
	 * @param serverHost
	 *            String
	 * @return int
	 */
	int updateServerUrlThruServerHost(@Param("serverUrl") String serverUrl,
			@Param("serverHost") String serverHost);

}
