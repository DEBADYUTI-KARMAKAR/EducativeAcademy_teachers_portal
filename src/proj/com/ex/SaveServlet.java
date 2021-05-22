package proj.com.ex;

import java.io.IOException;


import java.sql.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Save")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public SaveServlet() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter pw = response.getWriter();
	response.setContentType("text/html");
	RequestDispatcher req = request.getRequestDispatcher("add.jsp");

	try {
		
		String nm = request.getParameter("t1");
		String ph = request.getParameter("t2");
		String em = request.getParameter("t3");	
		String p1 = request.getParameter("p1");
		String p2 = request.getParameter("p1");
		
		//pw.println("Ok");
		
		if(p1.equals(p2)) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create the connection with my sql server
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
			
			PreparedStatement stmt = con.prepareStatement("insert into user(cname,phone,email,pass1)values(?,?,?,?)");
			stmt.setString(1, nm);
			stmt.setString(2, ph);
			stmt.setString(3, em);
			stmt.setString(4, p1);
			
			int r = stmt.executeUpdate();
			if(r==1) {
				request.setAttribute("msg", "<div class='alert alert-success'>One user add</div>");
				//pw.println("Added");
				
			}
			else {
				request.setAttribute("msg", "<div class='alert alert-danger'>Error adding records</div>");
		
				//pw.println("Error");
				
			}
			stmt.close();
			con.close();
			
		}
		else {
			
		    request.setAttribute("msg", "<div class='alert alert-danger'>Password mismatch !</div>");
		   //pw.println("Password mismatched !");
		   
		}
	}
	catch(Exception ex) {
		pw.println("Error :"+ex.toString());
	}
	finally {
      req.forward(request, response);
      
 	}
	
	
	
		}

}
