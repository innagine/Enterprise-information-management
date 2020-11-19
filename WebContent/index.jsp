<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="logincss/css/square.css">
<link rel="stylesheet" type="text/css" href="logincss/css/styles_yellow.css"> 
<link rel="stylesheet" type="text/css" href="logincss/css/supersized.css">
<script type="text/javascript" src="logincss/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="logincss/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="logincss/js/supersized-init.js"></script>

<style type="text/css">
	p{ color:darkred; font-size:12px;text-align:center;margin-bottom:10px; }
	a{text-align:center;}
	button{font-size:15px;font-weight:bold;}
	#btnSendCode1{
				width: 90px;
				height: 30px;  
				padding: 0 5px;
				margin: 0;
				border:1px solid white;
				font-size: 14px;
				text-align: center;
				background: transparent;
				border-radius: 30px;
				color: #FAFFF0;
				/* float:left; */
				margin:10px;	 
			}
</style>	
<title>Login</title>
</head>
<body>
<div class="jq22-container" style="padding:100px;">
		<div class="login-wrap" id="particles-js">
			<div class="login-html">
			<p id="tip">${tip}</p>
			<p id="teltip"></p>
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab" style="margin-left:45%;">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up">
				<label for="tab-2" class="tab"></label>
				<div class="login-form">
					<!-- 登录 -->
					<div class="sign-in-htm">
					<form action="${pageContext.request.contextPath}/login" method="post" id="lf">
						<div class="group">
							<label for="number" class="label">账号 </label>
							<input id="number" type="text" class="input" name="number" value="${user.number}"  required="required" placeholder="账号为纯数字">
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="pass" type="password" class="input" data-type="password" name="password" placeholder="请输入密码"  required="required" >
						</div>
						<div class="group">
							<label for="code_input" class="label">验证码</label>
							<input type="text" id="code_input" value="" class="input"  placeholder="请输入验证码" required="required" />
							<input type="hidden" id="checkyzm" value="" />
							<!-- 验证码 -->
							<br>
							<div id="v_container" style="width: 200px;height: 50px;margin:0 auto;"></div>
							
						</div>						
						<div class="group">
							<br>
							<a href="javascript:void(0)" id="log_button"  class="button">确认登录</a>
						</div>
						<div class="hr"></div>
						</form>
					</div>
					<!-- 登录end -->
				</div>
			</div>
		</div>
	</div>
	
</body>
<!-- scripts -->
<script src="logincss/js/particles.min.js"></script>
<script src="logincss/js/app.js"></script>
<script src="logincss/js/gVerify.js"></script>
<script>
/* $("#tip").text(""); */
$(function(){
	var verifyCode = new GVerify("v_container");//验证码
	
	$("#log_button").click(function(){
		if($("#number").val()==""||$("#pass").val()==""){
			$("#tip").text("账户和密码不能为空！");
		}
		else{
			var res = verifyCode.validate(document.getElementById("code_input").value);
		if(res){
			$("#lf").submit();
			//return true;
		}else{			
			$("#tip").text("验证码有误");
			//return false;
		}}
	})
})
				
</script>

</html>