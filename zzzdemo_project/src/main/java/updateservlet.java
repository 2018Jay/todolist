

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.getconection;

/**
 * Servlet implementation class updateservlet
 */
public class updateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String task=request.getParameter("task");
		String end_time=request.getParameter("end_time");
		HttpSession session=request.getSession();
		String task1=(String)session.getAttribute("task1");
		String end_time1=(String)session.getAttribute("end_time1");
		System.out.println(task1+task);
		
		request.setAttribute(task, response);
		request.setAttribute(end_time, response);
		Connection con=getconection.connectionprovider();
		try {
			PreparedStatement ps=con.prepareStatement("update todo set task_name=?, duedate=? where task_name=? and duedate=?");
			ps.setString(1, task);
			ps.setString(2, end_time);
			ps.setString(3, task1);
			ps.setString(4, end_time1);
			int i=ps.executeUpdate();
			
			System.out.println(i+"update success....");
			response.sendRedirect("todo.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
