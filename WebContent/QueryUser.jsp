<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Binding to Remote Data - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="./easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="./easyui/demo.css">
<script type="text/javascript" src="./easyui/jquery.min.js"></script>
<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div  class="easyui-panel" title="用户查询" style="width:100%;height:100px;padding:10px;">

		<form>

			<label for="number"> 账号：</label><input class="easyui-numberbox"
				style="width: 200px" name="number" id="number" /> <label for="name"> 姓名：</label><input
				class="easyui-textbox" style="width: 200px" name="name" id="name" />
			<label for="phone"> 手机号：</label><input class="easyui-numberbox"
				style="width: 200px" name="phone" id="phone" /> <label for="role"> 角色：</label>
			<input class="easyui-combobox" name="roleId" id="roleId"
				data-options="
					url:'findRoles',
					method:'get',
					valueField:'rid',
					textField:'rname',
					panelHeight:'auto'
			">
			<a href="javascript:viod(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="submitForm()">查询</a>
		</form>
	</div>



	<table id="dg" style="width: 100%, heigh: 420px"></table>
	
		<div id="dlg" class="easyui-dialog" title="修改信息"
	     style="width:400px;height:450px;padding:10px"
	     data-options="closed:true,
	                   iconCls:'icon-edit',
	                   toolbar: '#dlg-toolbar',
					   buttons: '#dlg-buttons'
					   " >
	     <div>
	         <form id="ff" class="easyui-from" method="post">
	            <table cellpadding="10">
	                <tr>
	                    <td>账号:</td>
	                    <td><input id="number_update" class="easyui-textbox" disabled="disabled"
	                               type="text" name="number"
	                               data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>姓名:</td>
	                    <td><input id="username_update" class="easyui-textbox"
	                        type="text" name="userName"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>密码:</td>
	                    <td><input id="password_update" class="easyui-textbox"
	                               type="password" name="password"
	                               data-options="required:true,validType:'length[6,16]'"></td>
	                </tr>
	                <tr>
	                    <td>电话:</td>
	                    <td><input id="phone_update" class="easyui-textbox"
	                               type="text" name="phone"
	                               data-options="required:true
				                    ,validType:'length[11,11]'"></td>
	                </tr>
	                <tr>
	                <td>角色:</td>
	                    <td><input  id="roleId_update" class="easyui-combobox" name="roleId"  
							data-options="url:'findRoles',
					    	method:'get',
					        valueField:'rid',
					    	textField:'rname'"></td>
	                </tr>
	                <tr>
	                    <td>备注:</td>
	                    <td><input id="remark_update" class="easyui-textbox" type="text" name="remark"
	                               data-options="required:true
				                   ,validType:'length[0,50]'">
	                    </td>
	                </tr>
	            </table>
	         </form>
	     </div>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

	<script type="text/javascript">
		$(function() {

			getData("${pageContext.request.contextPath}/findUser");
			getPageBar();

		})

		//模糊查询
		function submitForm() {
			//获得查询数据
			var number = $("#number").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var roleId = $("#roleId").val();
			

			getData("${pageContext.request.contextPath}/findUsersLike",
					number, name, phone, roleId);
		}

		//获取表格数据
		function getData(url, number, username, phone, roleId) {
			$('#dg').datagrid({

				url : url,
				title : "用户",
				border : false,
				rownumbers : true,
				toolbar : '#tb',
				pagination : true,
				pageSize : "5",
				queryParams : {
					number : number,
					username : username,
					phone : phone,
					roleId : roleId
				},
				pageList : [ 5, 10, 15, 20 ],
				singleSelect : true,
				columns : [ [ {
					field : 'id',
					value : 'number',
					checkbox : true,
					title : '选择',
					width : 50
				}, {
					field : 'number',
					title : '账号',
					width : 80
				}, {
					field : 'username',
					title : '姓名',
					width : 80
				}, {
					field : 'password',
					title : '密码',
					width : 80
				}, {
					field : 'phone',
					title : '手机号',
					width : 220
				}, {
					field : 'role',
					title : '角色',
					width : 100,
					formatter : function(value, row, index) {
						return row.role.rname;
					}
				}, {
					field : 'createdate',
					title : '注册时间',
					width : 220
				} ] ]
			})
		}
		function getPageBar() {
			var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid
			pager.pagination({
				buttons : [ {
					iconCls : 'icon-no',
					text:'删除',
					handler : function() {
						var row = $('#dg').datagrid('getSelected');
						if(row!=null){
							$.messager.confirm('确认是否删除','确定要删除('+row.username+')吗?',
									function(r){
								if(r){

									$.get("deleteUser?number="+row.number,null,function(data)
									{
										//没弹出来
										alert("2");
										$.messager.alert('结果',data,'info',function(){
											window.location,reload();
										});
									});
								}
							});
						}else{
							$.messager.alert('温馨提示','请选择一个用户','info'	);
						}
					}
				}, {
					iconCls : 'icon-edit',
					text:'修改',
					handler : function() {
						var row = $('#dg').datagrid('getSelected');
						if(row != null){
							$('dlg').dialog('open');
							var row = $('#dg').datagrid('getSelected');
							if(row != null){
								//读取方式，根据row的字段row.xxx
								$("#number_update").textbox('setValue',row.number);
								$("#username_update").textbox('setValue',row.username);
								$("#password_update").textbox('setValue',row.password);
								$("#roleId_update").combobox('setValue',row.roleId);
								$("#phone_update").textbox('setValue',row.phone);
								$("#remark_update").textbox('setValue',row.remark);
								$("#dlg").dialog('open');
							}
						}else{
							$.messager.alert('温馨提示','请选择一个用户','info');
						}
						//alert('edit');
					}
				} ]
			});
		}
		
	//修改后保存数据的方法
	function save(){
		//获得控件中的数据
		var number = $("#number_update").val();
		var username = $("#username_update").val();
		var password = $("#password_update").val();
		var roleId = $("#roleId_update").val();
		var phone = $("#phone_update").val();
		var remark = $("#remark_update").val();
		
		//将得到的学生信息构成json数据
		var json = {
				"number" : number,
				"username" : username,
				"password" : password,
				"roleId" : roleId,
				"phone" : phone,
				"remark" : remark,
		};
		//完成ajax操作
		$.post("updateUser",json,function(data){
			var info = "对不起，修改失败！";
			var pic = "error"
			if (data == "1"){
				info = "修改成功！";
				pic = "info"
			}
			$.messager.alert('结果', info ,pic ,function(){
				window.location.reload();
			});
		});
	}
		
</script>


</body>
</html>