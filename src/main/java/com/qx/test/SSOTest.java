package com.qx.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qx.mapper.UserMapper;
import com.qx.pojo.User;
import com.qx.sso.service.SSOService;
import com.qx.sso.service.impl.SSOServiceImpl;

public class SSOTest {
	
	@Test
	public void test() throws Exception {
		ApplicationContext context=new ClassPathXmlApplicationContext("classpath:spring/app*.xml");
		SSOService ssoService=context.getBean(SSOService.class);
		User user=new User();
		user.setUnickname("娜娜");
		user.setUpassword("000111");
		user.setUphonenumber("13173278989");
		user.setUregistdate(new Date());
		ssoService.addUser(user);
		
	}
}
