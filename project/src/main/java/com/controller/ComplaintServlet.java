package com.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.model.Complaint;
import com.dao.ComplaintDAO;
import java.sql.Timestamp;
import java.util.List;

public class ComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Complaint> complaints;
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            complaints = ComplaintDAO.searchComplaints(searchQuery);
        } else {
            complaints = ComplaintDAO.getAllComplaints();
        }

        request.setAttribute("complaints", complaints);
        RequestDispatcher rd = request.getRequestDispatcher("SenaraiAduan-Pelajar.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentID = request.getParameter("studentID");
        String studentEmail = request.getParameter("studentEmail");
        String phoneNo = request.getParameter("phoneNo");
        String lokasiBlok = request.getParameter("lokasiBlok");
        String lokasiAras = request.getParameter("lokasiAras");
        String lokasiBilik = request.getParameter("lokasiBilik");
        String lokasiLain = request.getParameter("lokasiLain");
        String jenisAduan = request.getParameter("jenisAduan");
        String detailAduan = request.getParameter("detailAduan");
        String keteranganAduan = request.getParameter("keteranganAduan");

        Complaint complaint = new Complaint();
        complaint.setStudentName(studentName);
        complaint.setStudentID(studentID);
        complaint.setStudentEmail(studentEmail);
        complaint.setPhoneNo(phoneNo);
        complaint.setLokasiBlok(lokasiBlok);
        complaint.setLokasiAras(lokasiAras);
        complaint.setLokasiBilik(lokasiBilik);
        complaint.setLokasiLain(lokasiLain);
        complaint.setJenisAduan(jenisAduan);
        complaint.setDetailAduan(detailAduan);
        complaint.setKeteranganAduan(keteranganAduan);
        complaint.setStatus("Pending");
        complaint.setTarikhAduan(new Timestamp(System.currentTimeMillis()).toString());

        int status = ComplaintDAO.save(complaint);
        if (status > 0) {
            response.sendRedirect("SenaraiAduan-Pelajar.jsp");
        } else {
            request.setAttribute("message", "Unable to submit complaint. Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("BorangAduan-Pelajar.jsp");
            rd.forward(request, response);
        }
    }
}