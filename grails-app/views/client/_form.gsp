<%@ page import="clientmap.Client" %>



<div class="form-group" ${hasErrors(bean: clientInstance, field: 'name', 'error')} required">
    <label for="name">
        Name
    </label>
    <input type="text" id="name" class="form-control" name="name" placeholder="Name" maxlength="50" required="true" value="${clientInstance?.name}"/>

</div>

<div class="form-group" ${hasErrors(bean: clientInstance, field: 'email', 'error')} required">
    <label for="email">
        Email
    </label>
    <g:field type="email" class="form-control" placeholder="Email" id="email" name="email" required="true" value="${clientInstance?.email}"/>

</div>

<div class="form-group" ${hasErrors(bean: clientInstance, field: 'street', 'error')} required">
    <label for="street">
        Street
    </label>
    <g:field type="text" class="form-control" placeholder="Street" id="street" name="street"  value="${clientInstance?.street}"/>

</div>

<div class="form-group" ${hasErrors(bean: clientInstance, field: 'zip', 'error')} required">
    <label for="zip">
        Zip
    </label>
    <g:field class="form-control" placeholder="Zip" id="zip" name="zip" type="number" min="0" value="${clientInstance.zip}"/>

</div>

