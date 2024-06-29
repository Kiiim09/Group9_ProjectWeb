package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateComplaint")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crmwebproject";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.getWriter().println("Invalid ID!");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID format!");
            return;
        }

        String jenisAduan = request.getParameter("jenisAduan");
        String detailAduan = request.getParameter("detailAduan");
        String keteranganAduan = request.getParameter("keteranganAduan");
        String actionNotes = request.getParameter("actionNotes");
        String actionStaff = request.getParameter("actionStaff");

        String sql = "UPDATE complaints SET jenisAduan = ?, detailAduan = ?, keteranganAduan = ?, actionNotes = ?, actionStaff = ? WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, jenisAduan);
            stmt.setString(2, detailAduan);
            stmt.setString(3, keteranganAduan);
            stmt.setString(4, actionNotes);
            stmt.setString(5, actionStaff);
            stmt.setInt(6, id);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/SenaraiAduan-Admin.jsp");
            } else {
                response.getWriter().println("Update failed!");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
