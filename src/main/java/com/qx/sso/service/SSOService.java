package com.qx.sso.service;


import com.qx.pojo.User;

public interface SSOService {
	/**
	 * 注册用户
	 * @param user
	 * @throws Exception
	 */
	public void addUser(User user) throws Exception;
}
