<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<form action="PostOK.jsp" method="post">
 
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