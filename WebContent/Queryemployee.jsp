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
<div  class="easyui-panel" title="员工查询" style="width:100%;height:100px;padding:10px;">

		<form>

			<label for="name"> 员工名字：</label><input
				class="easyui-textbox" style="width: 200px" name="name" id="name" />
			<a href="javascript:viod(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="submitForm()">查询</a>
		</form>
	</div>



	<table id="dg" style="width: 100%, heigh: 420px"></table>
	
		<div id="dlg" class="easyui-dialog" title="修改信息"
	     style="width:700px;height:600px;padding:10px"
	     data-options="closed:true,
	                   iconCls:'icon-edit',
	                   toolbar: '#dlg-toolbar',
					   buttons: '#dlg-buttons'
					   " >
	     <div>
	         <form id="ff" class="easyui-from" method="post">
	            <table cellpadding="10">
	                <tr>
	                    <td>员工编号:</td>
	                    <td><input id="id_update" class="easyui-textbox" disabled="disabled"
	                               type="text" name="id"
	                               data-options="required:true"></td>
	                    <td>部门:</td>
	                    <td><input  id="deptId_update" class="easyui-combobox" name="deptId"  
							data-options="url:'findDepts',
					    	method:'get',
					        valueField:'did',
					    	textField:'dname'"></td>
	                </tr>
	                <tr>
	                    <td>职位:</td>
	                    <td><input  id="jobId_update" class="easyui-combobox" name="jobId"  
							data-options="url:'findJobs',
					    	method:'get',
					        valueField:'jid',
					    	textField:'jname'"></td>
	                    <td>姓名:</td>
	                    <td><input id="name_update" class="easyui-textbox"
	                        type="text" name="name"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>银行卡号:</td>
	                    <td><input id="cardId_update" class="easyui-textbox"
	                        type="text" name="cardId"
	                        data-options="required:true"></td>
	                    <td>住址:</td>
	                    <td><input id="address_update" class="easyui-textbox"
	                        type="text" name="address"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>邮政编号:</td>
	                    <td><input id="postCode_update" class="easyui-textbox"
	                        type="text" name="postCode"
	                        data-options="required:true"></td>
	                    <td>座机号码:</td>
	                    <td><input id="tel_update" class="easyui-textbox"
	                        type="text" name="tel"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>电话号码:</td>
	                    <td><input id="phone_update" class="easyui-textbox"
	                        type="text" name="phone"
	                        data-options="required:true"></td>
	                    <td>QQ号:</td>
	                    <td><input id="qqNum_update" class="easyui-textbox"
	                        type="text" name="qqNum"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>邮箱:</td>
	                    <td><input id="email_update" class="easyui-textbox"
	                        type="text" name="email"
	                        data-options="required:true"></td>
	                    <td>性别:</td>
	                    <td>
	                        <select  id="sex_update" class="easyui-combobox" name="sex"  style="width:100px;height:30px" >
							<option value= "1">男</option>
							<option value= "2">女</option>
							</select></td>
	                </tr>
	                <tr>
	                    <td>政治面貌:</td>
	                    <td>
	                        <select  id="party_update" class="easyui-combobox" name="party"  style="width:100px;height:30px" >
							<option value= "1">有</option>
							<option value= "2">无</option>
							</select></td>
	                    <td>出生日期:</td>
	                    <td><input  id="birthday_update" class="easyui-datebox" name="birthday"></td>
	                </tr>
	                <tr>
	                    <td>种族:</td>
	                    <td><input id="race_update" class="easyui-textbox"
	                        type="text" name="race"
	                        data-options="required:true"></td>
	                    <td>学历:</td>
	                    <td><select  id="education_update" class="easyui-combobox" name="education"  style="width:100px;height:30px" >
							<option value= "无">无</option>
							<option value= "小学">小学</option>
							<option value= "初中">初中</option>
							<option value= "高中">高中</option>
							<option value= "中专">中专</option>
							<option value= "本科">本科</option>
							<option value= "专科">专科</option>
							<option value= "硕士研究生">硕士研究生</option>
							<option value= "博士研究生">博士研究生</option>
							</select></td>
	                </tr>
	                <tr>
	                    <td>专业:</td>
	                    <td><input id="speciality_update" class="easyui-textbox"
	                        type="text" name="speciality"
	                        data-options="required:true"></td>
	                    <td>兴趣:</td>
	                    <td><input id="hobby_update" class="easyui-textbox"
	                        type="text" name="hobby"
	                        data-options="required:true"></td>
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

			getData("${pageContext.request.contextPath}/findEmployees");
			getPageBar();

		})

		//模糊查询
		function submitForm() {
			//获得查询数据
			var name = $("#name").val();
			

			getData("${pageContext.request.contextPath}/findEmployeesLike",
					name);
		}

		//获取表格数据
		function getData(url, name) {
			$('#dg').datagrid({

				url : url,
				title : "员工",
				border : false,
				rownumbers : true,
				toolbar : '#tb',
				pagination : true,
				pageSize : "5",
				queryParams : {
					name : name,
				},
				pageList : [ 5, 10, 15, 20 ],
				singleSelect : true,
				columns : [ [ {
					field : 'id',
					value : 'id',
					checkbox : true,
					title : '选择',
					width : 50
				}, {
					field : 'dept',
					title : '部门',
					width : 100,
					formatter : function(value, row, index) {
						return row.dept.dname;
					}
				}, {
					field : 'job',
					title : '职位',
					width : 100,
					formatter : function(value, row, index) {
						return row.job.jname;
					}
				}, {
					field : 'name',
					title : '姓名',
					width : 80
				}, {
					field : 'cardId',
					title : '银行卡号',
					width : 80
				}, {
					field : 'address',
					title : '住址',
					width : 80
				}, {
					field : 'postCode',
					title : '邮政编号',
					width : 80
				}, {
					field : 'tel',
					title : '座机',
					width : 80
				}, {
					field : 'phone',
					title : '电话号码',
					width : 80
				}, {
					field : 'qqNum',
					title : 'QQ号',
					width : 80
				}, {
					field : 'email',
					title : '邮箱',
					width : 80
				}, {
					field : 'sex',
					title : '性别',
					width : 80
				}, {
					field : 'party',
					title : '政治面貌',
					width : 80
				}, {
					field : 'birthday',
					title : '出生日期',
					width : 80
				}, {
					field : 'race',
					title : '种族',
					width : 80
				}, {
					field : 'education',
					title : '学历',
					width : 80
				}, {
					field : 'speciality',
					title : '专业',
					width : 80
				}, {
					field : 'hobby',
					title : '兴趣',
					width : 80
				}, {
					field : 'remark',
					title : '备注',
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
							$.messager.confirm('确认是否删除','确定要删除('+row.name+')吗?',
									function(r){
								if(r){

									$.get("deleteEmployee?number="+row.id,null,function(data)
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
								$("#id_update").textbox('setValue',row.id);
								$("#deptId_update").combobox('setValue',row.deptId);
								$("#jobId_update").combobox('setValue',row.jobId);
								$("#name_update").textbox('setValue',row.name);
								$("#cardId_update").textbox('setValue',row.cardId);
								$("#address_update").textbox('setValue',row.address);
								$("#postCode_update").textbox('setValue',row.postCode);
								$("#tel_update").textbox('setValue',row.tel);
								$("#phone_update").textbox('setValue',row.phone);
								$("#qqNum_update").textbox('setValue',row.qqNum);
								$("#email_update").textbox('setValue',row.email);
								$("#sex_update").combobox('setValue',row.sex);
								$("#party_update").combobox('setValue',row.party);
								$("#birthday_update").datebox('setValue',row.birthday);
								$("#race_update").textbox('setValue',row.race);
								$("#education_update").combobox('setValue',row.education);
								$("#speciality_update").textbox('setValue',row.speciality);
								$("#hobby_update").textbox('setValue',row.hobby);
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
		var id = $("#id_update").val();
		var deptId = $("#deptId_update").val();
		var jobId = $("#jobId_update").val();
		var name = $("#name_update").val();
		var cardId = $("#cardId_update").val();
		var address = $("#address_update").val();
		var postCode = $("#postCode_update").val();
		var tel = $("#tel_update").val();
		var phone = $("#phone_update").val();
		var qqNum = $("#qqNum_update").val();
		var email = $("#email_update").val();
		var sex = $("#sex_update").val();
		var party = $("#party_update").val();
		var birthday = $("#birthday_update").val();
		var race = $("#race_update").val();
		var education = $("#education_update").val();
		var speciality = $("#speciality_update").val();
		var hobby = $("#hobby_update").val();
		var remark = $("#remark_update").val();
		
		
		//将得到的学生信息构成json数据
		var json = {
				"id" : id,
				"deptId" : deptId,
				"jobId" : jobId,
				"cardId" : cardId,
				"address" : address,
				"postCode" : postCode,
				"tel" : tel,
				"phone" : phone,
				"qqNum" : qqNum,
				"email" : email,
				"sex" : sex,
				"party" : party,
				"birthday" : birthday,
				"race" : race,
				"education" : education,
				"speciality" : speciality,
				"hobby" : hobby,
				"remark" : remark,			
		};
		//完成ajax操作
		$.post("updateEmployee",json,function(data){
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