package vn.iotstart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forget")
public class ForgetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("newPassword");

        String error = null;

        try (Connection conn = new DBConnection().getConnection()) {
            // Kiểm tra thông tin người dùng
            String sqlCheck = "SELECT * FROM [User] WHERE email=? AND username=? AND phone=?";
            try (PreparedStatement psCheck = conn.prepareStatement(sqlCheck)) {
                psCheck.setString(1, email);
                psCheck.setString(2, username);
                psCheck.setString(3, phone);

                try (ResultSet rs = psCheck.executeQuery()) {
                    if (rs.next()) {
                        // Cập nhật mật khẩu mới
                        String sqlUpdate = "UPDATE [User] SET password=? WHERE email=? AND username=? AND phone=?";
                        try (PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate)) {
                            psUpdate.setString(1, newPassword);
                            psUpdate.setString(2, email);
                            psUpdate.setString(3, username);
                            psUpdate.setString(4, phone);
                            psUpdate.executeUpdate();
                        }

                        // Redirect về login.jsp với thông báo thành công
                        response.sendRedirect(request.getContextPath() + "/login.jsp?message=resetSuccess");
                        return;
                    } else {
                        error = "Thông tin không chính xác!";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            error = "Lỗi hệ thống!";
        }

        // Nếu có lỗi → forward về forget.jsp
        request.setAttribute("error", error);
        request.getRequestDispatcher("/forget.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/forget.jsp").forward(request, response);
    }
}
