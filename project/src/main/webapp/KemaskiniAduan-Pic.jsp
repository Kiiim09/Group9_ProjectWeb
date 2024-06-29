<%-- 
    Document   : KemaskiniAduan-Pic
    Created on : 28 Jun 2024, 12:05:53?am
    Author     : User
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kemaskini Tindakan Aduan PIC</title>
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
        <a align="center" href="SenaraiAduan-Pic.jsp"><img id="logo" style="width: 100px;" src="images/logo.png" alt="logo"/></a>
        <h2>Tindakan Aduan</h2>
        <a href="SenaraiAduan-Pic.jsp">Senarai Aduan</a>
    </div>
    
    <div class="container">
        <h1>Kemaskini Tindakan Aduan</h1>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Tindakan</h3>
            </div>
            
        <div class="box-body">
                <div class="w3-container">
                <h5 align="center"><b>Maklumat Pengadu</b></h5>
        </div>
            
        <form action="updateComplaint" method="post">
            
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" value="${complaint.id}"><br>
                    
                    <label for="studentName">Nama:</label>
                    <input type="text" id="studentName" name="studentName" value="${complaint.studentName}" readonly><br>
                    
                    <label for="studentID">ID:</label>
                    <input type="text" id="studentID" name="studentID" value="${complaint.studentID}" readonly><br>
                    
                    <label for="studentEmail">E-mail:</label>
                    <input type="text" id="studentEmail" name="studentEmail" value="${complaint.studentEmail}" readonly><br>
                    
                    <label for="phoneNo">No. Telefon:</label>
                    <input type="text" id="phoneNo" name="phoneNo" value="${complaint.phoneNo}" readonly><br>
                    
                    <div class="w3-container">
                        <h5 align="center"><b>Maklumat Aduan</b></h5>
                    </div>
                    
                    <label for="lokasiBlok">Blok:</label>
                    <input type="text" id="lokasiBlok" name="lokasiBlok" value="${complaint.lokasiBlok}" readonly><br>
                    
                    <label for="lokasiAras">Aras:</label>
                    <input type="text" id="lokasiAras" name="lokasiAras" value="${complaint.lokasiAras}" readonly><br>
                    
                    <label for="lokasiBilik">No. Bilik:</label>
                    <input type="text" id="lokasiBilik" name="lokasiBilik" value="${complaint.lokasiBilik}" readonly><br>
                    
                    <label for="lokasiLain">Lokasi lain-lain:</label>
                    <input type="text" id="lokasiLain" name="lokasiLain" value="${complaint.lokasiLain}" readonly><br>
                    
                    <label for="jenisAduan">Jenis Kerosakan/Aduan:</label>
                    <select id="jenisAduan" name="jenisAduan">
                        <option value="kerosakanAwam" ${complaint.jenisAduan eq 'kerosakanAwam' ? 'selected' : ''}>Kerosakan Awam</option>
                        <option value="kerosakanElektrikal" ${complaint.jenisAduan eq 'kerosakanElektrikal' ? 'selected' : ''}>Kerosakan Elektrikal</option>
                        <option value="kerosakanPerabot" ${complaint.jenisAduan eq 'kerosakanPerabot' ? 'selected' : ''}>Kerosakan Perabot</option>
                        <option value="lain-lain" ${complaint.jenisAduan eq 'lain-lain' ? 'selected' : ''}>Lain-lain (Aduan Umum)</option>
                    </select><br>
                    
                    <label for="detailAduan">Detail kerosakan/aduan:</label>
                    <input type="text" id="detailAduan" name="detailAduan" value="${complaint.detailAduan}" readonly><br>
                    
                    <label for="keteranganAduan">Keterangan kerosakan/aduan:</label>
                    <input id="keteranganAduan" name="keteranganAduan" value="${complaint.keteranganAduan}" readonly><br>
                    
                    <div class="w3-container">
                        <h5 align="center"><b>Maklumat Staf Bertugas</b></h5>
                    </div>

                    <label for="actionNotes">Catatan:</label>
                    <textarea id="actionNotes" name="actionNotes">${complaint.actionNotes}</textarea><br>

                    <label for="actionStaff">Staff Bertugas:</label>
                    <input type="text" id="actionStaff" name="actionStaff" value="${complaint.actionStaff}"><br>
                    
                    <button type="submit">Hantar</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>