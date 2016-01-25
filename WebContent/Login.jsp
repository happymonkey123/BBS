<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

<form action="LoginOK.jsp" method="post">

    <table border='1'>
         <tr>
             <td>
             <%="user" %>
             </td>
             <td>
                 <input type="text" name="user" size="50">
             </td>
         </tr>
         <tr>
             <td>
             <%="password" %>
             </td>
             <td>
                  <input type="text" name="password" size="50"> 
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