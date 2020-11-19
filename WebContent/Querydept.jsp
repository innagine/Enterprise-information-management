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
<div  class="easyui-panel" title="部门查询" style="width:100%;height:100px;padding:10px;">

		<form>

			<label for="dname"> 部门名字：</label><input
				class="easyui-textbox" style="width: 200px" name="dname" id="dname" />
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
	                    <td>部门编号:</td>
	                    <td><input id="did_update" class="easyui-textbox" disabled="disabled"
	                               type="text" name="did"
	                               data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>部门名字:</td>
	                    <td><input id="dname_update" class="easyui-textbox"
	                        type="text" name="dname"
	                        data-options="required:true"></td>
	                </tr>
	                <tr>
	                    <td>备注:</td>
	                    <td><input id="dremark_update" class="easyui-textbox" 
	                    			type="text" name="dremark"
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

			getData("${pageContext.request.contextPath}/findDpetsList");
			getPageBar();

		})

		//模糊查询
		function submitForm() {
			//获得查询数据
			var dname = $("#dname").val();
			

			getData("${pageContext.request.contextPath}/findDeptsLike",
					dname);
		}

		//获取表格数据
		function getData(url, dname) {
			$('#dg').datagrid({

				url : url,
				title : "部门",
				border : false,
				rownumbers : true,
				toolbar : '#tb',
				pagination : true,
				pageSize : "5",
				queryParams : {
					dname : dname,
				},
				pageList : [ 5, 10, 15, 20 ],
				singleSelect : true,
				columns : [ [ {
					field : 'id',
					value : 'did',
					checkbox : true,
					title : '选择',
					width : 50
				}, {
					field : 'did',
					title : '部门编号',
					width : 80
				}, {
					field : 'dname',
					title : '部门名字',
					width : 80
				},  {
					field : 'dremark',
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
							$.messager.confirm('确认是否删除','确定要删除('+row.dname+')吗?',
									function(r){
								if(r){

									$.get("deleteDept?number="+row.did,null,function(data)
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
								$("#did_update").textbox('setValue',row.did);
								$("#dname_update").textbox('setValue',row.dname);
								$("#dremark_update").textbox('setValue',row.dremark);
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
		var did = $("#did_update").val();
		var dname = $("#dname_update").val();
		var dremark = $("#dremark_update").val();
		
		//将得到的学生信息构成json数据
		var json = {
				"did" : did,
				"dname" : dname,
				"dremark" : dremark,
		};
		//完成ajax操作
		$.post("updateDept",json,function(data){
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