<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
    body {
      background-color: #f0f0f0;
    }
    .container {
      max-width: 800px;
      background-color: #ffffff;
      border-radius: 10px;
      padding: 20px;
      margin-top: 50px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    .h4 {
      color: #333;
    }
    .card {
      background-color: #f8f9fa;
      border: none;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }
    .card p {
      font-size: 18px;
      color: #555;
    }
    .card ul {
      list-style-type: disc;
      padding-left: 20px;
    }
    .card h5 {
      color: #333;
    }
  </style>
</head>
<body>

<div class="container">
  <label class="h4">Hey!!! Let's play the game</label><br><br>
  <div class="card">
    <p>I will generate any random number, and you have to guess that number.</p>

    <h5>Game Instructions:</h5>
    <ul>
      <li>The game consists of three rounds.</li>
      <li>In each round, you will be given a certain number of chances to guess the correct number.</li>
      <li>If your guess is accurate, you will proceed to the next round.</li>
    </ul>

    <h5>Round 1:</h5>
    <p>You will have four chances to guess the number.</p>

    <h5>Round 2:</h5>
    <p>You will have three chances to guess the number.</p>

    <h5>Final Round:</h5>
    <p>If you successfully guess the number in the second round, you will advance to the final round.</p>
    <p>In the final round, you will have only two chances to guess the number.</p>

    <p>If you guess correctly in the final round, you will be the winner.</p>
 
	<a href="game.jsp"><button class="btn btn-success">Play</button></a>
  </div>
</div>
</body>
</html>