<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String n = request.getParameter("name");
    String c = request.getParameter("course");
    String f = request.getParameter("fees");
    String e = request.getParameter("email");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

        String sql = "UPDATE students SET name=?, course=?, fees=?, email=? WHERE student_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, n);
        ps.setString(2, c);
        ps.setDouble(3, Double.parseDouble(f));
        ps.setString(4, e);
        ps.setInt(5, Integer.parseInt(id));

        ps.executeUpdate();
        response.sendRedirect("dashboard.jsp");

    } catch(Exception ex) {
        out.println("Error: " + ex);
    }
%>