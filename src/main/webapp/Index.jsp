<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>COMP367 Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .container {
            text-align: center;
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            font-size: 2.5em;
            margin: 0;
        }
        .time {
            color: #666;
            font-size: 1.2em;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            LocalTime now = LocalTime.now();
            String greeting;
            String name = "Danny Fu";  
            
            if (now.getHour() < 12) {
                greeting = "Good morning";
            } else {
                greeting = "Good afternoon";
            }
        %>
        <h1><%= greeting %>, <%= name %></h1>
        <h1>Welcome to COMP367</h1>
        <div class="time">Current time: <%= now.getHour() %>:<%= String.format("%02d", now.getMinute()) %></div>
    </div>
</body>
</html>