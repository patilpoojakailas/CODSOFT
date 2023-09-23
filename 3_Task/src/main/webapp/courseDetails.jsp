<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.module.FindException" %>   
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.SQLException" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="com.mysql.cj.jdbc.Driver" %>

<%
    String courseCode = request.getParameter("courseCode");
    String courseTitle = "";
    String courseDescription = "";
    int courseCapacity = 0;
    String courseSchedule = "";

    int studentCount = 0;
    boolean registrationFull = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/course", "root", "7890");

        String sql = "SELECT * FROM course WHERE course_code = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, courseCode);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()) {
            courseTitle = resultSet.getString("title");
            courseDescription = resultSet.getString("description");
            courseCapacity = resultSet.getInt("capacity");
            courseSchedule = resultSet.getString("schedule");
        }

        sql = "SELECT COUNT(*) AS student_count FROM student WHERE course_code = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, courseCode);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            studentCount = resultSet.getInt("student_count");
            registrationFull = studentCount >= courseCapacity;
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();

    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  
    .page-container {
        background-color: #f8f9fa;
        padding: 30px 0;
        min-height: 100vh;
    }
    .course-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }
    /* Style for the registration message */
    .registration-message {
        color: red;
        font-weight: bold;
        margin-top: 10px;
    }
</style>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.min.js"></script>

<div class="container mt-5">
    <div class="container-fluid page-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="course-card">
                        <h1 class="display-4 text-center"><%= courseTitle %></h1>
                        <hr class="my-4">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-primary">Course Details</h3>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Description:</strong></li>
                                    <li class="list-group-item"><%= courseDescription %></li>
                                    <li class="list-group-item"><strong>Capacity:</strong> <%= courseCapacity %></li>
                                    <li class="list-group-item"><strong>Schedule:</strong> <%= courseSchedule %></li>
                                </ul>
                                <!-- Registration form for the course -->
                                <form action="registration.jsp" method="GET">
                                    <input type="hidden" name="course_code" value="<%= courseCode %>">
                                    <input type="hidden" name="courseTitle" value="<%= courseTitle %>">
                                    <!-- Check if registration is full and disable the button accordingly -->
                                    <button type="submit" class="btn btn-primary" <%= registrationFull ? "disabled" : "" %>>Register</button>
                                    <!-- Display a registration message if registration is full -->
                                    <p class="registration-message"><%= registrationFull ? "Registration Full for this Course" : "" %></p>
                                </form>
                                <!-- Display the count of total registrations -->
                                <p>Total Registrations: <%= studentCount %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

