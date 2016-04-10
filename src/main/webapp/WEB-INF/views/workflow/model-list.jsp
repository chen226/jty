<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>流程列表</title>

	<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
    <script type="text/javascript">
    $(function() {
    	$('#create').button({
    		icons: {
    			primary: 'ui-icon-plus'
    		}
    	}).click(function() {
    		$('#createModelTemplate').dialog({
    			modal: true,
    			width: 500,
    			buttons: [{
    				text: '创建',
    				click: function() {
    					if (!$('#name').val()) {
    						alert('请填写名称！');
    						$('#name').focus();
    						return;
    					}
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
    					$('#modelForm').submit();
    				}
    			}]
    		});
    	});
    });

		function showSvgTip() {
			alert('点击"编辑"链接,在打开的页面中打开控制台执行\njQuery(".ORYX_Editor *").filter("svg")\n即可看到svg标签的内容.');
		}
    </script>
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
			</form>
			
	       	<shiro:hasPermission name="sys:dict:add">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add();">添加</a>
	       		<span class="toolbar-item dialog-tool-separator"></span>
	       	</shiro:hasPermission>
	       	<shiro:hasPermission name="sys:dict:delete">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-options="disabled:false" onclick="del()">删除</a>
	            <span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="sys:dict:update">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="upd()">修改</a>
	        </shiro:hasPermission>
        </div> 
        
</div>

	<div style="text-align: right"><button id="create">创建</button></div>
	<table width="100%" class="need-border">
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
					<td>${model.createTime}</td>
					<td>${model.lastUpdateTime}</td>
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
	<div id="createModelTemplate" title="创建模型" class="template">
        <form id="modelForm" action="${ctx}/workflow/model/create" target="_blank" method="post">
		<table>
			<tr>
				<td>名称：</td>
				<td>
					<input id="name" name="name" type="text" />
				</td>
			</tr>
			<tr>
				<td>KEY：</td>
				<td>
					<input id="key" name="key" type="text" />
				</td>
			</tr>
			<tr>
				<td>描述：</td>
				<td>
					<textarea id="description" name="description" style="width:300px;height: 50px;"></textarea>
				</td>
			</tr>
		</table>
        </form>
	</div>
</body>
</html>