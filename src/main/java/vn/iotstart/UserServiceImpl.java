package vn.iotstart;

public class UserServiceImpl implements UserService {
	private UserDao userDao = new UserDaoImpl();

	@Override
	public User login(String username, String password) {
		User user = userDao.get(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}

	@Override
	public User get(String username) {
		return userDao.get(username);
	}

	@Override
	public String register(User user) {
		if (userDao.existsByUsername(user.getUsername())) {
			return "Username đã tồn tại!";
		}
		if (userDao.existsByEmail(user.getEmail())) {
			return "Email đã được sử dụng!";
		}
		boolean success = userDao.insert(user);
		return success ? "Đăng ký thành công!" : "Đăng ký thất bại!";
	}
}
