package com.toceansoft.test;

import com.toceansoft.common.exception.ServiceException;
import com.toceansoft.common.utils.CDESCrypt;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestMain {

	public static void main(String[] args) throws ServiceException {
		String message = "{'mobile':'13612345678','password':'admin'}";
		String key = "tocean11";
		String result = CDESCrypt.encryptString(message, key);
		log.debug("result:" + result);

	}

}
