<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f0f2f5;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background: #fff;
	padding: 30px 40px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	width: 350px;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #333;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	color: #555;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

.alert {
	color: red;
	text-align: center;
	margin-bottom: 15px;
}

.register-link {
	text-align: center;
	margin-top: 15px;
}

.register-link a {
	text-decoration: none;
	color: #4CAF50;
}

.register-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Đăng nhập hệ thống</h2>

		<c:if test="${alert != null}">
			<p class="alert">${alert}</p>
		</c:if>

		<form action="${pageContext.request.contextPath}/login" method="post">
			<label>Tài khoản:</label> <input type="text" name="username" required />

			<label>Mật khẩu:</label> <input type="password" name="password"
				required />

			<button type="submit">Đăng nhập</button>
		</form>

		<div class="register-link">
			<p>
				Chưa có tài khoản? <a
					href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
			</p>
		</div>
	</div>
</body>
</html>
