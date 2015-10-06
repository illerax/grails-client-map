<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Login</title>
</head>
<body>
<div class="row">
    <div class="col-md-4">
<div class="jumbotron">
    <h1>Login</h1>
    <g:if test="${flash.message}">
        <div class="alert alert-dismissible alert-warning">${flash.message}</div>
    </g:if>

    <g:form action="authenticate" method="post" >
        <div class="form-group">
            <label for="exampleInputEmail1">Login</label>
            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Login" name="login">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </g:form>
</div>
</div>
</div>
</body>
</html>