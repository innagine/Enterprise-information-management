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

<div id="p" class="easyui-panel" title="添加用户" style="width:100%;height:100%;padding:10px;">
	<form id="ff" method="post">
	<table cellpadding = "5">
	<tr>
		<td>账号:</td>
		<td><input id="number" class="easyui-textbox" type="text" name="number" 
			data-options="required:true
			,validType:'testnumber'"></td>
	</tr>
	<tr>
		<td></td>
		<td><span id="sp" style="color: #ff0000;font-size:12px"></span></td>
	</tr>
	<tr>
		<td>密码:</td>
		<td><input id="pwd" class="easyui-passwordbox" name="password" iconWidth="28" 
			data-options="required:true
			,validType:'length[6,16]'"></td>
		<td>再次输入密码:</td>
		<td><input id="rpwd" class="easyui-passwordbox" name="rpwd" iconWidth="28" 
			data-options="required:true"
			validType="equals['#pwd']"></td>
	</tr>
	<tr>
		<td>电话:</td>
		<td><input id="phone" class="easyui-textbox" type="text" name="phone" 
			data-options="required:true
			,validType:'telephone'"></td>
		<td>角色:</td>
		<td><input class="easyui-combobox" name="roleId"  
		data-options="url:'findRoles',
    	 method:'get',
    	 valueField:'rid',
    	 textField:'rname'" value="请选择角色"></td>
	</tr>
	<tr>
		<td>用户名:</td>
		<td><input class="easyui-textbox" type="text" name="username" 
			data-options="required:true
			,validType:'length[3,20]'"></td>
		<td>备注:</td>
		<td><input class="easyui-textbox" type="text" name="remark" 
			data-options="required:true
			,validType:'length[0,50]'"></td>
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

//加载完成事件
$(function(){
	//帐号键盘抬起事件
	$('#number').textbox({
		inputEvents:$.extend({}, $.fn.textbox.defaults.inputEvents,{
			keyup:function(event){
				//在键盘抬起事件中完成ajax操作，也就是完成后台数据查询
				var numbervalue = $("#number").next().children().val();
				var json = {"number":numbervalue};
				//用post方法完成ajax提交数据url,json,data:返回值
				$.post("numberAjax",json,function(data){
					if(data=="1"){
						$("#sp").text("该用户已被注册");
					}else{
						$("#sp").text("");
					}
			});
		   }
		})
	});
	
	//手机号格式限制
	$.extend($.fn.validatebox.defaults.rules, {
	    telephone: {
			validator: function(value){
				var reg = /^1[3,4,5,6,7,8][0-9]{9}$/;//正则表达式
				return reg.test(value);
			},
				message: '请输入正常的手机号'
	    	}
		});

	
	//帐号注册格式限制
	$.extend($.fn.validatebox.defaults.rules,{
		testnumber:{
			validator:function(value){
				var reg = /^[1-9]\d{0,9}$/;//正则表达式
				return reg.test(value);
			},
			message:'不能以0开头，必须10位数以内的数字'
		}
	});
	
	//密码格式限制
	$.extend($.fn.validatebox.defaults.rules,{
		testnumber:{
			validator:function(value){
				var reg = /^[1-9]\d{0,9}$/;//正则表达式
				return reg.test(value);
			},
			message:'不能以0开头，必须10位数以内的数字'
		}
	});
	
	//对比两次输入的密码是否一致
	$.extend($.fn.validatebox.defaults.rules, {
	    equals: {
			validator: function(value,param){
				return value == $(param[0]).val();
			},
			message: '两次密码不一致'
	    }
	});
});

	//只有完全按照格式才能提交表单
		function submitForm(){
			$('#ff').form('submit',{
				url:'addUser',
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