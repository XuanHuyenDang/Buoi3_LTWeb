package vn.iotstart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private final String serverName = "DESKTOP-2OIAAJU\\SQLEXPRESS";
	private final String dbName = "SVHCMUTE";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "sa";
	private final String password = "123456";

	public Connection getConnection() throws SQLException, ClassNotFoundException {
		String url;
		if (instance == null || instance.trim().isEmpty()) {
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName
					+ ";encrypt=true;trustServerCertificate=true;";
		} else {
			url = "jdbc:sqlserver://" + serverName + "\\" + instance + ":" + portNumber + ";databaseName=" + dbName;
		}

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
}
