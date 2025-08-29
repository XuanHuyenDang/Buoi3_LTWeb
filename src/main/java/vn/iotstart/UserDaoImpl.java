package vn.iotstart;

import vn.iotstart.UserDao;
import vn.iotstart.User;
import vn.iotstart.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

	@Override
	public User get(String username) {
		String sql = "SELECT * FROM [User] WHERE username = ?";
		DBConnection db = new DBConnection();

		try (Connection conn = db.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUsername(rs.getString("username"));
				user.setFullName(rs.getString("fullname"));
				user.setPassWord(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRoleid(rs.getInt("roleid"));
				user.setPhone(rs.getString("phone"));
				user.setCreatedDate(rs.getDate("createdDate"));
				return user;
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean insert(User user) {
		String sql = "INSERT INTO [User](email, username, fullname, password, avatar, roleid, phone, createdDate) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
		DBConnection db = new DBConnection();

		try (Connection conn = db.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getPassWord());
			ps.setString(5, user.getAvatar());
			ps.setInt(6, user.getRoleid());
			ps.setString(7, user.getPhone());

			return ps.executeUpdate() > 0;

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean existsByUsername(String username) {
		String sql = "SELECT 1 FROM [User] WHERE username = ?";
		DBConnection db = new DBConnection();

		try (Connection conn = db.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean existsByEmail(String email) {
		String sql = "SELECT 1 FROM [User] WHERE email = ?";
		DBConnection db = new DBConnection();

		try (Connection conn = db.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return false;
	}
}
