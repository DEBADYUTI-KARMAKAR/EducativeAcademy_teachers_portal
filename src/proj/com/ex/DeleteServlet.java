package proj.com.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	   PrintWriter pw = response.getWriter();
	   response.setContentType("text/html");
	   
	   int id = Integer.parseInt(request.getParameter("id"));
	   
	   try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create the connection with my sql server
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
		    PreparedStatement stmt = con.prepareStatement("delete from user where id=?");
		    stmt.setInt(1, id);
		    int r = stmt.executeUpdate();
		    
		    if(r==1)
		    	response.sendRedirect("index.jsp");
		    else
		    	pw.println("Error");
		    stmt.close();
		    con.close();	    	
	   }
	   catch(Exception ex) {
		   pw.println(ex.toString());
		   
	   }
	
	}

}
