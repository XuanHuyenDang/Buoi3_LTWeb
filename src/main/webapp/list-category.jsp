<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Category</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f6d365, #fda085);
        margin: 0;
        padding: 20px;
    }
    .container {
        max-width: 1100px;
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
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }
    .header h1 {
        color: #e85d04;
        margin: 0;
    }
    .btn {
        padding: 10px 20px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s;
    }
    .add-btn {
        background: #ff6b6b;
        color: white;
    }
    .add-btn:hover {
        background: #e63946;
        transform: translateY(-2px);
    }
    .back-link, .prev-link {
        background: #6c757d;
        color: white;
        margin-right: 10px;
    }
    .back-link:hover, .prev-link:hover {
        background: #495057;
        transform: translateY(-2px);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    th, td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }
    th {
        background-color: #f8f9fa;
        font-weight: 600;
    }
    tr:hover {
        background-color: #fdf2e9;
    }
    img {
        max-height: 90px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .action-links a {
        margin: 0 5px;
        padding: 6px 14px;
        border-radius: 20px;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        transition: all 0.3s;
    }
    .edit-link {
        background: #38b000;
        color: white;
    }
    .edit-link:hover {
        background: #2d6a4f;
        transform: translateY(-2px);
    }
    .delete-link {
        background: #d00000;
        color: white;
    }
    .delete-link:hover {
        background: #9d0208;
        transform: translateY(-2px);
    }
    .empty-list {
        text-align: center;
        margin-top: 40px;
        font-size: 18px;
        color: #555;
    }
    .empty-list a {
        color: #e85d04;
        font-weight: bold;
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📂 Quản lý Category</h1>
            <div>
                <!-- Nút quay về trang trước -->
                <a href="javascript:history.back()" class="btn prev-link">← Quay lại</a>
                <!-- Nút quay về trang chủ -->
                <a href="${pageContext.request.contextPath}/login" class="btn back-link">🏠 Trang chủ</a>
                <!-- Nút thêm mới -->
                <a href="${pageContext.request.contextPath}/add" class="btn add-btn">+ Thêm Category</a>
            </div>
        </div>
        
        <c:if test="${not empty cateList}">
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ảnh</th>
                        <th>Tên Category</th>
                        <th>Ngày tạo</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cateList}" var="cate" varStatus="STT">
                        <tr>
                            <td>${STT.index+1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty cate.icon}">
                                        <c:url value="/image?fname=${cate.icon}" var="imgUrl"/>
                                        <img src="${imgUrl}" alt="${cate.catename}">
                                    </c:when>
                                    <c:otherwise>
                                        <span>Không có ảnh</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${cate.catename}</td>
                            <td>${cate.createdDate}</td>
                            <td class="action-links">
                                <a href="<c:url value='/edit?id=${cate.cateid}'/>" class="edit-link">✏️ Sửa</a>
                                <a href="<c:url value='/delete?id=${cate.cateid}'/>" 
                                   class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa category này?')">🗑 Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${empty cateList}">
            <div class="empty-list">
                <h3>🚫 Chưa có category nào. 
                    <a href="${pageContext.request.contextPath}/add">Thêm mới ngay!</a>
                </h3>
            </div>
        </c:if>
    </div>
</body>
</html>
