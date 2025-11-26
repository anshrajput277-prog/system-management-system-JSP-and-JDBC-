<%@ page import="java.sql.*" %>
<%
    String u = request.getParameter("username");
    String e = request.getParameter("email");
    String p = request.getParameter("password");

    try {
    Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

        PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, email, password) VALUES(?,?,?)");
        ps.setString(1, u);
        ps.setString(2, e);
        ps.setString(3, p);
        ps.executeUpdate();
        response.sendRedirect("register.jsp?msg=valid");
    } catch(Exception ex) {
        System.out.println(ex);
        response.sendRedirect("register.jsp?msg=error");
    }
%>
