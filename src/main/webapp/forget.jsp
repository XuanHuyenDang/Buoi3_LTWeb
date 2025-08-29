<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
<style>
body {
	font-family: Arial;
	background: #e6f0ff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background: #fff;
	padding: 30px 40px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	width: 400px;
}

h2 {
	text-align: center;
	color: #004080;
	margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #b3c6ff;
	border-radius: 5px;
}

button {
	width: 100%;
	padding: 10px;
	background: #004080;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background: #0066cc;
}

.alert {
	text-align: center;
	margin-bottom: 15px;
}

.alert.error {
	color: red;
}

.alert.success {
	color: green;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Đặt lại mật khẩu</h2>
		<c:if test="${not empty message}">
			<p class="alert success">${message}</p>
		</c:if>
		<c:if test="${not empty error}">
			<p class="alert error">${error}</p>
		</c:if>
		<form action="${pageContext.request.contextPath}/forget"
			method="post">
			Email: <input type="text" name="email" required> Username: <input
				type="text" name="username" required> Số điện thoại: <input
				type="text" name="phone" required> Mật khẩu mới: <input
				type="password" name="newPassword" required>
			<button type="submit">Cập nhật mật khẩu</button>
		</form>
		<p style="text-align: center; margin-top: 10px;">
			<a href="${pageContext.request.contextPath}/login.jsp">Quay lại
				đăng nhập</a>
		</p>
	</div>
</body>
</html>
