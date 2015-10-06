
<%@ page import="clientmap.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="row">
		<div class="col-md-4">
			<div>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<br>
			</div>
			<g:if test="${flash.message}">
				<div class="alert alert-dismissible alert-warning" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
			<thead>
					<tr>
						<g:sortableColumn property="id" title="Id" />
						<g:sortableColumn property="login" title="Login" />
						<g:sortableColumn property="role" title="Role" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>${fieldValue(bean: userInstance, field: "id")}</td>

						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "login")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div>
					<g:link class="btn btn-primary btn-md" role="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
		</div>
		</div>
	</body>
</html>
