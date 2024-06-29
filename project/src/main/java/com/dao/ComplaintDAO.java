package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.model.Complaint;
import com.util.DBUtil;

public class ComplaintDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/crmwebproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static int save(Complaint c) {
        int status = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO complaints(studentName, studentID, studentEmail, phoneNo, lokasiBlok, lokasiAras, lokasiBilik, lokasiLain, jenisAduan, detailAduan, keteranganAduan, status, tarikhAduan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, c.getStudentName());
            ps.setString(2, c.getStudentID());
            ps.setString(3, c.getStudentEmail());
            ps.setString(4, c.getPhoneNo());
            ps.setString(5, c.getLokasiBlok());
            ps.setString(6, c.getLokasiAras());
            ps.setString(7, c.getLokasiBilik());
            ps.setString(8, c.getLokasiLain());
            ps.setString(9, c.getJenisAduan());
            ps.setString(10, c.getDetailAduan());
            ps.setString(11, c.getKeteranganAduan());
            ps.setString(12, c.getStatus());
            ps.setString(13, c.getTarikhAduan());

            status = ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static List<Complaint> getAllComplaints() {
        List<Complaint> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaints");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint();
                c.setStudentName(rs.getString("studentName"));
                c.setStudentID(rs.getString("studentID"));
                c.setStudentEmail(rs.getString("studentEmail"));
                c.setPhoneNo(rs.getString("phoneNo"));
                c.setLokasiBlok(rs.getString("lokasiBlok"));
                c.setLokasiAras(rs.getString("lokasiAras"));
                c.setLokasiBilik(rs.getString("lokasiBilik"));
                c.setLokasiLain(rs.getString("lokasiLain"));
                c.setJenisAduan(rs.getString("jenisAduan"));
                c.setDetailAduan(rs.getString("detailAduan"));
                c.setKeteranganAduan(rs.getString("keteranganAduan"));
                c.setStatus(rs.getString("status"));
                c.setTarikhAduan(rs.getString("tarikhAduan"));
                list.add(c);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Complaint getComplaintById(String studentID) {
        Complaint complaint = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            String sql = "SELECT * FROM complaints WHERE studentID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, studentID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                complaint = new Complaint();
                complaint.setStudentID(resultSet.getString("studentID"));
                complaint.setStudentName(resultSet.getString("studentName"));
                complaint.setStudentEmail(resultSet.getString("studentEmail"));
                complaint.setPhoneNo(resultSet.getString("phoneNo"));
                complaint.setLokasiBlok(resultSet.getString("lokasiBlok"));
                complaint.setLokasiAras(resultSet.getString("lokasiAras"));
                complaint.setLokasiBilik(resultSet.getString("lokasiBilik"));
                complaint.setLokasiLain(resultSet.getString("lokasiLain"));
                complaint.setJenisAduan(resultSet.getString("jenisAduan"));
                complaint.setDetailAduan(resultSet.getString("detailAduan"));
                complaint.setKeteranganAduan(resultSet.getString("keteranganAduan"));
                complaint.setActionNotes(resultSet.getString("actionNotes"));
                complaint.setActionStaff(resultSet.getString("actionStaff"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return complaint;
    }

    public static int updateComplaint(Complaint c) {
        int status = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE complaints SET studentName=?, studentEmail=?, phoneNo=?, lokasiBlok=?, lokasiAras=?, lokasiBilik=?, lokasiLain=?, jenisAduan=?, detailAduan=?, keteranganAduan=?, status=?, actionNotes=?, actionStaff=? WHERE studentID=?");
            ps.setString(1, c.getStudentName());
            ps.setString(2, c.getStudentEmail());
            ps.setString(3, c.getPhoneNo());
            ps.setString(4, c.getLokasiBlok());
            ps.setString(5, c.getLokasiAras());
            ps.setString(6, c.getLokasiBilik());
            ps.setString(7, c.getLokasiLain());
            ps.setString(8, c.getJenisAduan());
            ps.setString(9, c.getDetailAduan());
            ps.setString(10, c.getKeteranganAduan());
            ps.setString(11, c.getStatus());
            ps.setString(12, c.getActionNotes());
            ps.setString(13, c.getActionStaff());
            ps.setString(14, c.getStudentID());

            status = ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int deleteComplaint(String studentID) {
        int status = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM complaints WHERE studentID=?");
            ps.setString(1, studentID);

            status = ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static List<Complaint> searchComplaints(String keyword) {
        List<Complaint> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaints WHERE jenisAduan LIKE ? OR keteranganAduan LIKE ?");
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint();
                c.setStudentName(rs.getString("studentName"));
                c.setStudentID(rs.getString("studentID"));
                c.setStudentEmail(rs.getString("studentEmail"));
                c.setPhoneNo(rs.getString("phoneNo"));
                c.setLokasiBlok(rs.getString("lokasiBlok"));
                c.setLokasiAras(rs.getString("lokasiAras"));
                c.setLokasiBilik(rs.getString("lokasiBilik"));
                c.setLokasiLain(rs.getString("lokasiLain"));
                c.setJenisAduan(rs.getString("jenisAduan"));
                c.setDetailAduan(rs.getString("detailAduan"));
                c.setKeteranganAduan(rs.getString("keteranganAduan"));
                c.setStatus(rs.getString("status"));
                c.setTarikhAduan(rs.getString("tarikhAduan"));
                list.add(c);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateComplaint(int id, String studentName, String studentID, String studentEmail) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}