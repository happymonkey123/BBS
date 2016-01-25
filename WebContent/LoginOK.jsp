<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("utf8");

String username=request.getParameter("user");

String password=request.getParameter("password");

if(username==null ||password==null || !username.equals("admin")||!password.equals("admin")){
out.println("用户名或密码错误，请重新登录");
}
else{
session.setAttribute("admin", "true");
response.sendRedirect("ShowArticleTree.jsp");
}


 %>





<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>