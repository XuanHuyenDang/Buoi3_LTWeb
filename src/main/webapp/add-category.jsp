<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Category</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #d4fc79, #96e6a1);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .card {
        background: #fff;
        width: 480px;
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        animation: fadeIn 0.6s ease;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
    }
    h1 {
        text-align: center;
        color: #2f855a;
        margin-bottom: 25px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-weight: 600;
        color: #333;
        margin-bottom: 6px;
    }
    input[type="text"], input[type="file"] {
        width: 100%;
        padding: 12px;
        border: 1px solid #cbd5e0;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s;
    }
    input[type="text"]:focus, input[type="file"]:focus {
        border-color: #2f855a;
        outline: none;
    }
    .btn {
        padding: 12px 25px;
        border: none;
        border-radius: 30px;
        cursor: pointer;
        font-size: 15px;
        font-weight: 600;
        transition: transform 0.2s, background 0.3s;
        text-decoration: none;
    }
    .btn-primary {
        background: #38a169;
        color: white;
    }
    .btn-primary:hover {
        background: #2f855a;
        transform: translateY(-2px);
    }
    .btn-secondary {
        background: #a0aec0;
        color: white;
        margin-left: 10px;
    }
    .btn-secondary:hover {
        background: #718096;
        transform: translateY(-2px);
    }
    .buttons {
        text-align: center;
        margin-top: 25px;
    }
    .message {
        color: #e53e3e;
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
    }
    small {
        display: block;
        margin-top: 5px;
        color: #555;
    }
</style>
</head>
<body>
    <div class="card">
        <h1>➕ Thêm Category</h1>
        
        <c:if test="${message != null}">
            <div class="message">${message}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/add"
              method="post" enctype="multipart/form-data">
            
            <div class="form-group">
                <label for="name">Tên danh mục <span style="color:red">*</span></label>
                <input type="text" id="name" name="name" 
                       placeholder="Nhập tên danh mục..." required>
            </div>
            
            <div class="form-group">
                <label for="icon">Ảnh đại diện</label>
                <input type="file" id="icon" name="icon" accept="image/*">
                <small>Chọn ảnh (jpg, png, gif...)</small>
            </div>
            
            <div class="buttons">
                <button type="submit" class="btn btn-primary">Lưu danh mục</button>
                <a href="${pageContext.request.contextPath}/list" 
                   class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
