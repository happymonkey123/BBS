<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%
  String admin=(String)session.getAttribute("admin");

  if(admin==null||!admin.equals("true")){
  out.println("别想删我帖子");
  return ;
  }
  %>





<%!
private void delete(Connection conn,int id){
   Statement stmt=null;
   ResultSet rs=null;
   try{   
   stmt=conn.createStatement();
   String sql="select * from article where pid="+id;
   rs=stmt.executeQuery(sql);
   while(rs.next()){
       delete(conn,rs.getInt(id));
      }
      stmt.executeUpdate("delete from article where id="+id);
    
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
request.setCharacterEncoding("utf8");

int id=Integer.parseInt(request.getParameter("id"));
int pid=Integer.parseInt(request.getParameter("pid"));

   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/BBS?characterEncoding=utf8";
   String username="root";
   String password="a123456";
   Connection conn= DriverManager.getConnection(url,username,password);
   
   conn.setAutoCommit(false);
   
   delete(conn,id);
   Statement stmt= conn.createStatement();
   ResultSet rs=stmt.executeQuery("select count(*) from article where pid="+pid);
   rs.next();
   int count=rs.getInt(1);
   rs.close();
   stmt.close();
   
   if(count<=0){
      Statement stmtUpdate= conn.createStatement();
      stmtUpdate.executeUpdate("update article set isleaf = 0 where id="+pid);
      stmtUpdate.close();
   }
 
   
   
   conn.commit();
   conn.setAutoCommit(true);
   
   conn.close();
   
   response.sendRedirect("ShowArticleTree.jsp");
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