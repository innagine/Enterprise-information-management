<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人事管理系统</title>

<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
 <style type="text/css">
 #rig{
	position:fixed;
	left:1400px;
	top:25px;
}
 </style>
 </head>
 
 <body class="easyui-layout">
	<div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'north'" style="height:90px;background-color: #B7DDF8">
		 	<h2 style="margin-left: 30px;color: #007DBE">企业信息化平台管理系统</h2>
		 	<div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-family: Arial;font-weight: 700;color: red">当前用户：${user.username}</span>
            <span style="font-family: Arial;font-weight: 700;color:black ">，您好！ </span>
             <div id="rig">
             	<form action = "edit">
					<input class="easyui-textbox" data-options="plain:true,iconCls:'icon-redo'" 
					style="width:100px;height:30px;" type="submit" value="退出登录">
				</form>
             </div>
             <div style="float:right">
             	<span id="ptime"></span>
             </div>
            </div>
		</div>
		<div data-options="region:'south',split:true" style="height:40px;text-align: center">
		<span style="font-size: 12px;margin-bottom: 0px">@五邑大学 智能制造学部170804班 31组</span>
		</div>
		<div data-options="region:'east',split:true" title="系统说明" style="width:100px;">
		此系统为萌新团队制作，虽然还有很多需要完善的地方，不过该有的都有，能实现的功能尽力实现！
		</div>
		<div data-options="region:'west',split:true" title="<center>公司人事信息管理</center>" style="width:208px;">
				<div class="easyui-accordion" style="width:200px;height:100%;">
					<div title="用户管理" data-options="iconCls:'icon-yhgl'" style="overflow:auto;padding:10px;">
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="but1">用户查询</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-yhgl1'" style="margin-top:10px" id="but2">添加用户</button>
					</div>
					<div title="部门管理" data-options="iconCls:'icon-bmgl'" style="padding:10px;">
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="but3">部门查询</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-bmgl1'" style="margin-top:10px" id="but4">添加部门</button>
					</div>
					<div title="职位管理" data-options="iconCls:'icon-zwgl'" style="padding:10px;">
					<button
						class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="but5">职位查询</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-zwgl1'" style="margin-top:10px" id="but6">添加职位</button>
					</div>
					<div title="员工管理" data-options="iconCls:'icon-yggl'" style="overflow:auto;padding:10px;">
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="but7">员工查询</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-yggl1'" style="margin-top:10px" id="but8">添加员工</button>
					</div>
					<div title="公告管理" data-options="iconCls:'icon-gggl'" style="overflow:auto;padding:10px;">
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-gggl1'" id="but9">公告查询</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin-top:10px" id="but10">添加公告</button>
					</div>
					<div title="下载中心" data-options="iconCls:'icon-xzzx'" style="overflow:auto;padding:10px;">
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-wjxz'" id="but11">文件下载</button>
						<br>
						<button
						class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin-top:10px" id="but12">文件上传</button>
					</div>
				</div>
		</div>	
		<div data-options="region:'center',iconCls:'icon-ok'">
			<div id="tt" class="easyui-tabs" style="width:1290px;height:800px">
			
			 </div>
		</div>	
	</div>
 </body>
 
 <script type="text/javascript">
    /*时钟*/
    //js完成，创建一个定时器（可重复）
    var mytime = setInterval(function () {
        getTime();
    }, 1000);//1000毫秒==1秒

    //自己封装的一个获取时间的方法
    function getTime() {
        var d = new Date();
        /*得到月，日，时，分，秒，要处理少10补0 */
        var M = (d.getMonth() + 1) < 10 ? ('0' + (d.getMonth() + 1)) : (d.getMonth() + 1);
        var D = d.getDate() < 10 ? ('0' + d.getDate()) : d.getDate();
        var H = d.getHours() < 10 ? ('0' + d.getHours()) : d.getHours();
        var m = d.getMinutes() < 10 ? ('0' + d.getMinutes()) : d.getMinutes();
        var s = d.getSeconds() < 10 ? ('0' + d.getSeconds()) : d.getSeconds();
        var t = d.getFullYear() + "年" + M + "月" + D
                + "号&nbsp;&nbsp;&nbsp;&nbsp;" + H + ":" + m + ":" + s
                + "&nbsp;&nbsp;&nbsp;&nbsp;星期" + "日一二三四五六".charAt(d.getDay());
        ;
        //将控件的内容修改为处理好的字符串
        $("#ptime").html(t);
    }
</script>


<script type="text/javascript">
//以下是左侧按钮打开对应的选项框
//以下是jq语法
$(function(){
	//给button绑定一个点击事件
	$("#but1").click(function(){
		//but1为用户查询
		addTabs("#tt","用户查询","QueryUser.jsp","icon-search");
	});
	
	$("#but2").click(function(){
		//but2为添加用户
		addTabs("#tt","添加用户","AddUser.jsp","icon-yhgl1");
	});
	
	$("#but3").click(function(){
		//but3为部门查询
		addTabs("#tt","部门查询","Querydept.jsp","icon-search");
	});
	
	$("#but4").click(function(){
		//but4为部门管理
		addTabs("#tt","添加部门","Adddept.jsp","icon-bmgl1");
	});
	
	$("#but5").click(function(){
		//but5为职位查询
		addTabs("#tt","职位查询","Queryjob.jsp","icon-search");
	});
	
	$("#but6").click(function(){
		//but6为职位管理
		addTabs("#tt","添加职位","Addjob.jsp","icon-zwgl1");
	});
	
	$("#but7").click(function(){
		//but7为员工查询
		addTabs("#tt","员工查询","Queryemployee.jsp","icon-search");
	});
	
	$("#but8").click(function(){
		//but8为员工管理
		addTabs("#tt","添加员工","Addemployee.jsp","icon-yggl1");
	});
	
	$("#but9").click(function(){
		//but9为公告查询
		addTabs("#tt","公告查询","Querynotice.jsp","icon-gggl1");
	});
	
	$("#but10").click(function(){
		//but10为添加公告
		addTabs("#tt","添加公告","Addnotice.jsp","icon-add");
	});
	
	$("#but11").click(function(){
		//but11为文件下载
		addTabs("#tt","文件下载","getFiles","icon-wjxz");
	});
	
	$("#but12").click(function(){
		//but12为文件上传
		addTabs("#tt","文件上传","upload.jsp","icon-add");
	});
	
	
	
	//封装添加一个新的标签页面板
	function addTabs(tabId,titleName,url,icons){
		var res = $(tabId).tabs("exists",titleName);
		
		if(res){
			$(tabId).tabs("select",titleName);
		}else{
			$(tabId).tabs('add',{
			    title:titleName,
			    content:'<iframe scrolling="auto" frameborder="0" src="'
			    	+ url + '" style="width:100%;height:100%;"></iframe>',
			    closable:true,
			    iconCls:icons,
			    tools:[{
					iconCls:'icon-mini-refresh',
					handler:function(){
						$('.panel:visible > .panel-body > iframe').get(0).contentDocument.location.reload(true);
					}
			    }]
			});
		}
	}
	
});
</script>

</html>