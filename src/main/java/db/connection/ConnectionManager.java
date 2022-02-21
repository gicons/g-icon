package db.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager 
{
	static Connection con;
	
	
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	private static final String DB_USER = "be932bb0361058";
	private static final String DB_PASSWORD = "38a03779";

	
	public static Connection getConnection()
	{
		try {
			//1. load the driver
			Class.forName(DB_DRIVER);
			
			try {
				//2. create connection
				con = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
				System.out.println("Connected");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e){
				e.printStackTrace();
		}
		return con;
	}
}
