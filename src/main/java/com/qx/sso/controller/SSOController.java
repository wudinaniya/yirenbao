package com.qx.sso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qx.pojo.User;
import com.qx.sso.service.SSOService;
import com.qx.utils.ExtendJedis;

@Controller
@RequestMapping("/user")
public class SSOController {
	 
	@Autowired  //按类型自动注入
	private SSOService ssoService;
	
	@Autowired 
	private ExtendJedis extendJedis;
	
	@RequestMapping("/registUser")
	public String registerUser(User user,String repeatPassword,String mobilevalidatecode,String yzm,HttpSession session){
		
		System.out.println("user"+user+"\nrepeatPassword:"+repeatPassword+"\nmobilevalidatecode:"+mobilevalidatecode+"\n"
				+ "yzm:"+yzm);
		
		
		//		//判断用户信息是否符合格式
		//1 用户名必须是字母开头,不能是纯数字,不能有特殊符号/^[a-zA-Z0-9_]{6,24}$/
		boolean matchesName=user.getUnickname().matches("^[a-zA-Z0-9_]{6,24}$");
		
		//2 必须最少8位不能是纯数字   /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/
		boolean mathchesPassword=user.getUpassword().matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,22}$");
		//3 比对两次输入的密码是否一致
		boolean passwordCheck=user.getUpassword().equals(repeatPassword);
		//4 比较验证码
			//4.1 获取返回给客户端的验证码,获取输入的验证码
		String code=(String) session.getAttribute("code");
		session.removeAttribute("code");//取出后立刻删除,防止后退重新提交
		boolean codeCheck = yzm.equalsIgnoreCase(code);//因为返回的验证码可能出现大小写,我们比较的时候要忽略掉
		//5 比较手机验证码
		String mobilecodeinredis = extendJedis.get("a"+user.getUphonenumber());
		// 为了防止后退重复提交,应该取出来后立刻删除
		extendJedis.del("a"+user.getUphonenumber());
		boolean mobilevalidateCodeCheck = mobilevalidatecode.equalsIgnoreCase(mobilecodeinredis);
		//全部比较完成后,如果都是true代表验证完成
		System.out.println(matchesName+""+mathchesPassword+passwordCheck+codeCheck+mobilevalidateCodeCheck);
		if (matchesName&&mathchesPassword&&passwordCheck&&codeCheck&&mobilevalidateCodeCheck) {
			try {
				ssoService.addUser(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:/index.jsp";
		}
		
		return "/register";
	}	
}
