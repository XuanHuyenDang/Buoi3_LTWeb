package vn.iotstart;

public interface UserService {
	User login(String username, String password);

	User get(String username);

	String register(User user); // trả về String để thông báo lỗi/thành công
}
