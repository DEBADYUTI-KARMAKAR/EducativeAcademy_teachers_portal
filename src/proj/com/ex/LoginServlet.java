package proj.com.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       public LoginServlet() {
        super();
            }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter pw = response.getWriter();
	response.setContentType("text/html");
	
	String userName = request.getParameter("username");
	String passWord = request.getParameter("pass1");
	RequestDispatcher req = request.getRequestDispatcher("login.jsp");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
		PreparedStatement stmt =con.prepareStatement("select * from `user` where (email=? or phone=?) and pass1=?");
		stmt.setString(1, userName);
		stmt.setString(2, userName);
		stmt.setString(3, passWord);
		HttpSession mySession=request.getSession();
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			mySession.setAttribute("USER", rs.getString("cname"));
			
			mySession.setAttribute("USERID", rs.getInt("id"));
			
			mySession.setAttribute("USERROLE", rs.getString("role"));
			
			response.sendRedirect("index.jsp");
			
		}
		else {
			request.setAttribute("msg", "<div class='alert-danger'>Invalid Username or Password!!</div>");
			req.forward(request, response);
		}
		rs.close();
		stmt.close();
		con.close();
		
		
	}
	catch(Exception ex) {
		pw.println(ex.toString());
	}
	
	finally {
		
	}
	}

}
