package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnection.Dbcon;
import UserDao.userDAO;
import model.user;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		// to print in the web screen
		try (PrintWriter out = response.getWriter()) {
			out.print("Servlets ");

			
			String email = request.getParameter("Login-mail");
			String password = request.getParameter("Login-password");
			userDAO userDao = new userDAO(Dbcon.getConnection());
			user users = userDao.userlogin(email, password);

			if (users != null) {
				request.getSession().setAttribute("pass", users);
				response.sendRedirect("index.jsp");
				out.print("login succesfully");
			} else {
				out.print("login failed");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		}
	}

}
