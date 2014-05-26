package com.njupt.model;

import java.sql.*;
import java.util.ArrayList;

import com.njupt.tools.MD5Util;

public class StudentBeanBO {
	private Connection connection=null;
	private Statement statement=null;
	private ResultSet resultSet=null;
	
	public int checkUser(String stuid,String password){
		int b=0;
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			String sql="select STU_PASSWORD from stuInfo where STU_ID = '"+stuid+"' limit 1;";
			resultSet=statement.executeQuery(sql);
			if (resultSet.next()) {
				b++;
				String dbPassword=resultSet.getString(1);
				if (dbPassword.equals(MD5Util.getMD5(password))) {
					b++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.closeDB();
		}
		return b;
	}
	
	public StudentBean getUserBean(String stuid) {
		StudentBean studentBean=new StudentBean();
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			String sql="select STU_ID , STU_NAME from stuInfo where STU_ID = '"+stuid+"' limit 1;";
			resultSet=statement.executeQuery(sql);
			if (resultSet.next()) {
				studentBean.setStuid(resultSet.getString(1));
				studentBean.setStuname(resultSet.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return studentBean;
	}
	
	public ArrayList<StudentScoreBean> getStudentScoreBeanById(String stuid) {
		ArrayList<StudentScoreBean> arrayList=new ArrayList<StudentScoreBean>();
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			String sql="select * from stuSco where STU_ID = '"+stuid+"' order by COUR_TIME desc;";
			resultSet=statement.executeQuery(sql);
			while (resultSet.next()) {
				StudentScoreBean studentScoreBean=new StudentScoreBean();
				studentScoreBean.setStudentid(resultSet.getString(1));
				studentScoreBean.setCourseid(resultSet.getString(2));
				studentScoreBean.setTimestamp(resultSet.getTimestamp(3));
				studentScoreBean.setScore(resultSet.getInt(4));
				arrayList.add(studentScoreBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return arrayList;
	}
	
	public boolean insertScore(String stuid,String courname,String score) {
		boolean isSuccess=false;
		try {
			ConnDB connDB=new ConnDB();
			connection=connDB.getConnection();
			statement=connection.createStatement();
			String sql="select COUR_ID from courses WHERE COUR_NAME = '"+courname+"' limit 1;";
			resultSet=statement.executeQuery(sql);
			if (resultSet.next()) {
				String courseid=resultSet.getString(1);
				sql="insert into stuSco values('"+stuid+"','"+courseid+"',now(),"+score+");";
				int result=statement.executeUpdate(sql);
				if (result>=1) {
					isSuccess=true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.closeDB();
		}
		return isSuccess;
	}
	
	public void closeDB(){
		try {
			if (resultSet!=null) {
				resultSet.close();
				resultSet=null;
			}
			if (statement!=null) {
				statement.close();
				statement=null;
			}
			if (connection!=null) {
				connection.close();
				connection=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
