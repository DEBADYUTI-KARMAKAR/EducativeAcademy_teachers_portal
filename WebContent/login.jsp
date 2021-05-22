<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name='viewport' content='width=device-width,intial-scale=1.0'/>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.container{
		width: 40%;
		border:1px solid #C70039 ;
		margin:auto;
		color:#C70039;
	}
	@media only screen and (max-width: 768px){
		.container{ width:100%; border:1px #C70039; }
		
	}
	
	
</style>

</head>
<body>
<div class="container">
<form method="post" action="Login">
<header class="page-head"><h1 style="font-size:200%; color: #C70039;text-align: center; "><i>Educative Academy</i></h1></header>
<header class="page-header"><h1 style="font-size:500%; color: #C70039;text-align: center; "><i>Login Here...</i></h1></header>
<MARQUEE HEIGHT=20 WIDTH=500 DIRECTION=LEFT BGCOLOR= #F4ECF7><FONT SIZE=4 COLOR=#FF3349> <B> Hello User@Input Your Information And Login..
</B> 
</FONT></MARQUEE>
<h3 style="font-size:200%; color: black;text-align: center; "><i><label>Username :</label>
<input type="text" name="username" required placeholder="Email / phone" class="from-control"/></i></h3>
<h3 style="font-size:200%; color: black;text-align: center; "><i><label>Password :</label>
<input type="password" name="pass1" required placeholder="password" class="from-control"/></i></h3>
<style>
.button {
  background-color: #C70039; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button {background-color:#C70039 ;}
.button {padding: 10px 45%;}
.
</style>

<h1 style="font-size:100%; text-align: center; color:#C70039 "><i><button class="button">Login</button></i></h1>
${msg }
</form>
</div>
</body>
</html>