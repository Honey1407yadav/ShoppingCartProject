package com.shop.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() {
		Connection con = null;
		try {
			//driver class load...
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create a connection...
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerceCart", "root", "root");
		}catch (ClassNotFoundException | SQLException e ) {
			e.printStackTrace();
		}
		return con;
	}
	
}
