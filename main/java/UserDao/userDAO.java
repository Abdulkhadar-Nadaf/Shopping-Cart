package UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.user;

public class userDAO {

	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;

	public userDAO(Connection con) {
		this.con = con;
	}

	public user userlogin(String email, String password) {
		user users = null;

		try {
			query = "select * from user where email=? and password=?";
			ps = this.con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				users = new user();
				users.setId(rs.getInt("id"));
				users.setName(rs.getString("name"));
				users.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return users;
	}

}
