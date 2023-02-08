package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class getconection {
     public static Connection connectionprovider() {
    	 Connection con=null;
    	 try {
    		 Class.forName(connection_info.Driver);
    			con=DriverManager.getConnection(connection_info.Url,connection_info.User,connection_info.Password);
    			
    	 }
    	 catch(Exception e) {
    		 System.out.println(e);
    	 }
    	 return con;
     }
}
