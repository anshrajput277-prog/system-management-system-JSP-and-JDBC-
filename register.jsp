<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Student Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Admin Registration</h2>
         <%
            String msg = request.getParameter("msg");
            if("valid".equals(msg)){
        %>
            <p class="success">Registration Successful! Please Login.</p>
        <% } %>

        <form action="process_register.jsp" method="post">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Register</button>
            <br><br>
            <a href="index.jsp">Already have an account? Login</a>
        </form>
    </div>
</body>
</html>
