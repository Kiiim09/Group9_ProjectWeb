<%-- 
    Document   : login
    Created on : 26 Jun 2024, 2:57:00 am
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Aduan Kolej Kediaman</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(238,174,202);
            background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(155,148,233,1) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #FFFFFF;
            padding: 25px 35px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            color: #8A2BE2;
        }

        h2 {
            margin-bottom: 20px;
            color: #8A2BE2;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #FAF3DD;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #87CEEB;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #4682B4;
        }

        .role-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .role-container label {
            display: flex;
            align-items: center;
            color: #555;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
    <script>
        function handleLoginFormSubmit(event) {
            event.preventDefault(); // Prevent the form from submitting normally
            
            // Get the selected role
            var role = document.querySelector('input[name="role"]:checked');
            if (!role) {
                alert("Please select a role.");
                return;
            }
            
            // Get username and password
            var username = document.getElementById('username').value.trim();
            var password = document.getElementById('password').value.trim();
            
            // Validate username and password
            if (username === "" || password === "") {
                alert("Please enter both username and password.");
                return;
            }
            
            // Submit the form
            document.getElementById('loginForm').submit();
        }
    </script>
</head>
<body>
    <div class="container">
        <a align="center"><img id="logo" style="width: 100px;" src="images/logo.png" alt="logo"/></a>
        <h1>Aduan Kolej Kediaman</h1>
        <h2>Login</h2>
        
        <%-- Display error message if login fails --%>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>
        
        <form id="loginForm" action="login" method="post" onsubmit="handleLoginFormSubmit(event)">
            <div class="role-container">
                <label>
                    <input type="radio" id="admin" name="role" value="Admin" required> Admin
                </label>
                <label>
                    <input type="radio" id="student" name="role" value="Pelajar" required> Pelajar
                </label>
                <label>
                    <input type="radio" id="pic" name="role" value="Pic" required> Pic
                </label>
            </div>

            <label for="username">ID:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        
        <p>Belum mempunyai akaun? <a href="register.jsp">Daftar di sini</a>.</p>
    </div>
</body>
</html>

