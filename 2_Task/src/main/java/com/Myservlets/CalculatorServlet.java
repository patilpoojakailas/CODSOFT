package com.Myservlets;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    double sum;
    double average;
    int count;
    JSONArray valuesArray;
    double value;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");

        StringBuilder requestBody = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;

        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }

        JSONObject jsonData;
        try {
            jsonData = new JSONObject(requestBody.toString());
            int rowCount = jsonData.getInt("rowCount");
            valuesArray = jsonData.getJSONArray("values");

        } catch (JSONException e1) {
            e1.printStackTrace();
        }

        sum = 0;
        count = 0;

        for (int i = 0; i < valuesArray.length(); i++) {

            try {
                value = valuesArray.getDouble(i);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            sum += value;
            count++;
        }

        average = (count > 0) ? (sum / count) : 0;

        JSONObject jsonResponse = new JSONObject();
        try {
            jsonResponse.put("totalSum", sum);
            jsonResponse.put("average", average);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println("sum" + sum);
        response.getWriter().write(jsonResponse.toString());

        doGet(request, response);
    }
}

