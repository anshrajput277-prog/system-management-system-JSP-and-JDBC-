<%@ page import="java.sql.*" %>
<%
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    try {
    Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, u);
        ps.setString(2, p);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            session.setAttribute("username", u);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("index.jsp?msg=invalid");
        }
    } catch(Exception e) {
        System.out.println(e);
        response.sendRedirect("index.jsp?msg=error");
    }
%>