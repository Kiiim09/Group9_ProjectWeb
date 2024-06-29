<%-- 
    Document   : AduanBaru-Pelajar
    Created on : Jun 25, 2024, 11:00:00 AM
    Author     : Akim
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aduan Baru - Pelajar</title>
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
        <h1>Aduan Baru</h1>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Borang Aduan</h3>
            </div>
            <div class="box-body">
                <div class="w3-container">
                    <h5 align="center"><b>Maklumat Pengadu</b></h5>
                </div>
                
                <form id="complaintForm" action="BorangAduan-Pelajar.jsp" method="post">
                    <label for="studentName">Nama:</label>
                    <input type="text" id="studentName" name="studentName" required>
                    
                    <label for="studentID">ID:</label>
                    <input type="text" id="studentID" name="studentID" required>
                    
                    <label for="studentEmail">Email:</label>
                    <input type="email" id="studentEmail" name="studentEmail" required>
                    
                    <label for="phoneNo">No. Telefon:</label>
                    <input type="text" id="phoneNo" name="phoneNo" required>
                    
                    <div class="w3-container">
                        <h5 align="center"><b>Maklumat Aduan</b></h5>
                    </div>
                    <label for="lokasiBlok">Blok:</label>
                    <div class="custom-select">
                        <select id="lokasiBlok" name="lokasiBlok" required>
                            <option value="">Pilih Blok</option>
                            <option value="ATB">At-Thabrani (ATB)</option>
                            <option value="ATT">At-Tarmidzi (ATT)</option>
                            <option value="IS">Ibnu Sina (IS)</option>
                            <option value="IH">Ibnu Hibban (IH)</option>
                            <option value="IM">Ibnu Majah (IM)</option>
                            <option value="IA">Ibnu Abbas (IA)</option>
                            <option value="IJ">Ibnu Jarir (IJ)</option>
                            <option value="ANN">An Nasai' (ANN)</option>
                        </select>
                    </div><br>
                    
                    <label for="lokasiAras">Aras:</label>
                    <div class="custom-select">
                        <select id="lokasiAras" name="lokasiAras" required>
                            <option value="">Pilih Aras</option>
                            <option value="Aras 1">Aras 1</option>
                            <option value="Aras 2">Aras 2</option>
                            <option value="Aras 3">Aras 3</option>
                            <option value="Aras 4">Aras 4</option>
                        </select>
                    </div><br>
                    
                    <label for="lokasiBilik">No. Bilik:</label>
                    <div class="custom-select">
                        <select id="lokasiBilik" name="lokasiBilik" required>
                            <option value="">Pilih No. Bilik</option>
                            <option value="ATB-301">ATB-301</option>
                            <option value="ATT-302">ATT-302</option>
                            <option value="IS-303">IS-303</option>
                            <option value="IH-304">IH-304</option>
                            <option value="IM-305">IM-305</option>
                            <option value="IA-306">IA-306</option>
                            <option value="IJ-307">IJ-307</option>
                            <option value="ANN-308">ANN-308</option>
                        </select>
                    </div><br>
                    
                    <label for="lokasiLain">Lokasi Lain-lain:</label>
                    <input type="text" id="lokasiLain" name="lokasiLain">
                    
                    <label for="jenisAduan">Jenis Kerosakan/Aduan:</label>
                    <div class="custom-select">
                        <select id="jenisAduan" name="jenisAduan" required>
                            <option value="">Pilih Jenis Aduan</option>
                            <option value="kerosakanAwam">Kerosakan Awam</option>
                            <option value="kerosakanElektrikal">Kerosakan Elektrikal</option>
                            <option value="kerosakanPerabot">Kerosakan Perabot</option>
                            <option value="lain-lain">Lain-lain (Aduan Umum)</option>
                        </select>
                    </div><br>
                    
                    <label for="detailAduan">Detail Kerosakan/Aduan:</label>
                    <textarea id="detailAduan" name="detailAduan" required></textarea>
                    
                    <label for="keteranganAduan">Keterangan Kerosakan/Aduan:</label>
                    <textarea id="keteranganAduan" name="keteranganAduan" required></textarea>
                    
                    <button type="submit">Seterusnya</button><br>
                    <button type="reset">Batal</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
