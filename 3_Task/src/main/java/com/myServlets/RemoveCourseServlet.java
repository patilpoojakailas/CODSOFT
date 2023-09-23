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

/**
 * Servlet implementation class RemoveCourseServlet
 */
@WebServlet("/RemoveCourseServlet")
public class RemoveCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseCode = request.getParameter("courseCode");

        // Define your database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/course";
	    String dbUser = "root";
	    String dbPassword = "7890";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            
            // Define the SQL query to remove the course registration
            String removeQuery = "DELETE FROM student WHERE course_code = ?";
            
            // Create a PreparedStatement to execute the query
            PreparedStatement preparedStatement = connection.prepareStatement(removeQuery);
            preparedStatement.setString(1, courseCode);
            
            // Execute the removal query
            preparedStatement.executeUpdate();
            
            // Close the database resources
            preparedStatement.close();
            connection.close();
            
            // Send a response to indicate successful removal
            response.getWriter().write("Course registration removed successfully.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any exceptions (e.g., log the error or display an error message)
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
