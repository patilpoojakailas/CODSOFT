package com.myServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveCourseServlet")
public class RemoveCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveCourseServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseCode = request.getParameter("courseCode");

        String jdbcUrl = "jdbc:mysql://localhost:3306/course";
	    String dbUser = "root";
	    String dbPassword = "7890";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
          
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
           
            String removeQuery = "DELETE FROM student WHERE course_code = ?";
            
            PreparedStatement preparedStatement = connection.prepareStatement(removeQuery);
            preparedStatement.setString(1, courseCode);
            
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            connection.close();
            
            response.getWriter().write("Course registration removed successfully.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
         
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
