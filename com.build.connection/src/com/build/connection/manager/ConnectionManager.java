package com.build.connection.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public Connection getConnection(String params[])
			throws SQLException, ClassNotFoundException {
		Class.forName(params[0]);
		return DriverManager.getConnection(params[1], params[2], params[3]);
	}

	public void closeConnection(Connection con, PreparedStatement psmt,
			ResultSet rs) throws SQLException {
		if (BaseUtility.isNotEmpty(con))
			con.close();
		if (BaseUtility.isNotEmpty(psmt))
			psmt.close();
		if (BaseUtility.isNotEmpty(rs))
			rs.close();
	}

}
