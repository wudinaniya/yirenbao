package com.qx.sso.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qx.utils.CodeUtils;
import com.qx.utils.ExtendJedis;

@Controller
@RequestMapping("/code")
public class ImageController {
	
	@Autowired
	private ExtendJedis extendJedis; //用于存放验证码信息的redus工具类

	@RequestMapping("/getImageValidateCode")
	public void createCode(HttpSession session,HttpServletResponse response){
		//创建验证码
		//将验证码返回
		//将验证码存放到session中
		try {
			CodeUtils.createCode(session, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@ResponseBody  /*此注解的作用: 将返回值作为响应正文进行返回,而不是返回字符串*/
	@RequestMapping("/getMobileValidateCode")
	public String getMobileValidateCode(String uphonenumber){
		String code = CodeUtils.createCode(); //验证码
		extendJedis.set("a"+uphonenumber, code);
		extendJedis.expire("a"+uphonenumber, 300); //设置验证码的有效期为5分钟
		return code;
		
	}
}
