<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
int id=Integer.parseInt(request.getParameter("id"));
//int rootid=Integer.parseInt(request.getParameter("rootid"));

   

 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<form action="ReplyOK.jsp" method="post">
    <input type="hidden" name="id" value="<%=id %>" >
   <input type="hidden" name="rootid" value="<%=rootid %>">
    <table border='1'>
         <tr>
             <td>
                 <input type="text" name="title" size="50">
             </td>
         </tr>
         <tr>
             <td>
                  <textarea cols="80" rows="12" name="cont"> </textarea>
             </td>
         </tr>
         <tr>
             <td>
                  <input type="submit" value="提交">
             </td>
         </tr>
    </table>
</form>


</body>
</html>