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
		pstmt.setInt(2, page*numOfRecords - 5);	//�븳�럹�씠吏��뿉 records 6媛� �쑉�땲源� 5媛� 鍮쇱빞�븿
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
	
	public void basketInsert(String memberId, int productId) throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into BASKET values(?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, productId);
		
		pstmt.close();
		con.close();
	}
	
	//상품 등록
		public void Registration(ProductDTO dto) throws SQLException,NamingException{
			con = getConnection();
			PreparedStatement pstmt = null;
			
			//String sql = "insert into productinfo values(?,?,?,?,?,?,?)";
			String sql = "insert into productinfo values(PRODUCTID_SEQ_AUTO.nextval,?,?,?,?,?,?)";						
			
			pstmt = con.prepareStatement(sql);	
			
			pstmt.setInt(1, dto.getProductCode());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getDetailedLink());
			pstmt.setString(4, dto.getThumbnailLink());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setInt(6, dto.getStock());
			pstmt.executeUpdate();		
			
			pstmt.close();		
			con.close();
		}
		
		//상품 수정
		public int Modification(ProductDTO dto) throws SQLException,NamingException{
			con=getConnection();
			PreparedStatement pstmt=null;
			
			String sql ="update PRODUCTINFO set ProductId=?,ProductCode=?,Name=?,DetailedLink=?,ThumbnailLink=?,Price=?,Stock=?";
			
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, dto.getProductId());
				pstmt.setInt(2, dto.getProductCode());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getDetailedLink());
				pstmt.setString(5, dto.getThumbnailLink());
				pstmt.setInt(6, dto.getPrice());
				pstmt.setInt(7, dto.getStock());
				
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return -1;
		}
		
}
