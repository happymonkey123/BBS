<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="java.sql.*" %>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   
   <%
   String strid=request.getParameter("id");
   int id=Integer.parseInt(strid);
   
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/BBS?characterEncoding=utf8";
   String username="root";
   String password="a123456";
   Connection conn= DriverManager.getConnection(url,username,password);
   
   Statement stmt=conn.createStatement();
   ResultSet rs=stmt.executeQuery("select * from article where pid="+id);
 
   
    %>
   




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<table border='1'>
<% 
  while(rs.next()){
  
   
%>
  <tr>
     <td>ID</td>
     <td><%=rs.getInt("id") %></td>
  </tr>
  
  <tr>
     <td>Title</td>
     <td><%=rs.getString("title") %></td>
  </tr>
  
  <tr>
     <td>Content</td>
     <td><%=rs.getString("cont") %></td>  
  </tr>
<% 
}
  
%>
</table>

<a href="ReplyFlat.jsp?id=<%=id%>&rootid=<%=id%>">回复 </a>

<%
 rs.close();
 stmt.close();
 conn.close();
 %>

</body>
</html>