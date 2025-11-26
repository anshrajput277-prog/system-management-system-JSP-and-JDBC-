<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Security Check
    String user = (String) session.getAttribute("username");
    if(user == null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function confirmDelete(id) {
            if(confirm("Are you sure you want to delete this student?")) {
                window.location.href = "delete_student.jsp?id=" + id;
            }
        }
    </script>
</head>
<body>
<div class="navbar">
    <h3>Student Management System</h3>
    <span>Welcome, <%= user %> | <a href="logout.jsp" class="logout-btn">Logout</a></span>
</div>

<div class="main-content">
    <div class="card" style="flex: 0 0 300px;">
        <h3>Add New Student</h3>
        <form action="process_add_student.jsp" method="post">
            <input type="text" name="name" placeholder="Student Name" required>
            <input type="text" name="course" placeholder="Course" required>
            <input type="number" name="fees" placeholder="Fees" required>
            <input type="email" name="email" placeholder="Email" required>
            <button type="submit">Add Student</button>
        </form>
    </div>

    <div class="card">
        <h3>Student List</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Course</th>
                <th>Fees</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection con = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM students");
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("student_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("course") %></td>
                <td><%= rs.getDouble("fees") %></td>
                <td><%= rs.getString("email") %></td>
                <td>
                    <a href="update_student.jsp?id=<%= rs.getInt("student_id") %>" class="btn-edit">Edit</a>
                    <a href="javascript:confirmDelete(<%= rs.getInt("student_id") %>)" class="btn-delete">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch(Exception e) { out.println(e); }
                finally { if(con!=null) con.close(); }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>