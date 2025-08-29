<%@ page import="vn.iotstart.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("account");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
</head>
<body>
    <h2>Xin chào, <%= user.getFullName() %>!</h2>
    <p>Bạn đã đăng nhập thành công.</p>
</body>
</html>
