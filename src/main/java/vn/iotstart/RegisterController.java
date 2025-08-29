package vn.iotstart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

// Lưu ý: Tên class phải trùng với tên file RegisterController.java
@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserServiceImpl userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setFullName(fullname);
        user.setPassWord(password);
        user.setAvatar("default.png");
        user.setRoleid(2); // 2 = user thường
        user.setPhone(phone);

        String result = userService.register(user);
        req.setAttribute("message", result);

        RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }
}
