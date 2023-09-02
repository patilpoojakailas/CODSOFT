<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="Script.js"></script>

<style>
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden;
}
body {
    background-image: url('pxfuel.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-color: #f8f9fa;
}
.game-container {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.result-text {
    font-size: 18px;
    font-weight: bold;
}
#won {
    font-size: 24px;
    font-weight: bold;
    color: #4CAF50;
    text-align: center;
    margin-top: 20px;
    padding: 10px;
    border-radius: 10px;
}
h1 {
    font-size: 36px;
    font-weight: bold;
    text-align: center;
    color: #333;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    margin-top: 20px;
    padding: 10px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
}
</style>
</head>
<body>
<div class="container mt-5 game-container" style="background-color: rgba(255, 255, 255, 0.9);">
    <h1 class="mb-4 text-center">Number Guessing Game</h1>
    <div class="text-center">
        <button class="btn btn-primary mb-3" onclick="generateNumber()" id="generateButton">Generate Number</button>
        <p id="newnum"></p>
    </div>
    <div class="mb-3">
        <input type="number" class="form-control" id="guessInput" placeholder="Enter your guess" disabled>
        <button class="btn btn-success mt-2" onclick="checkGuess()" id="submitGuessButton" disabled>Submit Guess</button>
    </div>
    <p class="result-text text-center" id="Result"></p>
    <div class="text-center">
        <button class="btn btn-primary" onclick="startNextRound()" style="display: none;" id="nextRoundButton">Next Round</button>
        <button class="btn btn-danger mt-3" onclick="tryAgain()" style="display: none;" id="tryAgainButton">Try Again</button>
    </div>
    <p class="text-center" id="roundInfo"></p>
    <p id="generatedNumber" style="display: none;"></p>
    <p class="result-text text-center" id="won"></p>
    <div class="text-center">
        <button class="btn btn-secondary mt-3" onclick="tryAgain()" style="display: none;" id="playAgainButton">Play Again</button>
    </div>
</div>
</body>
</html>
