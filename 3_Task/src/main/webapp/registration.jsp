<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Student Registration</h1>
    <form action="RegistrationServlet" method="post">
        <!-- Course Information (You can add more fields as needed) -->
        <input type="hidden" name="courseId" value="<%= request.getParameter("courseId") %>">
        <input type="hidden" name="courseTitle" value="<%= request.getParameter("courseTitle") %>">
        
        <!-- Student Information -->
        <label for="studName">Name:</label>
        <input type="text" id="studName" name="studName" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber"><br>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="3" required></textarea><br>

        <label>Gender:</label>
        <input type="radio" id="male" name="gender" value="Male" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="Female">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="Other">
        <label for="other">Other</label><br>

        <label for="program">Program:</label>
        <input type="text" id="program" name="program" required><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br>

        <!-- Submit Button -->
        <input type="submit" value="submit">
    </form>
</body>
</html>