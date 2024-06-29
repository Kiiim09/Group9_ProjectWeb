package com.controller;

import com.model.ComplaintList;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/complaints")
public class ComplaintListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crmwebproject";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // List to hold ComplaintList objects
        List<ComplaintList> complaintList = new ArrayList<>();

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL query to retrieve complaints
            String sql = "SELECT * FROM complaints";
            String search = request.getParameter("search");
            if (search != null && !search.isEmpty()) {
                sql += " WHERE studentName LIKE ? OR studentID LIKE ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, "%" + search + "%");
                stmt.setString(2, "%" + search + "%");
            } else {
                stmt = conn.prepareStatement(sql);
            }

            // Execute the query
            rs = stmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                // Create ComplaintList object for each row
                ComplaintList complaint = new ComplaintList();
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

                // Add complaint to list
                complaintList.add(complaint);
            }

            // Set the attribute in request to pass data to JSP
            request.setAttribute("complaintList", complaintList);

            // Retrieve the page source from request parameter
            String pageSource = request.getParameter("pageSource");
            System.out.println("Page Source: " + pageSource); // Debugging statement

            // Forward to appropriate JSP based on page source
            if ("Admin".equalsIgnoreCase(pageSource)) {
                request.getRequestDispatcher("/SenaraiAduan-Admin.jsp").forward(request, response);
            } else if ("Pic".equalsIgnoreCase(pageSource)) {
                request.getRequestDispatcher("/SenaraiAduan-Pic.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/SenaraiAduan-Pelajar.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle errors properly in your application
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Log or handle SQLException properly
            }
        }
    }
}
