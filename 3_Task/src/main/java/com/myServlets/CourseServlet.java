package com.myServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");

        if ("all_courses".equals(action)) {
            // Load data and forward to all_courses.jsp
            // You can load data from a database or other source
            request.getRequestDispatcher("/all_courses.jsp").forward(request, response);
        } else if ("available_courses".equals(action)) {
            // Load data and forward to available_courses.jsp
            request.getRequestDispatcher("/available_courses.jsp").forward(request, response);
        } else if ("my_courses".equals(action)) {
            // Load data and forward to my_courses.jsp
            request.getRequestDispatcher("/my_courses.jsp").forward(request, response);
        }
        
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
