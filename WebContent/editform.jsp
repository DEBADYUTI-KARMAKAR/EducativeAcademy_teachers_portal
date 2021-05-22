 <%@page import="java.sql.*" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewpost" content="width=device-width,initial-scale=1.0"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

<%
int id = 0;
try
{
	id = Integer.parseInt(request.getParameter("id"));
}
catch(Exception ex)
{
	id=0;
}

Class.forName("com.mysql.cj.jdbc.Driver");
//create the connection with my sql server
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
PreparedStatement stmt = con.prepareStatement("select * from user where id = ?");
stmt.setInt(1,id);
ResultSet rs = stmt.executeQuery();
if(rs.next()){
%>
<div class="container">
<form action="update" method="post">
<input type="hidden" name="hid" value="<%=rs.getInt("id") %>">
<header class="page-header"><h1 style="font-size:500%; color: #C70039;text-align: center; "><i>Edit Data...</i></h1></header>
<MARQUEE HEIGHT=20 WIDTH=500 DIRECTION=LEFT BGCOLOR= #F4ECF7><FONT SIZE=4 COLOR=#FF3349> <B> Hello User@Edit Your Information And Upadte..
</B> 
</FONT></MARQUEE>
<h3 style="font-size:200%; color: black;text-align: center; "><i><label>Name : </label>
<input type="text" name="t1" required value="<%=rs.getString("cname") %>" class="from-control"/></i></h3>
<h3 style="font-size:200%; color: black;text-align: center; "><i><label>Phone : </label>
<input type="text" name="t2" value="<%=rs.getString("phone") %>"class="from-control"/></i></h3>
<h3 style="font-size:200%; color: black;text-align: center; "><i><label>Email : </label>
<input type="text" name="t3" value="<%=rs.getString("email") %>"class="from-control"/></i></h3>
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

</style>
<h1 style="font-size:100%; text-align: center; color:#C70039 "><i><button class="button">Submit</button></i></h1>
</form>
</div>
<%
}
rs.close();
stmt.close();
con.close();

%>
</body>
</html>