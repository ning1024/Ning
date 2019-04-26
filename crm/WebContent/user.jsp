<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.easyui.min.js"></script>

	<script type="text/javascript">
		$(function(){
			
			//异步加载数据字典中的数据
    		//参数1：请求的服务器地址
    		//参数2：请求服务器时携带的数据
    		//参数3：请求成功后，服务器返回的数据
    		//参数4：期望服务器返回的数据类型，字符串、json
    		$.post("baseDict_findByTypeCode.action",
    				{"dict_type_code":"006"},
    				function(result){
    					console.log(result);
    					$('#cust_level').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    					$('#cust_level2').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    				},
    				"json"
    		);
    		$.post("baseDict_findByTypeCode.action",
    				{"dict_type_code":"002"},
    				function(result){
    					console.log(result); 
    					$('#cust_source').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    					$('#cust_source2').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    				},
    				"json"
    		);
    		$.post("baseDict_findByTypeCode.action",
    				{"dict_type_code":"001"},
    				function(result){
    					console.log(result); 
    					$('#cust_industry').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    					$('#cust_industry2').combobox({
    						data:result,
    						valueField:'dict_id',
    						textField:'dict_item_name'
    					});
    				},
    				"json"
    		);
			
			$('#dg').datagrid({    
				url:'customer_findByPage.action',    
			    columns:[[    
			        {field:'cust_id',title:'客户序号',width:100},    
			        {field:'cust_name',title:'客户姓名',width:100},
			        {field:'baseDictIndustry',title:'客户行业',width:100,
			        	formatter:function(value,row,index){
			        		return row.baseDictIndustry.dict_item_name;
			        	}	
			        },
			        {field:'baseDictLevel',title:'客户级别',width:100,
			        	formatter:function(value,row,index){
			        		return row.baseDictLevel.dict_item_name;
			        	}	
			        },
			        {field:'baseDictSource',title:'客户来源',width:100,
			        	formatter:function(value,row,index){
			        		return row.baseDictSource.dict_item_name;
			        	}	
			        },
			        {field:'cust_phone',title:'固定电话',width:100},
			        {field:'cust_mobile',title:'移动电话',width:100},
			        {field:'xxx',title:'操作',width:100,
			        	formatter: function(value,row,index){
							return "<a href='#' onclick='edit("+row.cust_id+")'>编辑</a> | <a href='#' onclick='del("+row.cust_id+")'>删除</a>";
						}
					},
			        
			    ]],
			 	//显示分页工具条
		        pagination:true,
		        // 初始化的页数
		        pageNumber:1,
		        // 每页显示记录数:
		        pageSize:3,
		        // 分页工具条中下拉列表中的值：
		        pageList:[3,5,10],
		        // 隔行换色
		        striped:true,
		        toolbar: [{
		    		iconCls: 'icon-add',
		    		handler: function(){
		    			// 弹出窗口:
						$("#win").window("open");
		        		
		    		}
		    	}]
			});  

		})

		function fitCoulms(){
			$('#dg').datagrid({
		        fitColumns:true
		    });
		}
		//添加客户
		function save(){
			
			if($("#filebox_file_id_1").val() == ""){
				alert("请上传资质！");
				return;
			}
			
			//将普通表单转换为ajax方式提交表单
			$('#addForm').form({    
			    url:"customer_save.action",

			    success:function(data){    
			        console.log(data) 
			        var dataObject = eval("("+data+")");
			        //消息显示在顶部中间
			        $.messager.show({
			        	title:"提示消息",
			        	msg:dataObject.msg,
			        	timeout:1000,
			        	showType:'fade',
			        	style:{
			        		right:'',
			        		top:document.body.scrollTop+document.documentElement.scrollTop,
			        		bottom:''
			        	}
			        });
					//关闭窗口
			        $('#win').window('close');  // close a window 
			        $('#dg').datagrid('reload');// 重新载入当前页面数据
			    }    
			});
			$('#addForm').submit();
		}
		
		//删除用户
		function del(cust_id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){
				if(r){
					$.post(
						"customer_delete.action",
						{cust_id:cust_id},
						function(data){
							//服务器响应的是一个json格式的字符串
							var data = eval('(' + data + ')');
							//消息显示在顶部中间
							$.messager.show({
								title:'提示消息',
								msg:data.msg,
								showType:'fade',
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop,
									bottom:''
								}
							});
							$('#dg').datagrid('reload');// 重新载入当前页面数据
						}
					)
				}
			})
		}
		
		//编辑客户
		function edit(cust_id){
			$("#editWin").window("open");
			
			//发送ajax请求，根据客户id查询客户的信息
			$.post(
				"customer_findById.action",
				{cust_id:cust_id},
				function(data){
					var data = eval("("+data+")");
					console.log(data);
					$('#editForm').form('load',{
						cust_name:data.cust_name,
						cust_phone:data.cust_phone,
						cust_mobile:data.cust_mobile,
						cust_id:data.cust_id
					});
					//如果客户有图像，则显示出来
					if(data.cust_iamge != ""){
						$("#cust_image").css({display:"block"});
					}
					
					//回显客户来源，客户级别、客户行业
					$('#cust_level2').combobox('setValue', data.baseDictLevel.dict_id);
					$('#cust_source2').combobox('setValue', data.baseDictSource.dict_id);
					$('#cust_industry2').combobox('setValue', data.baseDictIndustry.dict_id);
				}	
			);	
		}
		
		//更新客户
		function update(){
			
			//使普通表单转换成ajax提交风湿的表单
			$('#editForm').form({    
			    url:"customer_update.action",     
			    success:function(data){    
			    	var data = eval('(' + data + ')');    
			    	console.log(data);
			    	$.messager.show({
			    		title:'提示消息',
			    		msg:data.msg,
			    		showType:'fade',
			    		timeout:1000,
			    		style:{
			    			right:'',
			    			top:document.body.scrollTop+document.documentElement.scrollTop,
			    			bottom:''
			    		}
			    	});
			    	$('#editWin').window('close');  //关闭窗口
			    	$('#dg').datagrid('reload');    // 重新载入当前页面数据  
			    }    
			});    
			// submit the form    
			$('#editForm').submit();  
		}

	</script>
