<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link href="css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script src="script/login.js" type="text/javascript"></script>
<style type="text/css">
	#userName{
		width: 250px;
		height: 40px;
		vertical-align: middle;
		border: 1px solid #b4b9bd;
		border-radius: 3px;
		line-height: 40px;
	}

</style>
</head>
<body>
<header>
	
  <script type="text/javascript">

  	/* 提交表单 */
	function test(){
		$("form").trigger("submit");
	}

  	/* 更新图片验证码 */
	function changeImage(){
		var src=$("#yzm").attr("src")+"?date="+new Date().getTime();
		$("#yzm").attr("src",src);
	}

	function getMobileValidateCode(){
		//首先获取到输入的手机号
		var number=$("#phone").val(); //获取输入的手机号
		if (number&&number.length==11) {
			//1 发起异步请求
			//获取返回值,返回值就是验证码, 注意我没写datatype
			$.ajax({
				url:"${pageContext.request.contextPath}/code/getMobileValidateCode.action?uphonenumber="+number,
				type:"POST",
				success:function(data){
					alert(data);
				}
			})
		}else{
			alert("号码不对,起来重睡");
		}
	}
	
  </script>

  <div class="header-top min-width">
    <div class="container fn-clear"> <strong class="fn-left">咨询热线：400-668-6698<span class="s-time">服务时间：9:00 - 18:00</span></strong>
      <ul class="header_contact">
        <li class="c_1"> <a class="ico_head_weixin" id="wx"></a>
          <div class="ceng" id="weixin_xlgz" style="display: none;">
            <div class="cnr"> <img src="images/code.png"> </div>
            <b class="ar_up ar_top"></b> <b class="ar_up_in ar_top_in"></b> </div>
        </li>
        <li class="c_2"><a href="#" target="_blank" title="官方QQ" alt="官方QQ"><b class="ico_head_QQ"></b></a></li>
        <li class="c_4"><a href="#" target="_blank" title="新浪微博" alt="新浪微博"><b class="ico_head_sina"></b></a></li>
      </ul>
      <ul class="fn-right header-top-ul">
        <li> <a href="index.jsp" class="app">返回首页</a> </li>
        <li>
          <div class=""><a href="register.jsp" class="c-orange" title="免费注册">免费注册</a></div>
        </li>
        <li>
          <div class=""><a href="login.jsp" class="js-login" title="登录">登录</a></div>
        </li>
      </ul>
    </div>
  </div>
  <div class="header min-width">
    <div class="container">
      <div class="fn-left logo"> <a class="" href="index.html"> <img src="images/logo.png"  title=""> </a> </div>
      <ul class="top-nav fn-clear">
        <li class="on"> <a href="index.html">首页</a> </li>
        <li> <a href="list.html" class="">我要投资</a> </li>
        <li> <a href="我要借款.html" class="">我要借款</a> </li>
        <li> <a href="帮助中心.html">安全保障</a> </li>
        <li class="top-nav-safe"> <a href="个人中心首页.html">我的账户</a> </li>
        <li> <a href="公司简介.html">关于我们</a> </li>
      </ul>
    </div>
  </div>
