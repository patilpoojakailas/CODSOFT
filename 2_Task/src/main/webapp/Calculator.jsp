<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Grade Calculator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            max-width: 50%;
            margin-top: 20px;
        }

        .btn {
            margin-right: 10px;
        }

        th {
            background-color: #F0E68C;
            color: #333;
        }

        h1 {
            background-color: #87CEEB;
            color: #333;
            padding: 10px;
            font-family: 'Comic Sans MS', sans-serif;
        }

        .btn-primary {
            background-color: #90EE90;
            color: #333;
        }

        .btn-success {
            background-color: #FFD700;
            color: #333;
        }

        .btn-danger {
            background-color: #FFA07A;
            color: #333;
        }

        .lead {
            color: #FF4500;
        }

        table {
            background-color: #FFFACD;
        }
    </style>

    <script src="Calculator.js"></script>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Grade Calculator</h1>
    
    <table class="table table-bordered" id="dataTable">
        <c:set var="initialRowCount" value="5" />
        <tr>
            <th>Subjects</th>
            <th>Marks out of 100</th>
        </tr>
        <c:forEach var="row" begin="1" end="${initialRowCount}">
            <tr>
                <td><input type="text" class="form-control" name="row${row}col1" placeholder="Subject${row}"></td>
                <td><input type="text" class="form-control" name="row${row}col2" placeholder="Marks"></td>
            </tr>
        </c:forEach>
    </table>
    
    <div class="mb-3">
        <button class="btn btn-primary" onclick="addRow()">Add Row</button>
        <button class="btn btn-success" onclick="calculate()">Calculate</button>
        <button class="btn btn-danger" onclick="reset()">Reset</button>
    </div>

    <p class="lead">Result:</p>
    <p id="totalSum">Total Marks: </p>
    <p id="average">Average: </p>
    <p id="grade">Grade: </p>
</div>
</body>
</html>
