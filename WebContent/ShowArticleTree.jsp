<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
 <%@ page import="java.sql.*" %>   

  <%
  String admin=(String)session.getAttribute("admin");

  if(admin!=null&&admin.equals("true")){
  login=true;
  }
   %>
   
  <%!
   String str="";
   boolean login=false;
   private void tree(Connection conn,int id,int level){
   Statement stmt=null;
   ResultSet rs=null;
   String preStr="";
   for(int i=0;i<level;i++){
   preStr += "----";
   }
   try{   
   stmt=conn.createStatement();
   String sql="select * from article where pid="+id;
   rs=stmt.executeQuery(sql);
   String strLogin="";
  
   while(rs.next()){
    if(login){
    strLogin="<td>"+"<a href='Delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>删除</a>"+"</td>";
   }
   str += "<tr><td>"+rs.getInt("id")+"</td><td>"+preStr+"<a href='ShowArticleDetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("title")+"</a>"+"</td>"+strLogin+"</tr>";
   if(rs.getInt("isleaf")!=0){
   tree(conn,rs.getInt("id"),level+1);
   
      }
    }
   }catch(SQLException e){
   e.printStackTrace();
   }finally{
   try{
   if(rs!=null){
   rs.close();
   rs=null;
   }
   if(stmt!=null){
   stmt.close();
   stmt=null;
   }
   }catch(SQLException e){
   e.printStackTrace();
   }
   }
   
   
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
  //如果str不为空，则置为空
   if(!str.isEmpty()){             
   str="";
   }
   String strLogin="";
   while(rs.next()){
     if(login){
    strLogin="<td>"+"<a href='Delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>删除</a>"+"</td>";
   }
   str+="<tr><td>"+rs.getInt("id")+"</td><td>"+"<a href='ShowArticleDetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("title")+"</a>"+"</td>"+strLogin+"</tr>";
   if(rs.getInt("isleaf")!=0){
   tree(conn,rs.getInt("id"),1);
   }
   }
   rs.close();
   stmt.close();
   conn.close();
   
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

<%=str %>

</table>

</body>
</html>