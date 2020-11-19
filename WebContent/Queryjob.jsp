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
<div  class="easyui-panel" title="职位查询" style="width:100%;height:100px;padding:10px;">

		<form>

			<label for="jname"> 职位名字：</label><input
				class="easyui-textbox" style="width: 200px" name="jname" id="jname" />
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
	                    <td>职位编号:</td>
	                    <td><input id="jid_update" class="easyui-textbox" disabled="disabled"
	                               type="text" name="jid"
	                               data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>职位名字:</td>
	                    <td><input id="jname_update" class="easyui-textbox"
	                        type="text" name="jname"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>备注:</td>
	                    <td><input id="jremark_update" class="easyui-textbox" 
	                    			type="text" name="jremark"
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

			getData("${pageContext.request.contextPath}/findJobsList");
			getPageBar();

		})

		//模糊查询
		function submitForm() {
			//获得查询数据
			var jname = $("#jname").val();
			

			getData("${pageContext.request.contextPath}/findJobsLike",
					jname);
		}

		//获取表格数据
		function getData(url, jname) {
			$('#dg').datagrid({

				url : url,
				title : "职位",
				border : false,
				rownumbers : true,
				toolbar : '#tb',
				pagination : true,
				pageSize : "5",
				queryParams : {
					jname : jname,
				},
				pageList : [ 5, 10, 15, 20 ],
				singleSelect : true,
				columns : [ [ {
					field : 'id',
					value : 'jid',
					checkbox : true,
					title : '选择',
					width : 50
				}, {
					field : 'jid',
					title : '职位编号',
					width : 80
				}, {
					field : 'jname',
					title : '职位名字',
					width : 80
				},  {
					field : 'jremark',
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
							$.messager.confirm('确认是否删除','确定要删除('+row.jname+')吗?',
									function(r){
								if(r){

									$.get("deleteJob?number="+row.jid,null,function(data)
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
								$("#jid_update").textbox('setValue',row.jid);
								$("#jname_update").textbox('setValue',row.jname);
								$("#jremark_update").textbox('setValue',row.jremark);
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
		var jid = $("#jid_update").val();
		var jname = $("#jname_update").val();
		var jremark = $("#jremark_update").val();
		
		//将得到的学生信息构成json数据
		var json = {
				"jid" : jid,
				"jname" : jname,
				"jremark" : jremark,
		};
		//完成ajax操作
		$.post("updateJob",json,function(data){
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