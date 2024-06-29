<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.model.ComplaintList" %>
<jsp:useBean id="complaint" class="com.model.ComplaintList" scope="request" />

<%-- 
    Document   : ComplaintDetails
    Created on : Jun 29, 2024
    Author     : S67554
--%>

<%
    int complaintId = Integer.parseInt(request.getParameter("id")); // Get complaint ID from URL parameter

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/crmwebproject";
        String jdbcUser = "root";
        String jdbcPassword = "admin";
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

        String sql = "SELECT * FROM complaints WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, complaintId);
        rs = stmt.executeQuery();

        if (rs.next()) {
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
        } else {
            out.println("<p>No complaint found with the given ID.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Butiran Aduan Pelajar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(238,174,202);
            background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(155,148,233,1) 100%);
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }
        .sidenav {
            height: 100%;
            width: 220px;
            position: fixed; 
            background-color: #4682B4;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidenav h2 {
            color: black;
            text-align: center;
        }

        .sidenav a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: black;
            display: block;
        }

        .sidenav a:hover {
            color: black;
            background-color: #91aeb3;
        }

        .container {
            margin-left: 220px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex-grow: 1;
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            overflow-y: auto;
        }

        h1, h2, h3 {
            text-align: left;
            color: #8A2BE2;
        }

        form {
            display: flex;
            flex-direction: column;
            max-width: 1250px;
            margin: 0 auto;
        }

        label {
            margin-bottom: 5px;
            color: #555;
        }

        input,
        textarea,
        select {
            margin-bottom: 15px;
            padding: 8px;
            border: 1px;
            border-radius: 3px;
            background-color: #FAF3DD;
        }

        button {
            padding: 10px;
            background-color: #87CEEB;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #4682B4;
        }

        .w3-container {
            background: #a495b5;
            padding: 1px;
            border-radius: 3px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .box {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: #fff;
        }

        .box-header {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .box-title {
            margin: 0;
            font-size: 18px;
        }

        .box-body {
            padding: 10px;
        }

        .custom-select select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #FAF3DD;
        }

        @media screen and (max-width: 600px) {
            body {
                flex-direction: column;
            }

            .sidenav {
                width: 100%;
                height: auto;
                position: relative;
            }

            .sidenav a {
                text-align: center;
                float: none;
            }
        }
    </style>
</head>
<body>
    <div class="sidenav">
        <a align="center" href="SenaraiAduan-Pelajar.jsp"><img id="logo" style="width: 100px;" src="images/logo.png" alt="logo"/></a>
        <h2>Aduan Pelajar</h2>
        <a href="AduanBaru-Pelajar.jsp">Aduan Baru</a>
        <a href="SenaraiAduan-Pelajar.jsp">Senarai Aduan</a>
    </div>
    <div class="container">
        <h1>Butiran Aduan</h1>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Butiran</h3>
            </div>

            <div class="box-body">
                <div class="w3-container">
                    <h5 align="center"><b>Maklumat Pengadu</b></h5>
                </div>

                <form action="ComplaintListServlet" method="post">
                    <label for="studentName">Nama:</label>
                    <input type="text" id="studentName" name="studentName" value="<%= complaint.getStudentName() %>" readonly><br>

                    <label for="studentID">ID:</label>
                    <input type="text" id="studentID" name="studentID" value="<%= complaint.getStudentID() %>" readonly><br>

                    <label for="studentEmail">E-mail:</label>
                    <input type="text" id="studentEmail" name="studentEmail" value="<%= complaint.getStudentEmail() %>" readonly><br>

                    <label for="phoneNo">No. Telefon:</label>
                    <input type="text" id="phoneNo" name="phoneNo" value="<%= complaint.getPhoneNo() %>" readonly><br>
                    
                    <div class="w3-container">
                        <h5 align="center"><b>Maklumat Aduan</b></h5>
                    </div>

                    <label for="lokasiBlok">Blok:</label>
                    <input type="text" id="lokasiBlok" name="lokasiBlok" value="<%= complaint.getLokasiBlok() %>" readonly><br>

                    <label for="lokasiAras">Aras:</label>
                    <input type="text" id="lokasiAras" name="lokasiAras" value="<%= complaint.getLokasiAras() %>" readonly><br>

                    <label for="lokasiBilik">No. Bilik:</label>
                    <input type="text" id="lokasiBilik" name="lokasiBilik" value="<%= complaint.getLokasiBilik() %>" readonly><br>

                    <label for="lokasiLain">Lokasi lain-lain:</label>
                    <input type="text" id="lokasiLain" name="lokasiLain" value="<%= complaint.getLokasiLain() %>" readonly><br>

                    <label for="jenisAduan">Jenis Kerosakan/Aduan:</label>
                    <input type="text" id="jenisAduan" name="jenisAduan" value="<%= complaint.getJenisAduan() %>" readonly><br>

                    <label for="detailAduan">Detail kerosakan/aduan:</label>
                    <input type="text" id="detailAduan" name="detailAduan" value="<%= complaint.getDetailAduan() %>" readonly><br>

                    <label for="keteranganAduan">Keterangan kerosakan/aduan:</label>
                    <input id="keteranganAduan" name="keteranganAduan" value="<%= complaint.getKeteranganAduan() %>" readonly><br>

                    <div class="w3-container">
                        <h5 align="center"><b>Maklumat Staf Bertugas</b></h5>
                    </div>

                    <label for="actionNotes">Catatan:</label>
                    <input id="actionNotes" name="actionNotes" value="<%= complaint.getActionNotes() %>" readonly><br>

                    <label for="actionStaff">Staff Bertugas:</label>
                    <input id="actionStaff" name="actionStaff" value="<%= complaint.getActionStaff() %>" readonly><br>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
