package com.qx.utils;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.dsna.util.images.ValidateCode;

public class CodeUtils {
	//图片验证码
	public static void createCode(HttpSession session,HttpServletResponse response) throws IOException{
		ValidateCode validateCode=new ValidateCode(105,38,4,20);
		String code = validateCode.getCode();//验证码
		response.setContentType("image/*");
		ImageIO.write(validateCode.getBuffImg(), "jpeg", response.getOutputStream());
		session.setAttribute("code", code);
	}
	
	//文字验证码
	public static String createCode(){
		ValidateCode validateCode=new ValidateCode(105,38,4,20);
		String code=validateCode.getCode(); //验证码
		return code;
		
	}
}
