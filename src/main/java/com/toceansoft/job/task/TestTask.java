/*  
 * Copyright 2010-2017 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：TestTask.java
 * 描述：  
 * 修改人： Narci.Lee  
 * 修改时间：2017年11月22日  
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.job.task;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import com.toceansoft.sys.entity.SysUserEntity;
import com.toceansoft.sys.service.SysUserService;

import lombok.extern.slf4j.Slf4j;

/**
 * 测试定时任务(演示Demo，可删除)
 * 
 * testTask为spring bean的名称
 * 
 * @author Narci.Lee
 * @email admin@toceansoft.com
 * 
 */
// @Component("testTask")
@Slf4j
public class TestTask {

	@Autowired
	private SysUserService sysUserService;

	// 定时任务只能接受一个参数；如果有多个参数，使用json数据即可
	/**
	 * 
	 * @param params
	 *            String
	 */
	public void test(String params) {
		log.info("我是带参数的test方法，正在被执行，参数为：" + params);

		try {
			Thread.sleep(1000L);
		} catch (InterruptedException e) {
			log.debug(e.getMessage());
		}

		SysUserEntity user = sysUserService.queryObject(1L);
		log.debug(ToStringBuilder.reflectionToString(user));

	}

	/**
	 * 
	 */
	public void test2() {
		log.debug("我是不带参数的test2方法，正在被执行");
	}
}
