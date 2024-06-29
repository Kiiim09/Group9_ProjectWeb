<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senarai Aduan Pic</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
            overflow-y: auto;
        }

        h1 {
            text-align: center;
            color: #8A2BE2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background: #a495b5;
            color: white;
        }

        form {
            display: flex;
            flex-direction: column;
            max-width: 600px;
            margin: 0 auto 20px auto;
        }

        input[type="text"],
        button {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
        }

        button {
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
    </style>
</head>
<body>
    <div class="sidenav">
        <a align="center" href="SenaraiAduan-Pic.jsp"><img id="logo" style="width: 100px;" src="images/logo.png" alt="logo"/></a>
        <h2>Senarai Aduan</h2>
        <a href="SenaraiAduan-Pic.jsp">Senarai Aduan</a>
    </div>
    <div class="container">
        <h1>Senarai Aduan Pelajar</h1>
        <form method="get" action="ComplaintListServlet">
            <input type="hidden" name="pageSource" value="Pic">
            <input type="text" id="searchInput" name="search" placeholder="Cari aduan...">
            <button type="submit">Cari</button>
        </form>

        
        <table id="aduanTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Student ID</th>
                    <th>Student Email</th>
                    <th>Phone No</th>
                    <th>Blok</th>
                    <th>Aras</th>
                    <th>No Bilik</th>
                    <th>Lokasi Lain</th>
                    <th>Jenis Aduan</th>
                    <th>Tarikh Aduan</th>
                    <th>Action Notes</th>
                    <th>Action Staff</th>
                    <th>Tindakan</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="complaint" items="${complaintList}">
                    <tr>
                        <td>${complaint.id}</td>
                        <td>${complaint.studentName}</td>
                        <td>${complaint.studentID}</td>
                        <td>${complaint.studentEmail}</td>
                        <td>${complaint.phoneNo}</td>
                        <td>${complaint.lokasiBlok}</td>
                        <td>${complaint.lokasiAras}</td>
                        <td>${complaint.lokasiBilik}</td>
                        <td>${complaint.lokasiLain}</td>
                        <td>${complaint.jenisAduan}</td>
                        <td>${complaint.tarikhAduan}</td>
                        <td>${complaint.actionNotes}</td>
                        <td>${complaint.actionStaff}</td>
                        <td><a href="KemaskiniAduan-Pic.jsp?id=${complaint.id}">EDIT</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        // Filter function for search input
        document.getElementById('searchInput').addEventListener('keyup', function() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("aduanTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Index 1 for Student Name
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }       
            }
        });
    </script>
</body>
</html>