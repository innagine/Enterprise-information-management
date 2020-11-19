<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
	<title>Binding to Remote Data - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./easyui/demo.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
</head>
</head>
<body>
<div class="easyui-panel" title="添加公告" style="width:100%;height:100%;padding:10px;">
	<form id="ff"  method="post">
	<tr>
	<td>标题：</td>
	<td><input class="easyui-textbox" type="text" name="title" 
		data-options="required:true,validType:'length[1,250]'" ></td>
	</tr>
	<tr>
	<br>
	<br>
	<td>主题：</td>
	<td><input class="easyui-textbox" type="text" name="name" 
		data-options="required:true,validType:'length[1,50]'" ></td>
	</tr>
	<br>
	<br>
	<textarea id="container" name="content" style="width:100%;height:400px;"></textarea>
	<tr>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()"  style="width:70px;height:30px">确认发布</a>
		</td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()"  style="width:70px;height:30px">重置</a>
		</td>
	</tr>
	</form>
	
</div>
</body>

<script type="text/javascript">
	var ue=UE.getEditor("container");
	
	setTimeout(function(){
		editor.execCommand('drafts')
	},2000);//自动保存
	
	//只有完全按照格式才能提交表单
	function submitForm(){
		$('#ff').form('submit',{
			url:'addNotice',
			onSubmit:function(){
				return $(this).form('enableValidation').form('validate');
			},
			success:function(data){
				if(data=="0"){
					$.messager.alert('温馨提示','发布失败','error');
				}
				if(data=="1"){
					$.messager.alert('温馨提醒','发布成功','info');
				}
			}
		});
	}
	function clearForm(){
		$('#ff').form("clear");
	}
</script>

</html>