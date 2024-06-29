package com.controller;

import com.model.UserLogin;
import com.util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login/*"})
@MultipartConfig
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Connection conn = DBUtil.getConnection();
            String sql = "SELECT * FROM Users WHERE username = ? AND password = ? AND role = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, role);

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                // Retrieve user details from the database
                String userEmail = result.getString("email"); // Example retrieval, adjust as per your schema

                // Create a new UserLogin object
                UserLogin user = new UserLogin(username, password, role, userEmail);

                // Store the user object in session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Redirect to appropriate page based on role
                String destinationUrl = "SenaraiAduan-" + role + ".jsp";
                response.sendRedirect(destinationUrl);
            } else {
                // Show error message if login fails
                String errorMessage = "Invalid username, password, or role.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            // Close JDBC objects
            result.close();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
