package com.qx.sso.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qx.mapper.UserMapper;
import com.qx.pojo.User;
import com.qx.sso.service.SSOService;

@Service
public class SSOServiceImpl implements SSOService{
	
	//@Autowired
	@Resource
	private UserMapper UserMapper;

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		user.setUregistdate(new Date());
		UserMapper.addUser(user);
	}

}
