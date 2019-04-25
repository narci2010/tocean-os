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
package com.toceansoft;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
//1.0
//import org.springframework.boot.web.support.SpringBootServletInitializer;
//2.0
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
//import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.toceansoft.common.DisableSSLCertificateCheckUtil;
import com.toceansoft.config.ToceanBanner;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 
 * @author Narci.Lee
 *
 */
// 多线程支持
// @EnableAsync
@EnableCaching
@EnableSwagger2
@EnableTransactionManagement
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan("com.toceansoft")
@ServletComponentScan("com.toceansoft")
public class Application extends SpringBootServletInitializer {
	/**
	 * 
	 * @param args
	 *            String[]
	 * @return
	 */
	public static void main(final String[] args) {
		DisableSSLCertificateCheckUtil.disableChecks();
		SpringApplication application = new SpringApplication(Application.class);
		application.setBanner(new ToceanBanner());
		application.run(args);

	}

	// 支持打包成war

	// springboot2.x机制与1.x不兼容，既然用springboot，建议不用
	/**
	 * 
	 * @param application
	 *            SpringApplicationBuilder
	 * @return SpringApplicationBuilder
	 */
	@Override
	public SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

}
