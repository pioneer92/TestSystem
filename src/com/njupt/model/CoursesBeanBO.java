package com.njupt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CoursesBeanBO {
	
	private ResultSet resultSet=null;
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	
	public String getCourseNameById(String courseid) {
		String coursename="";
		try {
			connection=new ConnDB().getConnection();
			String sql="select COUR_NAME from courses WHERE COUR_ID = '"+courseid+"' limit 1;";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()){
				coursename=resultSet.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return coursename;
	}
	
	public void closeDB() {
		try {
			if (resultSet!=null) {
				resultSet.close();
				resultSet=null;
			}
			if (preparedStatement!=null) {
				preparedStatement.close();
				preparedStatement=null;
			}
			if (!connection.isClosed()) {
				connection.close();
				connection=null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
