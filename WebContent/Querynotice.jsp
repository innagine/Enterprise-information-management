<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./easyui/demo.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
</head>
<body>
<form action="CheckNotice">
<div  class="easyui-panel" title="请输入公告号" style="width:100%;height:100%;padding:10px;font-size:18px">
	<tr>
		<td>公告号：</td>
		<td><input class="easyui-textbox" type="text" name="id" 
			style="width:300px" data-options="required:true,validType:'length[1,11]'"></td>
	</tr>
	<br>
	<br>
	<input class="easyui-linkbutton" style="width:70px;height:30px" type="submit" value="查询">
	</form>
</div>
	<br>
	<br>
<div  class="easyui-panel" title="内容栏" style="width:100%;height:100%;padding:10px;">
	<h2>标题：${title}</h2>
	<h3>主题：${name}</h3>
	<br>
	公告内容：${content}
</div>
	
	<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
	 <script type="text/javascript">
	  window.onload = function(){
	      var ue = UE.getEditor('editor');
	  };
	  </script>

</body>
</html>