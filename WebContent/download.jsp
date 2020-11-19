<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./easyui/demo.css">
    <script type="text/javascript" src="./easyui/jquery.min.js">
    </script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js">
    </script>
</head>
<body>
	<div class="easyui-panel" title="文件下载" style="width:700px;height:500px;">
		<div style="padding:40px 60px 20px 60px;">
			<c:forEach items="${list }" var="li">
			<table>
				<tr>
					<td>
						<form action="download" method="post">
							<input type="hidden" name="filename" value="${li }">
								${li }
							<input type="submit" value="下载">
						</form>
					</td>
					
					<td>
						<form action="delete" method="post" id="form">
							<input type="hidden" name="filename" value="${li }">
							<input type="button" value="删除"  onclick="submitForm()">
						</form>
					</td>
				</tr>
			</table>		
				<div class="divide" ></div>
			</c:forEach>
		</div>
	</div>
</body>

<script>
	function submitForm(){
		$('#form').form('submit',{
			url:'delete',	
			success:function(data){
				window.location.href="getFiles";
			}
		});
}
</script>

</html>