</header>
<!--注册-->
<div class="wrap">
  <div class="tdbModule register">
    <div class="registerTitle">注册账户</div>
    <div class="registerLc1">
      <p class="p1">填写账户信息</p>
      <p class="p2">验证手机信息</p>
      <p class="p3">注册成功</p>
    </div>
    
    <form id="form" action="${pageContext.request.contextPath }/user/registUser.action" method="post">
	    <div class="registerCont">
	      <ul>
	        <li><span class="dis">用户名:</span>
	          <input type="text" name="unickname" id="userName" maxlength="24" tabindex="1">
	          <span id="userNameAlt" data-info="6-24个字符，字母开头，字母、数字下划线组成">6-24个字符，字母开头，字母、数字下划线组成</span></li>
	        <li><span class="dis">密码:</span>
	          <input type="password" name="upassword" id="password" class="input _password" maxlength="24" tabindex="1">
	          <span id="passwordAlt" data-info="6-24个字符，英文、数字组成，区分大小写">6-24个字符，英文、数字组成，区分大小写</span></li>
	        <li><span class="dis">确认密码:</span>
	          <input type="password" name="repeatPassword" id="repeatPassword" class="input _repeatPassword" maxlength="24" tabindex="1">
	          <span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span></li>
	        <li> <span class="dis">验证码:</span>
	          <input type="text" id="jpgVerify" class="input input1 _yanzhengma" name="yzm" maxlength="4" tabindex="1">
	          <img src="code/getImageValidateCode.action" alt="验证码" style="cursor:pointer;" id="yzm" class="valign"> <a class="look blue _changeCapcherButton" id="look" href="javascript:void(0);" onclick="changeImage()">看不清？换一张</a> <span class="info" id="jpgVerifys" data-info="请输入手机验证码"></span> </li>
	        <li class="uphonenumber"> <span class="dis">手机号码:</span>
	          <input type="text" class="input _phoneNum" id="phone" name="uphonenumber" tabindex="1" maxlength="11">
	          <a href="javascript:void(0);" class="button radius1 _getkey" id="sendPhone" onclick="getMobileValidateCode()">获取验证码</a> <span id="phoneJy" data-info="请输入您的常用电话">请输入您的常用电话</span></li>
	        <li class="uphonenumber"><span class="dis">短信验证码:</span>
	          <input id="phonVerify" type="text" name="mobilevalidatecode" class="input input1  _phonVerify" data-_id="phonVerify" tabindex="1">
	          <span class="info" id="phonVerifys" data-info="请输入手机验证码">请输入手机验证码</span></li>
	        <li> <span class="dis">推 荐 人:</span>
	          <input type="text" name="ureferrer" class="input input1 _invist">
	          <span class="_invist_msg">请填写推荐人账户名，如无推荐人请留空</span> </li>
	        <li class="agree">
	          <input name="protocol" id="protocol" type="checkbox" value="" checked="checked">
	          我同意《<a href="#" target="_black">亿人宝注册协议</a>》 <span id="protocolAlt" data-info="请查看协议">请查看协议</span></li>
	        <li class="btn"><a href="javascript:void(0);" class="radius1 _ajaxSubmit" onclick="test()">下一步</a></li>
	      </ul>
	    </div>
  	</form>
  </div>
</div>
<!--网站底部-->
<div id="footer" class="ft">
  <div class="ft-inner clearfix">
    <div class="ft-helper clearfix">
      <dl>
        <dt>关于我们</dt>
        <dd><a href="公司简介.html">公司简介</a><a href="管理团队.html">管理团队</a><a href="网站公告.html">网站公告</a></dd>
      </dl>
      <dl>
        <dt>相关业务</dt>
        <dd><a href="list.html">我要投资</a><a href="我要借款.html">我要借款</a></dd>
      </dl>
      <dl>
        <dt>帮助中心</dt>
        <dd><a href="帮助中心.html">新手入门</a><a href="个人中心首页.html">我的账户</a><a href="list.html">债权转让</a></dd>
      </dl>
      <dl>
        <dt>联系我们</dt>
        <dd><a href="联系我们.html">联系我们</a></dd>
      </dl>
    </div>
    <div class="ft-service">
      <dl>
        <dd>
          <p><strong>400-660-1268</strong><br>
            工作日 9:00-22:00<br>
            官方交流群:<em>12345678</em><br>
            工作日 9:00-22:00 / 周六 9:00-18:00<br>
          </p>
          <div class="ft-serv-handle clearfix"><a class="icon-hdSprite icon-ft-sina a-move a-moveHover" title="亿人宝新浪微博" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover" title="亿人宝腾讯微博" target="_blank" href="#"></a><a class="icon-ft-qun a-move a-moveHover" title="亿人宝QQ群" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-email a-move a-moveHover mrn" title="阳光易贷email" target="_blank" href="mailto:xz@yirenbao.com"></a></div>
        </dd>
      </dl>
    </div>
    <div class="ft-wap clearfix">
      <dl>
        <dt>官方二维码</dt>
        <dd><span class="icon-ft-erweima"><img src="images/code.png" style="display: inline;"></span></dd>
      </dl>
    </div>
  </div>
  <div class="ft-record">
    <div class="ft-approve clearfix"><a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-1 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-2 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-3 fadeIn-2s" target="_blank" href="#"></a></div>
    <div class="ft-identity">©2015 亿人宝 All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;安徽省亿人宝投资管理有限公司&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn/">皖ICP备12345678号-1</a></div>
  </div>
</div>
</body>
</html>