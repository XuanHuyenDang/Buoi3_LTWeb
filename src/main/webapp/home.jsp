<%@ page import="vn.iotstart.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<style>
body {
    font-family: Arial, sans-serif;
    background: #e6f0ff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background: #fff;
    padding: 40px 50px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 450px;
}

h2 {
    color: #004080;
    margin-bottom: 20px;
}

p {
    color: #333;
    font-size: 16px;
    margin: 10px 0;
}

a.logout, a.manage-category {
    color: #004080;
    text-decoration: none;
    font-weight: bold;
    border: 1px solid #004080;
    padding: 8px 15px;
    border-radius: 5px;
    transition: 0.3s;
    margin: 5px;
    display: inline-block;
}

a.logout:hover, a.manage-category:hover {
    background-color: #004080;
    color: white;
}

.welcome {
    font-size: 18px;
    margin-bottom: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
    <div class="container">
        <div class="welcome">
            Xin chào, <%=user.getFullName()%>!
        </div>
        <p>Bạn đã đăng nhập thành công vào hệ thống.</p>
        <p>
            <a href="<c:url value='/list'/>" class="manage-category">Quản lý Category</a>
            <a href="<c:url value='/logout'/>" class="logout">Đăng xuất</a>
        </p>
    </div>
</body>
</html>