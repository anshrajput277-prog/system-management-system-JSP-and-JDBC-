<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Security Check
    String user = (String) session.getAttribute("username");
    if(user == null){ response.sendRedirect("index.jsp"); return; }

    String id = request.getParameter("id");
    String name="", course="", email="";
    String fees="";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE student_id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("name");
            course = rs.getString("course");
            fees = String.valueOf(rs.getDouble("fees"));
            email = rs.getString("email");
        }
        con.close();
    } catch(Exception e) { out.println(e); }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
    <h3>Update Student Details</h3>
    <a href="dashboard.jsp" class="logout-btn" style="background:#555;">Back to Dashboard</a>
</div>

<div class="container" style="margin-top: 50px;">
    <h3>Edit Student ID: <%= id %></h3>
    <form action="process_update_student.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <label style="text-align:left; display:block; margin-top:10px;">Name</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label style="text-align:left; display:block;">Course</label>
        <input type="text" name="course" value="<%= course %>" required>

        <label style="text-align:left; display:block;">Fees</label>
        <input type="number" name="fees" value="<%= fees %>" required>

        <label style="text-align:left; display:block;">Email</label>
        <input type="email" name="email" value="<%= email %>" required>

        <button type="submit" style="margin-top:20px;">Update Record</button>
    </form>
</div>
</body>
</html>