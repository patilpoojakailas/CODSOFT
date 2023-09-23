<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Your Registered Courses</title>
    <style>
        .course-card {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            background-color: #fff;
            margin: 10px;
            width: 300px; /* Adjust card width as needed */
            display: inline-block;
        }

        .course-card img {
            max-width: 100%;
            height: auto;
        }

        .course-title {
            font-size: 16px;
            font-weight: bold;
        }

        .course-description {
            font-size: 14px;
        }

        .course-link {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div>
    <h2>Your Registered Courses</h2>
    <c:forEach var="course" items="${registeredCourses}">
        <p>${course[0]}</p>
    </c:forEach>
</div>

<%
boolean isTitlePresent = false;

List<String[]> registeredCourses = (List<String[]>) request.getAttribute("registeredCourses");
if (registeredCourses != null && !registeredCourses.isEmpty()) {
    for (String[] course : registeredCourses) {
        String courseTitle = course[0];
        if (courseTitle.equals("Web Development")) {
%>

<div class="course-card">
    <img src="images/Web2.jpg" alt="Web Development">
    <div class="course-title">Web Development</div>
    <div class="course-description">Learn web development</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=WD101">Learn More</a><br>
    <p>WD101</p>
     <form action="RemoveCourseServlet" method="post">
     			
                <input type="hidden" name="courseCode" value="WD101"> <!-- Course code as value -->
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Mobile App Development")) { %>

<div class="course-card">
    <img src="images/MOBILE-APP.jpg" alt="Mobile App Development">
    <div class="course-title">Mobile App Development</div>
    <div class="course-description">Develop mobile apps</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=MAD102">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Artificial Intelligence")) { %>

<div class="course-card">
    <img src="images/AI-1.jpg" alt="Artificial Intelligence">
    <div class="course-title">Artificial Intelligence</div>
    <div class="course-description">Artificial Intelligence</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=AI103">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Data Science")) { %>

<div class="course-card">
    <img src="images/ds1.avif" alt="Data Science">
    <div class="course-title">Data Science</div>
    <div class="course-description">Data Science</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=DS104">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Machine Learning")) { %>

<div class="course-card">
    <img src="images/Machine-Learning.png" alt="Machine Learning">
    <div class="course-title">Machine Learning</div>
    <div class="course-description">Machine Learning</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=ML105">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Cloud Computing")) { %>

<div class="course-card">
    <img src="images/cloud.webp" alt="Cloud Computing">
    <div class="course-title">Cloud Computing</div>
    <div class="course-description">Cloud Computing</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=CC106">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Data Analytics")) { %>

<div class="course-card">
    <img src="images/Data-Analytics1.jpg" alt="Data Analytics">
    <div class="course-title">Data Analytics</div>
    <div class="course-description">Data Analytics</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=DA107">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Blockchain Technology")) { %>

<div class="course-card">
    <img src="images/Blockchain.png" alt="Blockchain Technology">
    <div class="course-title">Blockchain Technology</div>
    <div class="course-description">Blockchain Technology</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=BT108">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("DevOps and Automation")) { %>

<div class="course-card">
    <img src="images/devops-automation.jpg" alt="DevOps and Automation">
    <div class="course-title">DevOps and Automation</div>
    <div class="course-description">DevOps and Automation</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=DA109">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("IT Project Management")) { %>

<div class="course-card">
    <img src="images/project.jpg" alt="IT Project Management">
    <div class="course-title">IT Project Management</div>
    <div class="course-description">IT Project Management</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=PM110">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Game Development")) { %>

<div class="course-card">
    <img src="images/game.jpg" alt="Game Development">
    <div class="course-title">Game Development</div>
    <div class="course-description">Game Development</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=GD111">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<% } else if (courseTitle.equals("Internet of Things (IoT) Development")) { %>

<div class="course-card">
    <img src="images/iot.jpg" alt="Internet of Things (IoT) Development">
    <div class="course-title">Internet of Things (IoT) Development</div>
    <div class="course-description">Internet of Things (IoT) Development</div>
    <a class="course-link" href="courseDetails.jsp?courseCode=IoT112">Learn More</a><br>
    <form action="RemoveCourseServlet" method="post">
                <button type="submit">Remove</button>
            </form>
</div>

<%}}} %>

</body>
</html>

