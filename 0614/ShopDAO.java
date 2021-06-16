package shopPackege;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ShopDAO {
Connection con = null;
	
	// 커넥션 
public Connection getConnection() throws SQLException, NamingException {

	Context initctx;
	initctx = new InitialContext();
	Context ctx = (Context)initctx.lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/yuseong");
	con = ds.getConnection();

	return con;
}
	
	//상품 등록
	public int Registration(ShopDTO dto)throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into PRODUCTINFO values(?,?,?,?,?,?,?,?)";
								
		try {
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, dto.getProductId());
			pstmt.setInt(2, dto.getProductCode());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getInfo());
			pstmt.setString(5, dto.getDetailed());
			pstmt.setString(6, dto.getThumbnail());
			pstmt.setInt(7, dto.getPrice());
			pstmt.setInt(8, dto.getStock());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;	// 오류
	}
	
	public int Modification(ShopDTO dto)throws SQLException, NamingException {
		con=getConnection();
		PreparedStatement pstmt=null;
		
		String sql ="update PRODUCTINFO set ProductId=?,ProductCode=?,Name=?,Info=?,Detailed=?,Thumbnail=?,Price=?,Stock=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getProductId());
			pstmt.setInt(2, dto.getProductCode());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getInfo());
			pstmt.setString(5, dto.getDetailed());
			pstmt.setString(6, dto.getThumbnail());
			pstmt.setInt(7, dto.getPrice());
			pstmt.setInt(8, dto.getStock());
			
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
