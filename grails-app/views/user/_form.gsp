<%@ page import="clientmap.User" %>



<div class="form-group" ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		Login
	</label>
	<g:field type="text" class="form-control" placeholder="Login" id="login" name="login" required="true" value="${userInstance?.login}"/>

</div>

<div class="form-group" ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		Password
	</label>
	<g:field type="password" class="form-control" placeholder="Password" id="password" name="password" required="true" value="${userInstance?.password}"/>

</div>

<div class="form-group" ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
	<label for="role">
		Role
	</label>
	<g:select class="form-control" name="role" from="${userInstance.constraints.role.inList}" required="" value="${userInstance?.role}" valueMessagePrefix="user.role"/>

</div>

