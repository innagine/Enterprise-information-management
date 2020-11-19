<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>upload</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./easyui/demo.css">
    <script type="text/javascript" src="./easyui/jquery.min.js">
    </script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js">
    </script>
</head>
<body>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="文件上传" style="width:400px;padding:30px 70px 50px 70px">
		<form method="post" multiple="multiple" enctype="multipart/form-data" id="form">
			<div style="margin-bottom:20px">
				<div>上传者:</div>
				<input class="easyui-textbox" name="name" value="${user.username}" style="width:100%">
			</div>
			<div style="margin-bottom:20px">
				<div>文件:</div>
				<input class="easyui-filebox" name="upload" buttonText="选择文件" multiple="true" data-options="prompt:'选择文件...'" style="width:100%">
			</div>
			<div>
				<input class="easyui-linkbutton" type="button" value="上传文件"  onclick="submitForm()" style="width:250px;height:30px">
			</div>
		</form>
	</div>
	
</body>

<script>
	function submitForm(){
		if (form.name.value==''||form.upload.value==''){}
		else{
			$('#form').form('submit',{
				url:'upload',	
				success:function(data){
					if(data == "1"){
						$.messager.alert('上传成功','恭喜你，上传成功！','info');
					}else{
						$.messager.alert('上传失败','对不起，上传失败！','error');
					}
				}
			});
		}
}
</script>
</html>