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

<div id="p" class="easyui-panel" title="添加员工信息" style="width:100%;height:100%;padding:10px;">
	<form id="ff" method="post">
	<table cellpadding = "5">
	<tr>
		<td>员工编号:</td>
		<td><input class="easyui-textbox" type="text" name="id" 
			data-options="required:true
			,validType:'length[1,11]'"></td>
		<td>部门:</td>
		<td><input class="easyui-combobox" name="deptId"  
			data-options="url:'findDepts',
    		 method:'get',
    		 valueField:'did',
    	 	textField:'dname'" value="请选择部门"></td>
	</tr>
	<tr>
		<td>职位:</td>
		<td><input class="easyui-combobox" name="jobId"  
			data-options="url:'findJobs',
    		 method:'get',
    		 valueField:'jid',
    	 	textField:'jname'" value="请选择职位"></td>
		<td>姓名:</td>
		<td><input class="easyui-textbox" type="text" name="name" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
	</tr>
	<tr>
		<td>银行卡号:</td>
		<td><input class="easyui-textbox" type="text" name="cardId" 
			data-options="required:true
			,validType:'length[1,20]'"  style="width:300px;height:30px"></td>
		<td>住址:</td>
		<td><input class="easyui-textbox" type="text" name="address" 
			data-options="required:true
			,validType:'length[1,50]'"  style="width:300px;height:30px"></td>
	</tr>
	<tr>
		<td>邮政编号:</td>
		<td><input class="easyui-textbox" type="text" name="postCode" 
			data-options="required:true
			,validType:'length[1,10]'"></td>
		<td>座机:</td>
		<td><input class="easyui-textbox" type="text" name="tel" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
	</tr>
	<tr>
		<td>电话号码:</td>
		<td><input class="easyui-textbox" type="text" name="phone" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
		<td>QQ号:</td>
		<td><input class="easyui-textbox" type="text" name="qqNum" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
	</tr>
	<tr>
		<td>邮箱:</td>
		<td><input class="easyui-textbox" type="text" name="email" 
			data-options="required:true
			,validType:'length[1,20]'"></td>
		<td>性别:</td>
		<td><select class="easyui-combobox" name="sex"  style="width:100px;height:30px" >
			<option value= "1">男</option>
			<option value= "2">女</option>
			</select></td>
	</tr>
	<tr>
		<td>有无政治面貌:</td>
		<td><select class="easyui-combobox" name="party"  style="width:150px;height:30px" >
			<option value= "1">有</option>
			<option value= "2">无</option>
			</select></td>
		<td>出生日期:</td>
		<td><input class="easyui-datebox" name="birthday"></td>
	</tr>
	<tr>
		<td>种族:</td>
		<td><input class="easyui-textbox" type="text" name="race" 
			data-options="required:true
			,validType:'length[1,10]'"></td>
		<td>学历:</td>
		<td><select class="easyui-combobox" name="education"  style="width:100px;height:30px" >
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
		<td><input class="easyui-textbox" type="text" name="speciality" 
			data-options="required:true
			,validType:'length[1,15]'"></td>
		<td>兴趣:</td>
		<td><input class="easyui-textbox" type="text" name="hobby" 
			data-options="required:true
			,validType:'length[1,30]'"></td>
	</tr>
	<tr>
		<td>备注:</td>
		<td><input class="easyui-textbox" type="text" name="remark" 
			data-options="required:true
			,validType:'length[0,50]'"></td>
	</tr>
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
				url:'addEmployee',
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