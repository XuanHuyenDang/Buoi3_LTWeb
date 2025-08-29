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
	width: 350px;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #004080;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	color: #555;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #b3c6ff;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #004080;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #0066cc;
}

.alert {
	color: red;
	text-align: center;
	margin-bottom: 15px;
}

.success {
	color: green;
	text-align: center;
	margin-bottom: 15px;
}

.link {
	text-align: center;
	margin-top: 10px;
}

.link a {
	text-decoration: none;
	color: #004080;
}

.link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Đăng nhập hệ thống</h2>

		<c:if test="${alert != null}">
			<p class="alert">${alert}</p>
		</c:if>

		<c:if test="${param.message == 'resetSuccess'}">
			<p class="success">Cập nhật mật khẩu thành công. Hãy đăng nhập
				lại.</p>
		</c:if>

		<form action="${pageContext.request.contextPath}/login" method="post">
			<label>Tài khoản:</label> <input type="text" name="username" required />

			<label>Mật khẩu:</label> <input type="password" name="password"
				required />

			<button type="submit">Đăng nhập</button>
		</form>

		<div class="link">
			<p>
				<a href="${pageContext.request.contextPath}/forget.jsp">Quên mật
					khẩu?</a>
			</p>
			<p>
				Chưa có tài khoản? <a
					href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
			</p>
		</div>
	</div>
</body>
</html>
