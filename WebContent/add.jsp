<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="ISO-8859-1">
<title>Welcome User</title>
<meta name="viewpost" content="width=device-width,initial-scale=1.0"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container{
width:30%;
}
</style>
</head>
<body>
<div class="container">
<form method="post" action="Save">
<header class="page-header">
<h2 align="center">Register Here......</h2></header>
<div class="form-group">
<label>Name :</label>
<input type="text" name="t1" required placeholder="Deb Karmakar" class="form-control"/>
</div>
<div class="form-group">
<label>Phone :</label>
<input type="text" name="t2" required placeholder="Phone" class="form-control"/>
</div>
<div class="form-group">
<label>Email :</label>
<input type="text" name="t3" required placeholder="abc@gmail.com" class="form-control"/>
</div>
<div class="form-group">
<label>Pasword :</label>
<input type="password" name="p1" required placeholder="Password" class="form-control"/>
</div>
<div class="form-group">
<label>Confirm password :</label>
<input type="password" name="p2" required placeholder="Retype password" class="form-control"/>
</div>
<div class="form-group" align="center">
<button class="btn btn-sm btn-primary">Register</button>
</div>
<div class="form-group">
${msg}
</div>

</form>
</div>


</body>
</html>