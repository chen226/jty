<%@page import="com.tianyu.jty.activiti.util.ProcessDefinitionCache,org.activiti.engine.RepositoryService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>管理运行中流程</title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 跟踪
	    $('.trace').click(graphTrace);
	});
	</script>
</head>

<body>
	<%
	RepositoryService repositoryService = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()).getBean(org.activiti.engine.RepositoryService.class);
	ProcessDefinitionCache.setRepositoryService(repositoryService);
	%>
	<c:if test="${not empty message}">
	<div class="ui-widget">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
				<strong>提示：</strong>${message}</p>
			</div>
		</div>
	</c:if>
	<table width="100%" class="need-border table table-bordered table-hover">
		<tr>
			<th>执行IDssss</th>
			<th>流程实例ID</th>
			<th>流程定义ID</th>
			<th>当前节点</th>
			<th>是否挂起</th>
			<th>操作</th>
		</tr>

		<c:forEach items="${page.result }" var="p">
		<c:set var="pdid" value="${p.processDefinitionId }" />
		<c:set var="activityId" value="${p.activityId }" />
		<tr>
			<td>${p.id }</td>
			<td>${p.processInstanceId }</td>
			<td>${p.processDefinitionId }</td>
			<td><a class="trace" href='#' pid="${p.id }" pdid="${p.processDefinitionId}" title="点击查看流程图"><%=ProcessDefinitionCache.getActivityName(pageContext.getAttribute("pdid").toString(), ObjectUtils.toString(pageContext.getAttribute("activityId"))) %></a></td>
			<td>${p.suspended }</td>
			<td>
				<c:if test="${p.suspended }">
					<a href="update/active/${p.processInstanceId}">激活</a>
				</c:if>
				<c:if test="${!p.suspended }">
					<a href="update/suspend/${p.processInstanceId}">挂起</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<tags:pagination page="${page}" paginationSize="${page.pageSize}"/>
	<!-- 办理任务对话框 -->
	<div id="handleTemplate" class="template"></div>

</body>
</html>
