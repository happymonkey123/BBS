<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
 <%@ page import="java.sql.*" %>   

  <%
  String admin=(String)session.getAttribute("admin");
  boolean login = false;
  if(admin!=null&&admin.equals("true")){
  login=true;
  }
   %>
   
 
   
   <%
  
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/BBS?characterEncoding=utf8";
   String username="root";
   String password="a123456";
   Connection conn= DriverManager.getConnection(url,username,password);
   
   Statement stmt=conn.createStatement();
   ResultSet rs=stmt.executeQuery("select * from article where pid=0");



    %>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<a href="Post.jsp">发表新帖</a>
<table border='1'>

<% 
while(rs.next()){
%>
    <tr>
         <td>
         <%=rs.getInt("id") %>
         </td>
         <td>
             <a href='ShowArticleDetailFlat.jsp?id=<%=rs.getInt("id")%>'><%=rs.getString("title") %> </a>
         </td>
    </tr>

<% 
}
  rs.close();
  stmt.close();
  conn.close();
%>

</table>

</body>
</html>