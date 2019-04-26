<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/js/jquery.easyui.min.js"></script>
	<style type="text/css">
		.menuA{
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$(".menuA").click(function(){
				var content = this.innerHTML;    //获取超链接的内容
				var url = this.href;			 //获取超链接的地址
				
				//选项卡切换，add表示新增选项卡页面
				//判断如果已经打开了，就不要创建，而是直接选中即可
				if($('#tt').tabs('exists',content)){
					$('#tt').tabs('select',content)
				}else{
					$('#tt').tabs('add',{
					    title:content,    
					    content:createURL(url),    
					    closable:true
					});
				}
				return false;
			})
		})
		
		function createURL(url){
			return "<iframe src='"+url+"' style='width:100%;height:90%;border:none;'>";
		}
	</script>
</head>
<body>
	<div id="cc" class="easyui-layout" data-options="fit:true">   
	    <div data-options="region:'north',title:'CRM客户关系系统',split:true" style="height:100px;">
	    	<p style="float:right;padding:0 10px">
	    	<s:property value="#session.existUser.user_name"/>，欢迎光临</p>
	    	
	    </div>   
	       
	    
	    <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;">
	    	<div id="aa" class="easyui-accordion" data-options="fit:true">   
			    <div title="用户管理" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">   
			    	
			    	<ul class="easyui-tree">
			    		<li><a href="${pageContext.request.contextPath }/user.jsp" class="menuA">客户列表</a></li>
			    	</ul>
			    </div>   
			    <div title="商品管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
			    	
			    </div>   
			    <div title="Title3">   
			    	
			    </div>   
			</div>
	    
	    </div>   
	    <div data-options="region:'center',title:''">
	    	<div id="tt" class="easyui-tabs" data-options="fit:true">   
			    <div title="数据展示" style="padding:20px;display:none;">   
			        	欢迎使用    
			    </div>   
			   
			</div>
	    </div>
	</div>  
	
</body>
</html>