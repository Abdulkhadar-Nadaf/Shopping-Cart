package UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDao {
	
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<Product> getAllProduct(){
		List<Product> lis = new ArrayList<Product>();
		try {
		query = "select * from product";
		ps = this.con.prepareStatement(query);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			Product pr = new Product();
			pr.setId(rs.getInt("id"));
			pr.setName(rs.getString("name"));
			pr.setCategory(rs.getString("category"));
			pr.setPrice(rs.getDouble("Price"));	
			pr.setImage(rs.getBlob("image"));
			
			lis.add(pr);
		}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return lis;
	}
	
	
	
	
}
