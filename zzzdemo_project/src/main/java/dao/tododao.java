package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.todobean;
import connection.getconection;



public class tododao {

	public void insertdata(todobean todobean) throws SQLException {
		Connection con=getconection.connectionprovider();
		String task=todobean.getTask();
		String end_time=todobean.getEnd_time();
		String starttime=todobean.getStart_time();
		if(task!=null &&end_time!=null) {
		PreparedStatement ps=con.prepareStatement("insert into todo values(?,?,? )");
		ps.setString(1, todobean.getTask());
		ps.setString(2,todobean.getStart_time() );
		ps.setString(3,todobean.getEnd_time() );
		

		int i=ps.executeUpdate();
		if(i>0) {
			System.out.println(i+"-->insert success");
			
		}
		}
		else {
			System.out.println("please enter not null value");
		}
		
	}
	
}
