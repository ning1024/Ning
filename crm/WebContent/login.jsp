<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		li{
			list-style: none;
			
		}
		.menuA{
			text-decoration: none;
		}
		.panel{
			margin:150px auto;
		}
		.errorMessage{
			position:absolute;left:40%;top:5px;color:red;
			padding:0
		}
	</style>
</head>
<body style="width:100%;background:url(${pageContext.request.contextPath}/images/admin-login-bg.jpg) no-repeat -50px -150px;overflow:hidden">
	<form action="${pageContext.request.contextPath}/user_login.action" method="post">
	<div class="easyui-panel" title="用户登录" style="width:400px;padding:30px 60px;position:relative">
		<s:actionerror/>
		<div style="margin-bottom:20px;">
			<div style="padding:5px 0">用户名:</div>
			<input class="easyui-textbox" name="user_account" data-options="prompt:'请输入用户名...',validType:'name'" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div style="padding:5px 0">密&nbsp;&nbsp;码:</div>
			<input class="easyui-textbox" name="user_pass" type="password" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div style="padding:5px 0">验证码:</div>
			<input class="easyui-textbox" name="captcha" style="width:60%;height:32px;">
			<img alt="" class="captcha" src="${pageContext.request.contextPath}/captcha.jpg" class="captcha" style="width:40%;height:32px;float:right;">
		</div>
		
		<div>
			<input type="submit" value="登录" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">
		</div>
	</div>
	</form>
	<script type="text/javascript">
		/* 找到class属性为captcha的元素 */
		$(".captcha").click(function(){
			//每次点击图片时，让图片的地址随机改变，地址一变，就会发送新的请求
			$(this).attr("src","${pageContext.request.contextPath}/captcha.jpg?"+Math.random());
		});
	</script>
</body>
</html>