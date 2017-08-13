package com.qx.utils;

import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.JedisPool;

public class ExtendJedis {
	
	@Autowired
	private JedisPool jedisPool;
	
	public void set(String key,String value){
		jedisPool.getResource().set(key, value);
	};
	public String get(String key){
		return jedisPool.getResource().get(key);
		
	};
	
	//设置有效期
	public void expire(String key,int seconds){
		jedisPool.getResource().expire(key, seconds);
	}; 
	
	//删除指定的key
	public void del(String key){
		jedisPool.getResource().del(key);
	}; 
}
