<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringBoot Index</title>

</head>
<body>
    <%
    String a = (String) session.getAttribute("mem_id");
    out.println(a);
%>
    <a href="/signup">회원가입</a>
    <a href="/login">로그인</a>
    ${test}
</body>
</html>