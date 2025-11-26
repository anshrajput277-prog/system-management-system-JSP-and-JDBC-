<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Student Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <%
            String msg = request.getParameter("msg");
            if("invalid".equals(msg)){
        %>
            <p class="error">Invalid Username or Password!</p>
        <% } %>

        <form action="process_login.jsp" method="post">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
            <br><br>
            <a href="register.jsp">New Admin? Register Here</a>
        </form>
    </div>
</body>
</html>