package com.build.connection.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.build.util.BaseUtility;

public class ConnectionManager {
	private static ConnectionManager cManager;

	private ConnectionManager() {
	}

	public static ConnectionManager getInstance() {
		synchronized (ConnectionManager.class) {
			if (BaseUtility.isEmpty(cManager)) {
				cManager = new ConnectionManager();
			}
		}
		return cManager;
	}

	public Connection getConnection(String params[]) throws SQLException {
		try {
			Class.forName(params[0]);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return DriverManager.getConnection(params[1], params[2], params[3]);
	}

	public void closeConnection(Connection con, Statement psmt,
			ResultSet rs)  {		
			try {
				if (BaseUtility.isNotEmpty(con))
				con.close();
				if (BaseUtility.isNotEmpty(psmt))
					psmt.close();
				if (BaseUtility.isNotEmpty(rs))
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	

}
