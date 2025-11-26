<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    if(id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "admin");

            PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE student_id=?");
            ps.setString(1, id);
            ps.executeUpdate();

            con.close();
        } catch(Exception ex) {
            out.println("Error: " + ex);
        }
    }
    response.sendRedirect("dashboard.jsp");
%>