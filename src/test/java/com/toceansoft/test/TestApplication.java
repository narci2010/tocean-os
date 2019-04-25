package com.toceansoft.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.toceansoft.sys.entity.SysUserEntity;
import com.toceansoft.sys.utils.PasswordHelper;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class TestApplication {
	@Autowired
	private PasswordHelper passwordHelper;

	@Test
	public void test1() {
		SysUserEntity user = new SysUserEntity();
		user.setUsername("admin");
		user.setPassword("admin");
		passwordHelper.encryptPassword(user);
		log.debug("salt:" + user.getSalt());
		log.debug("password:" + user.getPassword());
	}

}
