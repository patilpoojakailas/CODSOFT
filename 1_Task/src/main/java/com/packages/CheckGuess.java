package com.packages;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/CheckGuess")
public class CheckGuess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckGuess() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userGuess = Integer.parseInt(request.getParameter("guess"));
        HttpSession session = request.getSession();
        int RandomNumber = (int) session.getAttribute("RandomNumber");

        String message;
        if (userGuess == RandomNumber) {
            message = "Congratulations! You guessed it!";
        } else if (userGuess < RandomNumber) {
            message = "Oops Too low!";
        } else {
            message = "Oops Too high!";
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonRes = new JSONObject();
        try {
            jsonRes.put("message", message);
            jsonRes.put("RandomNumber", RandomNumber);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        response.getWriter().write(jsonRes.toString());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
