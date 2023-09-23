package com.myServlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    String courseId = request.getParameter("course_code"); // Updated to match the form field name
	    String courseTitle = request.getParameter("courseTitle");
	    String studName = request.getParameter("studName");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phoneNumber");
	    String dateOfBirth = request.getParameter("dateOfBirth");
	    String address = request.getParameter("address");
	    String gender = request.getParameter("gender");
	    String program = request.getParameter("program");
	    String department = request.getParameter("department");
	    
	    
	    String jdbcUrl = "jdbc:mysql://localhost:3306/course";
	    String dbUser = "root";
	    String dbPassword = "7890";
	    
	    try {
	      
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        
	        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
	        
	        String sql = "INSERT INTO student (stud_id, stud_name, email, phone_number, date_of_birth, address, gender, program, department, course_code, course_title) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		    
	        PreparedStatement preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, generateStudentId()); // You can implement a method to generate unique student IDs
	        preparedStatement.setString(2, studName);
	        preparedStatement.setString(3, email);
	        preparedStatement.setString(4, phoneNumber);
	        preparedStatement.setString(5, dateOfBirth);
	        preparedStatement.setString(6, address);
	        preparedStatement.setString(7, gender);
	        preparedStatement.setString(8, program);
	        preparedStatement.setString(9, department);
	        preparedStatement.setString(10, courseId);
	        preparedStatement.setString(11, courseTitle);
	        
	        preparedStatement.executeUpdate();
	        preparedStatement.close();
	        connection.close();
	        
	        System.out.println("You have successfully registered for the course");
	        
	        response.sendRedirect("registrationConfirmation.jsp");
	        
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	}
    
    private String generateStudentId() {
    	 String uuid = UUID.randomUUID().toString().replace("-", "");
         
         String studentId = uuid.substring(0, 10);

         return studentId; 
    }
		
	}


