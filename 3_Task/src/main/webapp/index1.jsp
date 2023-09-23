<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">
<script>
        function loadContent(action) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("content").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", "CourseServlet?action=" + action, true);
            xhr.send();
        }
    </script>

</head>
<body>

<div class="vertical-nav">
        <button onclick="loadContent('all_courses')">All Courses</button>
        <button onclick="loadContent('available_courses')">Available Courses</button>
        <button onclick="loadContent('my_courses')">My Courses</button>
    </div>
    <div id="content">  
    </div>
</body>
</html>
