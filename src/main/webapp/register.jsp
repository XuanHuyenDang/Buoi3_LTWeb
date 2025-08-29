<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký tài khoản</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #e6f0ff; /* màu nền xanh nhạt */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .register-container {
        background: #fff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 400px;
    }
    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #004080; /* màu xanh dương đậm */
    }
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #004080;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px 12px;
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
    .login-link {
        text-align: center;
        margin-top: 15px;
    }
    .login-link a {
        text-decoration: none;
        color: #004080;
    }
    .login-link a:hover {
        text-decoration: underline;
        color: #0066cc;
    }
</style>
</head>
<body>
    <div class="register-container">
        <h2>Đăng ký</h2>

        <c:if test="${not empty error}">
            <p class="alert">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <label>Email:</label>
            <input type="text" name="email" required>

            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Họ tên:</label>
            <input type="text" name="fullname" required>

            <label>Mật khẩu:</label>
            <input type="password" name="password" required>

            <label>Số điện thoại:</label>
            <input type="text" name="phone">

            <button type="submit">Đăng ký</button>
        </form>

        <div class="login-link">
            <p>Đã có tài khoản? 
                <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
            </p>
        </div>
    </div>
</body>
</html>
