<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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

    </style>
</head>
<body>
<div style="position: relative; margin-top: 0;">
    <h1><img src="images/header2.jpg" alt="Header Image" style="width: 100%; height: 400px; margin-bottom: 10px; margin-top: 0;"/></h1>
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; background-color: rgba(255, 255, 255, 0.8); padding: 10px;">
        <p style="font-size: 24px; color: #333;">Learn today and have a bright future...</p>
    </div>
</div>
<div class="course-grid">
    <%
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
        
        for (String[] course : courses) {
            String courseName = course[0];
            String description = course[1];
            String imageName = course[2];
            String courseCode = course[3];
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
    %>
</div>
</body>
</html>


















