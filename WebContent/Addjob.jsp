<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<title>Binding to Remote Data - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./easyui/demo.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
</head>
<body>

<div id="p" class="easyui-panel" title="添加职位" style="width:100%;height:100%;padding:10px;">
	<form id="ff" method="post">
	<table cellpadding = "5">
	<tr>
		<td>职位编号:</td>
		<td><input class="easyui-textbox" type="text" name="jid" 
			data-options="required:true
			,validType:'length[1,21]'"></td>
	</tr>
	<tr>
		<td>职位名:</td>
		<td><input class="easyui-textbox" type="text" name="jname" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
	</tr>
	<tr>
		<td>职位说明:</td>
		<td><input class="easyui-textbox" type="text" name="jremark" 
			data-options="required:true
			,validType:'length[1,50]'"></td>
	</tr>
	<tr>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()"  style="width:70px;height:30px">确认添加</a>
		</td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()"  style="width:70px;height:30px">重置</a>
		</td>
	</tr>
	</table>
	</form>

</div>
</body>

<script>

	//只有完全按照格式才能提交表单
		function submitForm(){
			$('#ff').form('submit',{
				url:'addJob',
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				},
				success:function(data){
					if(data=="0"){
						$.messager.alert('温馨提示','添加失败','error');
					}
					if(data=="1"){
						$.messager.alert('温馨提醒','添加成功','info');
					}
				}
			});
		}
		function clearForm(){
			$('#ff').form("clear");
		}

</script>
</html>