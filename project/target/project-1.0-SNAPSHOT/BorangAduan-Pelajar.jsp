<%-- 
    Document   : borangAduan
    Created on : Jun 5, 2024, 11:10:17 PM
    Author     : S67554
--%>

<%@page import="com.dao.ComplaintDAO"%>
<%@page import="com.model.Complaint"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borang Aduan Pelajar</title>
    <%
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
        String status = "Pending";
        String tarikhAduan = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

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
        complaint.setStatus(status);
        complaint.setTarikhAduan(tarikhAduan);

        int statusResult = ComplaintDAO.save(complaint);

        if (statusResult > 0) {
            response.sendRedirect("SenaraiAduan-Pelajar.jsp");
        } else {
            out.println("Sorry! Unable to save record");
        }
    %>
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
            display: unset;
            flex-direction: column;
            max-width: 600px;
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
                float: left;
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
        <h2>Aduan Pelajar</h2>
        <a href="AduanBaru-Pelajar.jsp">Aduan Baru</a>
        <a href="SenaraiAduan-Pelajar.jsp">Senarai Aduan</a>
    </div>
    <div class="container">
        <h1>Borang Aduan</h1>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">‎Butiran Aduan</h3>
            </div>
            <div class="box-body">
                <div class="w3-container">
                    <h5 align="center"><b>Maklumat Pengadu</b></h5>
                </div>
                <form id="complaintForm" action="SenaraiAduan-Pelajar.jsp" method="post">
                <p><b>Nama:</b> ${param.studentName}</p>
                <p><b>ID:</b> ${param.studentID}</p>
                <p><b>Email:</b> ${param.studentEmail}</p>
                <p><b>No. Telefon:</b> ${param.phoneNo}</p>
                
                <div class="w3-container">
                    <h5 align="center"><b>Maklumat Aduan</b></h5>
                </div>
                <p><b>Blok:</b> ${param.lokasiBlok}</p>
                <p><b>Aras:</b> ${param.lokasiAras}</p>
                <p><b>No. Bilik:</b> ${param.lokasiBilik}</p>
                <p><b>Lokasi Lain-lain:</b> ${param.lokasiLain}</p>
                <p><b>Jenis Kerosakan/Aduan:</b> ${param.jenisAduan}</p>
                <p><b>Detail Kerosakan/Aduan:</b> ${param.detailAduan}</p>
                <p><b>Keterangan Kerosakan/Aduan:</b> ${param.keteranganAduan}</p>
                
                <button type="submit">Hantar</button><br>
            </form>
        </div>
    </div>
    </div>
</body>
</html>
