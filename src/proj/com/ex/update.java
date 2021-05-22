package proj.com.ex;

import java.io.IOException;
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


@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public update() {
        super();
        
    }

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter pw = response.getWriter();
		 response.setContentType("text/html");
		 
		 String nm = request.getParameter("t1");
		 String ph = request.getParameter("t2");
		 String eml = request.getParameter("t3");
		 
		 int id= Integer.parseInt(request.getParameter("hid"));
		 RequestDispatcher req = request.getRequestDispatcher("index.jsp");
		 
		 try
		 {
			 Class.forName("com.mysql.cj.jdbc.Driver");
				//create the connection with my sql server
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
				
				PreparedStatement stmt = con.prepareStatement("update user set cname=?,email=?,phone=? where id=?");
				stmt.setString(1, nm);
				stmt.setString(2, ph);
				stmt.setString(3, eml);
				
				stmt.setInt(4, id);
				
				int r = stmt.executeUpdate();
				
				stmt.close();
				con.close();
				
				if(r==1)
				{
					request.setAttribute("msg", "Data Updated !!");
				}
				else
				{
					request.setAttribute("msg", "Error !!");
				}
		 }
		 catch(Exception ex)
		 {
			 
		 }
		 finally
		 {
			req.forward(request, response); 
		 }
		 
	}

}
