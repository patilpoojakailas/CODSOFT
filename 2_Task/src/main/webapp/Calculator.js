var rowCount = 5;
var average;
var totalSum;

function addRow() {
    rowCount++;
    var table = document.getElementById("dataTable");
    var newRow = table.insertRow(-1);

    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);

    var input1 = document.createElement("input");
    input1.type = "text";
    input1.className = "form-control";
    input1.name = "row" + rowCount + "col1";

    var input2 = document.createElement("input");
    input2.type = "text";
    input2.className = "form-control";
    input2.name = "row" + rowCount + "col2";

    cell1.appendChild(input1);
    cell2.appendChild(input2);
}

function calculate() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "CalculatorServlet", true);

    var values = [];
    var totalMarks = 0;

    for (var i = 1; i <= rowCount; i++) {
        var input = document.getElementsByName("row" + i + "col2")[0];
        if (input.value.trim() !== "") {
            values.push(parseFloat(input.value));
            totalMarks += 100;
        }
    }

    var requestBody = JSON.stringify({ rowCount: rowCount, values: values });

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var jsonResponse = JSON.parse(xhr.responseText);

            var marksObtained = jsonResponse.totalSum;
            var marksText = marksObtained + " / " + totalMarks;

            document.getElementById("totalSum").textContent = "Total Marks: " + marksText;
            document.getElementById("average").textContent = "Average: " + jsonResponse.average.toFixed(2);

            var grade = calculateGrade(jsonResponse.average);
            document.getElementById("grade").textContent = "Grade: " + grade;
        }
    };

    xhr.send(requestBody);

    function calculateGrade(average) {
        if (average >= 90) {
            return "A+";
        } else if (average >= 85 && average <= 89.99) {
            return "A";    
        } else if (average >= 80 && average <= 84.99) {
            return "B";
        } else if (average >= 70 && average <= 79.99) {
            return "C";
        } else if (average >= 60 && average <= 69.99) {
            return "D";
        } else {
            return "F";
        }
    }
}

function reset() {
    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].type === "text") {
            inputs[i].value = "";
        }
    }

    totalSum = 0;
    average = 0;

    var totalSumElement = document.getElementById("totalSum");
    var averageElement = document.getElementById("average");

    totalSumElement.textContent = "Total Marks: ";
    averageElement.textContent = "Average: ";

    var gradeElement = document.getElementById("grade");
    gradeElement.textContent = "Grade: ";
}
