package com.myServlets;

import java.io.IOException;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchCoursesServlet")
public class SearchCoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userName = request.getParameter("name");

        ArrayList<String[]> registeredCourses = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/course", "root", "7890");

            String searchQuery = "SELECT * FROM student WHERE email = ? AND stud_name = ?";
            PreparedStatement searchStatement = connection.prepareStatement(searchQuery);
            searchStatement.setString(1, userEmail);
            searchStatement.setString(2, userName);
            ResultSet searchResult = searchStatement.executeQuery();

            if (searchResult.next()) {
               
                String studentId = searchResult.getString("stud_id");
                String getRegisteredCoursesQuery = "SELECT course_title FROM student WHERE email = ?"; // Only select course_title
                PreparedStatement registeredCoursesStatement = connection.prepareStatement(getRegisteredCoursesQuery);
                registeredCoursesStatement.setString(1, userEmail);
                ResultSet registeredCoursesResult = registeredCoursesStatement.executeQuery();

                while (registeredCoursesResult.next()) {
                    String courseTitle = registeredCoursesResult.getString("course_title");
                    String[] courseDetails = { courseTitle };
                    registeredCourses.add(courseDetails);
                }
                request.setAttribute("registeredCourses", registeredCourses);
                request.getRequestDispatcher("searchCourses.jsp").forward(request, response);
            } else {
                response.sendRedirect("errorPage.jsp"); // Example: Redirect to an error page
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}



