package com.build.user.database.manager;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.build.connection.manager.ConnectionManager;
import com.build.pojo.DTO.LoginDTO;
import com.build.pojo.DTO.ResultSetDTO;
import com.build.user.database.constants.Constants;
import com.build.user.util.ResourceUtility;
import com.build.util.BaseUtility;

/**
 * This class is used for executing sql queries
 * 
 * @author Anup
 * @version 1
 */
public class DatabaseManager {
	/*
	 * String params[] = { ResourceUtility.getConfiguration(Constants.DRIVER),
	 * ResourceUtility.getConfiguration(Constants.DB_URL),
	 * ResourceUtility.getConfiguration(Constants.USERNAME),
	 * ResourceUtility.getConfiguration(Constants.PASSWORD) };
	 */
	String params[] = { "com.mysql.jdbc.Driver",
			"jdbc:mysql://localhost:3306/building", "root", "root" };

	/**
	 * fetchResults is used for executing the select sql statements
	 * 
	 * @param sql
	 *            contains the query
	 * @param params
	 *            contains the parameters which will be passed as an argument to
	 *            prepared statement
	 * @return the result set as a list of HashMap
	 */
	public List<ResultSetDTO> fetchResults(String sql, List<String> parameters) {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ResultSetDTO> results = new ArrayList<ResultSetDTO>();
		ResultSetDTO resultSetDTO = null;
		try {
			con = ConnectionManager.getInstance().getConnection(params);
			System.out.println(BaseUtility.makeString(sql, "?", parameters));
			psmt = con.prepareStatement(BaseUtility.makeString(sql, "?",
					parameters));
			rs = psmt.executeQuery();
			while (rs.next()) {
				resultSetDTO = new ResultSetDTO();
				resultSetDTO.setId(rs.getString(1));
				resultSetDTO.setTitle(rs.getString(2));
				results.add(resultSetDTO);
			}

			ConnectionManager.getInstance().closeConnection(con, psmt, rs);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		}
		return results;
	}

	public LoginDTO doLogin(LoginDTO loginDTO) {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> parameters = new ArrayList<String>();
		parameters.add(loginDTO.getUsername());
		parameters.add(loginDTO.getPassword());
		parameters.add(String.valueOf(loginDTO.getGroupId()));
		try {
			con = ConnectionManager.getInstance().getConnection(params);
			psmt = con.prepareStatement(BaseUtility.makeString(
					ResourceUtility.getQuery(Constants.LOGIN_CHECK), "?",
					parameters));
			rs = psmt.executeQuery();
			if (rs.next()) {
				loginDTO.setUserTitle(rs.getString("user_title"));
				loginDTO.setLoggedIn(true);
			} else
				loginDTO.setLoggedIn(false);
			ConnectionManager.getInstance().closeConnection(con, psmt, rs);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		}
		return loginDTO;
	}
	
	public void printFields(Object obj,String sql) throws Exception {
		   
		Class<?> objClass = obj.getClass();
	    Field[] fields = objClass.getDeclaredFields();
	    System.out.println(fields.length);	    
	    for(Field field : fields) {
	        String name = field.getName();
	        name = name.substring(0, 1).toUpperCase() + name.substring(1);
	        Object value = objClass.getMethod("get"+name, null).invoke(obj, null);
	        //Object value = field.get(obj); + value.toString()
	        System.out.println(name + ": " + value);
	    }
	}
}
