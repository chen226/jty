<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>流程列表</title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body style="font-family: '微软雅黑'">

<div id="tb" style="padding:5px;height:auto">
        <div>
        	<form id="searchFrom" action="">
       	        <input type="text" name="filter_LIKES_label" class="easyui-validatebox" data-options="width:150,prompt: '标签'"/>
       	        <input type="text" name="filter_LIKES_value" class="easyui-validatebox" data-options="width:150,prompt: '值'"/>
       	        <input type="text" name="filter_LIKES_type" class="easyui-validatebox" data-options="width:150,prompt: '类型'"/>
		        <span class="toolbar-item dialog-tool-separator"></span>
		        <a href="javascript(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="cx()">查询</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add();">添加</a>
			</form>
       		
        </div> 
        
</div>
	<table width="100%" class="need-border table table-bordered table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>KEY</th>
				<th>Name</th>
				<th>Version</th>
				<th>创建时间</th>
				<th>最后更新时间</th>
				<th>元数据</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="model">
				<tr>
					<td>${model.id }</td>
					<td>${model.key }</td>
					<td>${model.name}</td>
					<td>${model.version}</td>
					<td><fmt:formatDate value="${model.createTime}" type="both"/></td>
					<td><fmt:formatDate value="${model.lastUpdateTime}" type="both"/></td>
					<td>${model.metaInfo}</td>
					<td>
						<a href="${ctx}/modeler.html?modelId=${model.id}" target="_blank">编辑</a>
						<a href="${ctx}/workflow/model/deploy/${model.id}">部署</a>
						导出(<a href="${ctx}/workflow/model/export/${model.id}/bpmn" target="_blank">BPMN</a>
						|&nbsp;<a href="${ctx}/workflow/model/export/${model.id}/json" target="_blank">JSON</a>
						|&nbsp;<a href="javascript:;" onclick='showSvgTip()'>SVG</a>)
                        <a href="${ctx}/workflow/model/delete/${model.id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<table id="dg"></table> 
<div id="dlg"></div>  
<script type="text/javascript">
var dg;
var d;
	function add(){
		d=$("#dlg").dialog({   
		    title: '添加模型',    
		    width: 500,    
		    height: 350,    
		    href:'${ctx}/workflow/model/create',
		    maximizable:true,
		    modal:true,
		    buttons:[{
				text:'确认',
				handler:function(){
					$("#mainform").submit(); 
				}
			},{
				text:'取消',
				handler:function(){
						d.panel('close');
					}
			}]
		});
	}
</script>
</body>
</html>