package com.controller;

import com.model.ComplaintList;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/complaintDetails")
public class ComplaintDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crmwebproject";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int complaintId = Integer.parseInt(request.getParameter("id")); // Get complaint ID from URL parameter
        ComplaintList complaint = null;

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM complaints WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, complaintId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        complaint = new ComplaintList();
                        complaint.setId(rs.getInt("id"));
                        complaint.setStudentName(rs.getString("studentName"));
                        complaint.setStudentID(rs.getString("studentID"));
                        complaint.setStudentEmail(rs.getString("studentEmail"));
                        complaint.setPhoneNo(rs.getString("phoneNo"));
                        complaint.setLokasiBlok(rs.getString("lokasiBlok"));
                        complaint.setLokasiAras(rs.getString("lokasiAras"));
                        complaint.setLokasiBilik(rs.getString("lokasiBilik"));
                        complaint.setLokasiLain(rs.getString("lokasiLain"));
                        complaint.setJenisAduan(rs.getString("jenisAduan"));
                        complaint.setDetailAduan(rs.getString("detailAduan"));
                        complaint.setKeteranganAduan(rs.getString("keteranganAduan"));
                        complaint.setStatus(rs.getString("status"));
                        complaint.setTarikhAduan(rs.getTimestamp("tarikhAduan"));
                        complaint.setActionNotes(rs.getString("actionNotes"));
                        complaint.setActionStaff(rs.getString("actionStaff"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("complaint", complaint); // Set complaint object as request attribute
        request.getRequestDispatcher("/ButiranAduan-Pelajar.jsp").forward(request, response); // Forward to JSP page
    }
}
