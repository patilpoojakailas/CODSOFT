<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Course Catalog</title>
    <style>
        .course-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 columns, adjust as needed */
            grid-gap: 20px; /* Adjust the gap between courses */
        }

        .course-card {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            background-color: #fff;
        }

        .course-card img {
            max-width: 100%;
            height: auto;
        }

        .course-title {
            font-size: 16px;
            font-weight: bold;
        }

        .course-link {
            text-decoration: none;
            color: #007bff; /* Adjust link color */
        }

        .image-container {
            width: 100%;
            padding-top: 5%; /* 4:3 aspect ratio */
            position: relative;
            overflow: hidden;
        }

        /* .image-container img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
        } */
    </style>
</head>
<body>
<div class="course-grid">
    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/course", "root", "7890");

            // Define the SQL query to get course information with student counts
         String sqlQuery = "SELECT c.course_code, c.title, COUNT(s.stud_id) AS student_count " +
                  "FROM course c " +
                  "LEFT JOIN student s ON c.course_code = s.course_code " +
                  "GROUP BY c.course_code, c.title " +
                  "HAVING student_count < 50";


            // Create a prepared statement and execute the query
            preparedStatement = connection.prepareStatement(sqlQuery);
            resultSet = preparedStatement.executeQuery();

            
            // Create a set to store course codes from the database
            Set<String> courseCodesFromDB = new HashSet<String>();

            // Fetch and store course codes from the database
            while (resultSet.next()) {
            	System.out.println(resultSet);
                System.out.print(resultSet.getObject(1)+" ");
        		System.out.print(resultSet.getObject(2)+" ");
        		System.out.print(resultSet.getObject(3)+" ");
        		System.out.println("\n");
                String courseCode = resultSet.getString("course_code");
                System.out.println();
                courseCodesFromDB.add(courseCode);
            }

            // Define the list of predefined courses
            String[][] courses = {
            {"Web Development", "Learn web development", "images/Web2.jpg", "WD101"},
            {"Mobile App Development", "Develop mobile apps", "images/MOBILE-APP.jpg", "MAD102"},
            {"Artificial Intelligence", "Artificial Intelligence", "images/AI-1.jpg", "AI103"},
            {"Data Science", "Data Science", "images/ds1.avif", "DS104"},
            {"Machine Learning", "Machine Learning", "images/Machine-Learning.png", "ML105"},
            {"Cloud Computing", "Cloud Computing", "images/cloud.webp", "CC106"},
            {"Data Analytics", "Data Analytics", "images/Data-Analytics1.jpg", "DA107"},
            {"Blockchain Technology", "Blockchain Technology", "images/Blockchain.png", "BT108"},
            {"DevOps and Automation", "DevOps and Automation", "images/devops-automation.jpg", "DA109"},
            {"IT Project Management", "IT Project Management", "images/project.jpg", "PM110"},
            {"Game Development", "Game Development", "images/game.jpg", "GD111"},
            {"Internet of Things (IoT) Development", "Internet of Things (IoT) Development", "images/iot.jpg", "IoT112"}
        };

            // Iterate through the predefined courses and display those that match
            for (String[] course : courses) {
            String courseName = course[0];
            String description = course[1];
            String imageName = course[2];
            String courseCode = course[3];

                if (courseCodesFromDB.contains(courseCode)) {
    %>
    <a class="course-link" href="courseDetails.jsp?courseCode=<%= courseCode %>">
        <div class="course-card">
            <div class="image-container">
                <img src="<%= imageName %>" alt="<%= courseName %>">
            </div>
            <div class="course-title"><%= courseName %></div>
            <div class="course-description"><%= description %></div>
            <div class="course-link">Learn More</div>
        </div>
    </a>
    
    <%
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the reverse order of their creation
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</div>

</body>
</html>
