

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.getconection;




public class deletehandle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=null;
		System.out.println("welcome to delete ");
	    String task= request.getParameter("task");
	    String end= request.getParameter("end_time");
	    
       System.out.println(task+"--->"+end);
	    
		
		con=getconection.connectionprovider();
		PreparedStatement ps=null;
		try {
			ps = con.prepareStatement(" delete from todo where task_name=? and duedate=?");
			ps.setString(1,task);
			ps.setString(2, end);
			int i=ps.executeUpdate();
			if(i>0) {
			System.out.println(i+"delete success");}
			else {
				System.out.println(i+"detete error");
			}
			response.sendRedirect("todo.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
