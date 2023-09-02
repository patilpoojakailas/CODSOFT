package com.packages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GenerateServlet")
public class GenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public GenerateServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int RandomNumber = (int) (Math.random() * 5) + 1; 
	        HttpSession session = request.getSession();
	        session.setAttribute("RandomNumber", RandomNumber);
	        
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	        response.setContentType("text/plain");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(String.valueOf(RandomNumber));
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
