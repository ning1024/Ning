<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		.menuA{
			text-decoration: none;
		}
		.panel{
			margin:150px auto;
		}
	</style>
</head>
<body style="width:100%;background:url(images/admin-login-bg.jpg) no-repeat -50px -150px;overflow:hidden">
	<form action="${pageContext.request.contextPath}/user_register.action" method="post">
	<div class="easyui-panel" title="用户注册" style="width:400px;padding:30px 60px;">
		<div style="margin-bottom:20px;">
			<div style="padding:5px 0">账号:</div>
			<input class="easyui-textbox" name="user_account" data-options="prompt:'请输入账号...',validType:'name'" style="width:100%;height:32px">
		</div>
		<div style="margin-bottom:20px">
			<div style="padding:5px 0">密&nbsp;&nbsp;码:</div>
			<input class="easyui-textbox" name="user_pass" type="password" style="width:100%;height:32px">
		</div>
		
		<div style="margin-bottom:20px;">
			<div style="padding:5px 0">用户名:</div>
			<input class="easyui-textbox" name="user_name" data-options="prompt:'请输入用户名...',validType:'name'" style="width:100%;height:32px">
		</div>
		
		<div>
			<input type="submit" value="注册" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">
		</div>
	</div>
	</form>
	
</body>
</html>