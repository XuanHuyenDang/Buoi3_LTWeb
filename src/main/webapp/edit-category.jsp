<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>✏️ Chỉnh sửa Category</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f6d365, #fda085);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 0.6s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            text-align: center;
            color: #e85d04;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        input[type="text"], input[type="file"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-top: 5px;
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-save {
            background: #38b000;
            color: white;
        }
        .btn-save:hover {
            background: #2d6a4f;
        }
        .btn-cancel {
            background: #6c757d;
            color: white;
            margin-left: 10px;
        }
        .btn-cancel:hover {
            background: #495057;
        }
        img.preview {
            max-height: 120px;
            margin-top: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>✏️ Chỉnh sửa Category</h2>

        <form action="${pageContext.request.contextPath}/edit" 
              method="post" enctype="multipart/form-data">
            
            <!-- ID category -->
            <input type="hidden" name="id" value="${category.cateid}">

            <!-- Tên category -->
            <label for="name">Tên Category:</label>
            <input type="text" id="name" name="name" 
                   value="${category.catename}" required>

            <!-- Hình ảnh -->
            <label for="icon">Ảnh Category:</label>
            <input type="file" id="icon" name="icon">
            <c:if test="${not empty category.icon}">
                <div>
                    <p>Ảnh hiện tại:</p>
                    <c:url value="/image?fname=${category.icon}" var="imgUrl"/>
                    <img src="${imgUrl}" alt="Category icon" class="preview">
                </div>
            </c:if>

            <!-- Nút lưu / hủy -->
            <button type="submit" class="btn btn-save">💾 Lưu thay đổi</button>
            <a href="${pageContext.request.contextPath}/list" class="btn btn-cancel">❌ Hủy</a>
        </form>
    </div>
</body>
</html>
