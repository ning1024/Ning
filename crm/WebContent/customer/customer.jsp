<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({    
		    url:'../datagrid_data.json',    
		    columns:[[    
		        {field:'productid',title:'productid',width:100},    
		        {field:'productname',title:'productname',width:100},    
		        {field:'unitcost',title:'unitcost',width:100,align:'right'}    
		    ]],
		    striped:true,
		    pagination:true,
		    toolbar: [{
				iconCls: 'icon-add',
				handler: function(){
					$('#win').window('open');  // open a window    
}
			}]
		}); 
	}) 

	</script>
</head>
<body >
	<table id="dg"></table> 
	
	<!-- 添加活动窗口，默认是隐藏的 --> 
	<div id="win" class="easyui-window" title="添加账户" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closeed:true">   
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>客户名称：</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Email:</td>
	    			<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Subject:</td>
	    			<td><input class="easyui-textbox" type="text" name="subject" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Message:</td>
	    			<td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Language:</td>
	    			<td>
	    				<select class="easyui-combobox" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en" selected="selected">English</option><option value="et">Estonian</option><option value="fi">Finnish</option><option value="fr">French</option><option value="de">German</option><option value="el">Greek</option><option value="ht">Haitian Creole</option><option value="he">Hebrew</option><option value="hi">Hindi</option><option value="mww">Hmong Daw</option><option value="hu">Hungarian</option><option value="id">Indonesian</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="ko">Korean</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="no">Norwegian</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan="2">
	    				<input class="easyui-linkbutton" type="submit" value="提交" name="subject" style="width:100%;heigth:32px;"></input>
	    			</td>
	    		</tr>
	    	</table>
	    </form>    
	</div> 
</body>
</html>