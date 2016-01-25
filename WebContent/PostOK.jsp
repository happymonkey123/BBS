<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("utf8");

String title=request.getParameter("title");
//String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf8");
String cont=request.getParameter("cont");
//String cont = new String(request.getParameter("cont").getBytes("iso-8859-1"), "utf8");
cont=cont.replaceAll("\n", "<br>");

   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/BBS?characterEncoding=utf8";
   String username="root";
   String password="a123456";
   Connection conn= DriverManager.getConnection(url,username,password);
   
   conn.setAutoCommit(false);
   
   String sql="insert into article values(null,?,?,?,?,now(),0)";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   Statement stmt= conn.createStatement();
   pstmt.setInt(1, 0);
   pstmt.setInt(2, -1);
   pstmt.setString(3, title);
   pstmt.setString(4, cont);
   pstmt.executeUpdate();   

   
   conn.commit();
   conn.setAutoCommit(true);
   

   pstmt.close();
   conn.close();
   
   response.sendRedirect("ShowArticleFlat.jsp");
 %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<font color="red" size="7">
提交成功！
</font>


</body>
</html>