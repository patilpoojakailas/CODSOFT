var roundCounter = 1;
var maxAttempts = 4;
var attemptsLeft = maxAttempts;

function generateNumber() {
    disableGenerateButton();
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "GenerateServlet", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            enableSubmitButton();
            document.getElementById("guessInput").disabled = false;
            document.getElementById("newnum").innerText = "A new number has been generated!";
        }
    };
    xhr.send();
}

var RandomNumber;

function checkGuess() {
    var userGuess = parseInt(document.getElementById("guessInput").value);

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "CheckGuess?guess=" + userGuess, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var jsonResponse = JSON.parse(xhr.responseText);
            var message = jsonResponse.message;
            RandomNumber = jsonResponse.RandomNumber;
            attemptsLeft--;

            if (userGuess === RandomNumber || attemptsLeft === 0) {
                if (userGuess === RandomNumber && roundCounter < 3) {
                    enableNextRoundButton();
                } else {
                    if (roundCounter === 3 && userGuess === RandomNumber) {
                        document.getElementById("won").innerText = "You won the game!";
                        disableSubmitButton();
                        disableGenerateButton();
                        enablePlayAgainButton();
                    } else {
                        displayTryAgainButton();
                    }
                }
                disableGenerateButton();
                disableSubmitButton();
            }

            var messageElement = document.getElementById("Result");
            messageElement.innerText = message;
            var guessDisplay = "<br>Your guess: " + userGuess;
            messageElement.innerHTML += "<br>" + guessDisplay;
            displayRoundInfo();
        }
    };
    xhr.send();
}

function displayRoundInfo() {
    var roundInfo = "Round: " + roundCounter + " / 3";
    roundInfo += "\nTotal Attempts: " + maxAttempts;
    roundInfo += "\nRemaining Attempts: " + attemptsLeft;
    document.getElementById("roundInfo").innerText = roundInfo;
}

function disableSubmitButton() {
    document.getElementById("submitGuessButton").disabled = true;
}

function enableGenerateButton() {
    document.getElementById("generateButton").disabled = false;
}

function disableGenerateButton() {
    document.getElementById("generateButton").disabled = true;
}

function enableSubmitButton() {
    document.getElementById("submitGuessButton").disabled = false;
}

function enablePlayAgainButton() {
    document.getElementById("playAgainButton").style.display = "block";
}

function enableNextRoundButton() {
    document.getElementById("nextRoundButton").style.display = "block";
}

function displayTryAgainButton() {
    document.getElementById("tryAgainButton").style.display = "block";
}

function startNextRound() {
    roundCounter++;
    maxAttempts = (roundCounter === 2) ? 3 : 2;
    attemptsLeft = (roundCounter === 2) ? 3 : 2;
    enableSubmitButton();
    disableNextRoundButton();
    document.getElementById("guessInput").disabled = true;
    document.getElementById("guessInput").value = "";
    document.getElementById("Result").innerText = "";
    document.getElementById("newnum").innerText = "";
    document.getElementById("won").innerText = "";
    enableGenerateButton();
    displayRoundInfo();
}

function tryAgain() {
    roundCounter = 1;
    maxAttempts = 4;
    attemptsLeft = maxAttempts;
    enableSubmitButton();
    disableTryAgainButton();
    disablePlayAgainButton();
    document.getElementById("guessInput").disabled = true;
    document.getElementById("guessInput").value = "";
    document.getElementById("Result").innerText = "";
    document.getElementById("newnum").innerText = "";
    document.getElementById("won").innerText = "";
    enableGenerateButton();
    displayRoundInfo();
}

function disableNextRoundButton() {
    document.getElementById("nextRoundButton").style.display = "none";
}

function disableTryAgainButton() {
    document.getElementById("tryAgainButton").style.display = "none";
}

function disablePlayAgainButton() {
    document.getElementById("playAgainButton").style.display = "none";
}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        