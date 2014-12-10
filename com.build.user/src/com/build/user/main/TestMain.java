package com.build.user.main;

import java.sql.*;

import com.build.pojo.DTO.GroupDTO;
import com.build.user.database.constants.Constants;
import com.build.user.database.manager.DatabaseManager;
import com.build.user.database.manager.HibernateDBManager;
import com.build.user.util.ResourceUtility;

public class TestMain {
	/*
	 * static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; static final
	 * String DB_URL = "jdbc:mysql://localhost/building";
	 * 
	 * // Database credentials static final String USER = "root"; static final
	 * String PASS = "root";
	 */
	public static void main(String[] args) {
		/*
		 * Connection conn = null; CallableStatement stmt = null; try{ //STEP 2:
		 * Register JDBC driver Class.forName("com.mysql.jdbc.Driver");
		 * 
		 * //STEP 3: Open a connection
		 * System.out.println("Connecting to database..."); conn =
		 * DriverManager.getConnection(DB_URL,USER,PASS);
		 * 
		 * //STEP 4: Execute a query
		 * System.out.println("Creating statement..."); String sql =
		 * "{call GROUP_DETAILS (?, ?)}"; stmt = conn.prepareCall(sql);
		 * 
		 * //Bind IN parameter first, then bind OUT parameter //int empID = 102;
		 * String delimStr = "#Testing#N#Y#GRP"; stmt.setString(1, delimStr); //
		 * This would set ID as 102 // Because second parameter is OUT so
		 * register it stmt.registerOutParameter(2, java.sql.Types.VARCHAR);
		 * 
		 * //Use execute method to run stored procedure.
		 * System.out.println("Executing stored procedure..." ); stmt.execute();
		 * 
		 * //Retrieve employee name with getXXX method String empName =
		 * stmt.getString(2); System.out.println(empName); stmt.close();
		 * conn.close(); }catch(SQLException se){ //Handle errors for JDBC
		 * se.printStackTrace(); }catch(Exception e){ //Handle errors for
		 * Class.forName e.printStackTrace(); }finally{ //finally block used to
		 * close resources try{ if(stmt!=null) stmt.close(); }catch(SQLException
		 * se2){ }// nothing we can do try{ if(conn!=null) conn.close();
		 * }catch(SQLException se){ se.printStackTrace(); }//end finally try
		 * }//end try System.out.println("Goodbye!");
		 */

		GroupDTO groupDTO = new GroupDTO();
		groupDTO.setTitle("Testing");
		DatabaseManager dbManager = new DatabaseManager();
		/*
		 * HibernateDBManager hdbManager = new HibernateDBManager();
		 * System.out.println(hdbManager.insertData(groupDTO,"GRP"));
		 */
		try {
			System.out.println(
					dbManager.callProcedure(groupDTO,
							ResourceUtility.getQuery(Constants.GROUP_DETAILS),
					ResourceUtility.getConfiguration(Constants.GROUP_CODE)));
			// System.out.println(5 > 5);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
