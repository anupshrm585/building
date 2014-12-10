package com.build.user.database.manager;

import java.io.Serializable;
import java.sql.CallableStatement;
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
@SuppressWarnings("serial")
public class DatabaseManager implements Serializable {
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

		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		}finally{
			ConnectionManager.getInstance().closeConnection(con, psmt, rs);
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
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		}finally{
			ConnectionManager.getInstance().closeConnection(con, psmt, rs);
		}
		
		return loginDTO;
	}
	
	public String callProcedure(Object obj,String sql,String code) throws Exception {
		Connection con = null;
		CallableStatement psmt = null;
		ResultSet rs = null;   
		String res = null;
		List<Object> values = null;
		String delimStr = null;
		try {
			values = BaseUtility.getValues(obj);
			
			if(BaseUtility.isNotEmpty(code))
				values.add(code);
			delimStr = BaseUtility.createDelimStr(values, "#");
			con = ConnectionManager.getInstance().getConnection(params);
			psmt = con.prepareCall(sql);
			psmt.setString(1, delimStr);
			psmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			psmt.execute();
			res = psmt.getString(2);	
			
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : " + e.getClass().getName());
		}finally{
			ConnectionManager.getInstance().closeConnection(con, psmt, rs);
		}
		return res;
	}
}
