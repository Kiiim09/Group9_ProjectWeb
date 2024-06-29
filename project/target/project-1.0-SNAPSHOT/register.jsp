<%-- 
    Document   : register
    Created on : 26 Jun 2024, 3:00:35 am
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(155,148,233,1) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            text-align: center;
            color: #8A2BE2;
            margin-bottom: 20px;
        }
        form {
            display: grid;
            gap: 10px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
            color: #555;
        }
        
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"],
        input[type="radio"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 10px;
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
        input[type="submit"] {
            padding: 12px;
            background-color: #87CEEB;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #4682B4;
        }
    </style>
</head>
<body>
    <div class="container">
        <a align="center"><img id="logo" style="width: 100px;" src="images/logo.png" alt="logo"/></a>
        <h1>User Registration</h1>
        
        <form action="register" method="post">
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
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone">
            
            
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>


