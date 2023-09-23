<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <form action="SearchCoursesServlet" method="POST"> <!-- Note the action attribute -->
        <input type="text" name="email" placeholder="Email" required>
        <input type="text" name="name" placeholder="Name" required>
        <button type="submit">Search</button>
    </form>
</body>
</html>