</head>
<body>
	<table id="dg"></table>  
	<!-- 添加客户的表单，默认是隐藏的 -->
	<div id="win" class="easyui-window" title="添加客户" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
	    <form id="addForm" method="post" enctype="multipart/form-data">   
		    <table>
			    <tbody>   
			        <tr>   
			        	<td><label for="name">客户名称:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_name" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">客户资质:</label>   </td>
			            <td>			            	
		        			<input class="easyui-filebox" name="upload" data-options="prompt:'选择文件...'"  style="width: 160px;"/>   
			            </td>
			        </tr>   
			         <tr>   
			         	<td>
			         		<label for="email">客户级别:</label>   
			         	</td>
			            <td>
			            	<select id="cust_level" name="baseDictLevel.dict_id" style="width:160px">
			            	
			            	</select>			            	
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">信息来源:</label>   </td>
			            <td>			            	
		        			<select id="cust_source" name="baseDictSource.dict_id" style="width:160px">
			            	
			            	</select>  
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">所属行业:</label>   </td>
			            <td>			            	
		        			<select id="cust_industry" name="baseDictIndustry.dict_id" style="width:160px">
			            	
			            	</select>   
			            </td>
			        </tr>
			        <tr>   
			        	<td><label for="name">固定电话:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_phone" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">移动电话:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_mobile" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>
			        	<td colspan="2">
			        		<input type="button" onclick="save()" data-options="iconCls:'icon-save'" value="保存">
			        		<input type="reset"  data-options="iconCls:'icon-undo'" value="重置">
			        	</td>
			        </tr>     
			    </tbody>   
			</table>  

		</form>  
	    
	</div>  
	
	<!-- 编辑客户的表单，默认是隐藏的 -->
	<div id="editWin" class="easyui-window" title="修改客户" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
	    <form id="editForm" method="post" enctype="multipart/form-data"> 
	    	<input type="hidden" name="cust_id">  
		    <table>
			    <tbody>   
			        <tr>   
			        	<td><label for="name">客户名称:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_name" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">客户资质:</label>   </td>
			            <td>
			            	<div id="cust_image" style="display: none;">
			            		<img  src="">
			            		<span style="color:red">再次上传会覆盖原图</span>
			            	</div>			            	
		        			<input class="easyui-filebox" name="upload" data-options="prompt:'选择文件...'"  style="width: 160px;"/>   
			            </td>
			        </tr>   
			         <tr>   
			         	<td>
			         		<label for="email">客户级别:</label>   
			         	</td>
			            <td>
			            	<select id="cust_level2" name="baseDictLevel.dict_id" style="width:160px">
			            	
			            	</select>			            	
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">信息来源:</label>   </td>
			            <td>			            	
		        			<select id="cust_source2" name="baseDictSource.dict_id" style="width:160px">
			            	
			            	</select>  
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">所属行业:</label>   </td>
			            <td>			            	
		        			<select id="cust_industry2" name="baseDictIndustry.dict_id" style="width:160px">
			            	
			            	</select>   
			            </td>
			        </tr>
			        <tr>   
			        	<td><label for="name">固定电话:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_phone" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>   
			        	<td><label for="name">移动电话:</label>   </td>
			            <td>			            	
		        			<input class="easyui-validatebox" type="text" name="cust_mobile" data-options="required:true" />   
			            </td>
			        </tr> 
			        <tr>
			        	<td colspan="2">
			        		<input type="button" onclick="update()" data-options="iconCls:'icon-save'" value="保存">
			        		<input type="reset"  data-options="iconCls:'icon-undo'" value="重置">
			        	</td>
			        </tr>     
			    </tbody>   
			</table>  

		</form>  
	    
	</div>  
</body>
</html>