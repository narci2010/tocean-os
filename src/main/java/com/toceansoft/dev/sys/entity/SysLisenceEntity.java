/*  
 * Copyright 2010-2019 Tocean Group.  
 * 版权：商业代码，未经许可，禁止任何形式拷贝、传播及使用
 * 文件名：SysLisenceEntity.java
 * 描述：  
 * 修改人： Tocean INC.
 * 修改时间：2019-02-15 16:39:57
 * 跟踪单号：  
 * 修改单号：  
 * 修改内容：  
 */
package com.toceansoft.dev.sys.entity;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 
 * 
 * @author Tocean INC.
 */
@ApiModel(value = "SysLisenceEntity", description = "SysLisence实体")
public class SysLisenceEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "privatekey字段", name = "privatekey")
	private String privatekey;
	@ApiModelProperty(value = "publickey字段", name = "publickey")
	private String publickey;
	@ApiModelProperty(value = "privatekey2字段", name = "privatekey2")
	private String privatekey2;
	@ApiModelProperty(value = "publickey2字段", name = "publickey2")
	private String publickey2;
	@ApiModelProperty(value = "systemuid字段", name = "systemuid")
	private String systemuid;
	@ApiModelProperty(value = "signkey字段", name = "signkey")
	private String signkey;
	@ApiModelProperty(value = "lisenceId字段", name = "lisenceId")
	private Long lisenceId;
	@ApiModelProperty(value = "applydate字段", name = "applydate")
	private Date applydate;
	@ApiModelProperty(value = "grantdate字段", name = "grantdate")
	private Date grantdate;
	@ApiModelProperty(value = "usingtype字段", name = "usingtype")
	private String usingtype;

	@ApiModelProperty(value = "serverHost字段", name = "serverHost")
	private String serverHost;
	@ApiModelProperty(value = "systemName字段", name = "systemName")
	private String systemName;
	@ApiModelProperty(value = "serverUrl字段", name = "serverUrl")
	private String serverUrl;
	@ApiModelProperty(value = "dueDays字段", name = "dueDays")
	private int dueDays;

	public String getServerUrl() {
		return serverUrl;
	}

	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}

	public String getServerHost() {
		return serverHost;
	}

	public void setServerHost(String serverHost) {
		this.serverHost = serverHost;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public int getDueDays() {
		return dueDays;
	}

	public void setDueDays(int dueDays) {
		this.dueDays = dueDays;
	}

	/**
	 * 设置：私钥
	 * 
	 * @param privatekey
	 *            String
	 *
	 */
	public void setPrivatekey(String privatekey) {
		this.privatekey = privatekey;
	}

	/**
	 * 获取：私钥
	 * 
	 * @return String
	 *
	 */
	public String getPrivatekey() {
		return privatekey;
	}

	/**
	 * 设置：公钥
	 * 
	 * @param publickey
	 *            String
	 *
	 */
	public void setPublickey(String publickey) {
		this.publickey = publickey;
	}

	/**
	 * 获取：公钥
	 * 
	 * @return String
	 *
	 */
	public String getPublickey() {
		return publickey;
	}

	/**
	 * 设置：私钥2
	 * 
	 * @param privatekey2
	 *            String
	 *
	 */
	public void setPrivatekey2(String privatekey2) {
		this.privatekey2 = privatekey2;
	}

	/**
	 * 获取：私钥2
	 * 
	 * @return String
	 *
	 */
	public String getPrivatekey2() {
		return privatekey2;
	}

	/**
	 * 设置：公钥2
	 * 
	 * @param publickey2
	 *            String
	 *
	 */
	public void setPublickey2(String publickey2) {
		this.publickey2 = publickey2;
	}

	/**
	 * 获取：公钥2
	 * 
	 * @return String
	 *
	 */
	public String getPublickey2() {
		return publickey2;
	}

	/**
	 * 设置：系统唯一标识
	 * 
	 * @param systemuid
	 *            String
	 *
	 */
	public void setSystemuid(String systemuid) {
		this.systemuid = systemuid;
	}

	/**
	 * 获取：系统唯一标识
	 * 
	 * @return String
	 *
	 */
	public String getSystemuid() {
		return systemuid;
	}

	/**
	 * 设置：授权key
	 * 
	 * @param signkey
	 *            String
	 *
	 */
	public void setSignkey(String signkey) {
		this.signkey = signkey;
	}

	/**
	 * 获取：授权key
	 * 
	 * @return String
	 *
	 */
	public String getSignkey() {
		return signkey;
	}

	/**
	 * 设置：id
	 * 
	 * @param lisenceId
	 *            Long
	 *
	 */
	public void setLisenceId(Long lisenceId) {
		this.lisenceId = lisenceId;
	}

	/**
	 * 获取：id
	 * 
	 * @return Long
	 *
	 */
	public Long getLisenceId() {
		return lisenceId;
	}

	/**
	 * 设置：申请日期
	 * 
	 * @param applydate
	 *            Date
	 *
	 */
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}

	/**
	 * 获取：申请日期
	 * 
	 * @return Date
	 *
	 */
	public Date getApplydate() {
		return applydate;
	}

	/**
	 * 设置：授权日期
	 * 
	 * @param grantdate
	 *            Date
	 *
	 */
	public void setGrantdate(Date grantdate) {
		this.grantdate = grantdate;
	}

	/**
	 * 获取：授权日期
	 * 
	 * @return Date
	 *
	 */
	public Date getGrantdate() {
		return grantdate;
	}

	/**
	 * 设置：使用类型：dev开发，pro生成
	 * 
	 * @param usingtype
	 *            String
	 *
	 */
	public void setUsingtype(String usingtype) {
		this.usingtype = usingtype;
	}

	/**
	 * 获取：使用类型：dev开发，pro生成
	 * 
	 * @return String
	 *
	 */
	public String getUsingtype() {
		return usingtype;
	}
}
