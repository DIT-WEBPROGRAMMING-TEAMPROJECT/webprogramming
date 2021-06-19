package productPackege;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import basketPackege.BasketDTO;

public class ProductDAO {
	Connection con = null;
	
	public Connection getConnection() throws SQLException, NamingException {
		Context initctx = new InitialContext();
		Context ctx = (Context)initctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/ditweb03");
		con = ds.getConnection();
		
		return con;
	}
	
	public int getCount() throws SQLException, NamingException {
		con = getConnection();
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select count(productId) from PRODUCTINFO";
		int count = 0;
		
		st = con.createStatement();
		rs = st.executeQuery(sql);
		
		if(rs.next())
			count = rs.getInt("count(productId)");
		
		rs.close();
		st.close();
		con.close();
		
		return count;
	}
	
	public ArrayList<ProductDTO> getListProduct(int page, int numOfRecords, int productCode) throws SQLException, NamingException {
		ArrayList<ProductDTO> dtos = new ArrayList<ProductDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum num, L.* from (select * from productInfo where productCode = ? order by productId desc) L) where num between ? and ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productCode);
		pstmt.setInt(2, page*numOfRecords - 5);	//한페이지에 records 6개 뜨니깐 5개 빼야함
		pstmt.setInt(3, page*numOfRecords);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductDTO dto = new ProductDTO(
					rs.getInt("productId"), rs.getInt("productCode")
					, rs.getString("name"), rs.getString("detailedLink")
					, rs.getString("thumbnailLink"), rs.getInt("price")
					, rs.getInt("stock")
				);
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	
	public ProductDTO productInfo(int productId) throws SQLException, NamingException {
		con = getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO dto = null;
		
		String sql = "select * from productInfo where productId = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, productId);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			dto = new ProductDTO(
					rs.getInt("productId"), rs.getInt("productCode")
					, rs.getString("name"), rs.getString("detailedLink")
					, rs.getString("thumbnailLink"), rs.getInt("price")
					, rs.getInt("stock")
				);
		}

		rs.close();
		pstmt.close();
		
		return dto;
		
	}
	
	public ArrayList<ProductDTO> paymentList(int productId) throws SQLException, NamingException {
		ArrayList<ProductDTO> dtos = new ArrayList<ProductDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from productInfo where productId = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, productId);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductDTO dto = new ProductDTO(
					rs.getInt("productId"), rs.getInt("productCode")
					, rs.getString("name"), rs.getString("detailedLink")
					, rs.getString("thumbnailLink"), rs.getInt("price")
					, rs.getInt("stock")
				);
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	
	public void basketInsert(String memberId, int productId, int quantity) throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into BASKET values(?, ?, sysdate, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, productId);
		pstmt.setInt(3, quantity);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<BasketDTO> basketSetting(String memberId) throws SQLException, NamingException {
		ArrayList<BasketDTO> dtos = new ArrayList<BasketDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//장바구니에서 회원의 id값으로 검색하고 장바구니에 있는거 전부 가져온 뒤
		String sql = "select p.name, p.thumbnailLink, p.price, b.quantity, p.productId from productInfo p join basket b on p.productid = b.productid where b.memberId = ? order by b.regtime desc";		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BasketDTO dto = new BasketDTO(
					rs.getString("name"), rs.getString("thumbnailLink")
					, rs.getInt("price"), rs.getInt("quantity")
					, rs.getInt("productId")
				);
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	
	public ArrayList<ProductDTO> vshoplistSetting(int productCode) throws SQLException, NamingException {
		ArrayList<ProductDTO> dtos = new ArrayList<ProductDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from productInfo where productCode = ? order by productId desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, productCode);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductDTO dto = new ProductDTO(
					rs.getInt("productId"), rs.getInt("productCode")
					, rs.getString("name"), rs.getString("detailedLink")
					, rs.getString("thumbnailLink"), rs.getInt("price")
					, rs.getInt("stock")
				);
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
}
