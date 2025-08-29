package vn.iotstart;

import vn.iotstart.User;

public interface UserDao {
	// Lấy user theo username
	User get(String username);

	// Thêm user mới
	boolean insert(User user);

	// Kiểm tra username đã tồn tại chưa
	boolean existsByUsername(String username);

	// Kiểm tra email đã tồn tại chưa
	boolean existsByEmail(String email);
}
