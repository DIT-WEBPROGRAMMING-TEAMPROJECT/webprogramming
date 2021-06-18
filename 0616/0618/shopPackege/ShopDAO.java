package shopPackege;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ShopDAO {
Connection con = null;
	
// 커넥션 
public Connection getConnection() throws SQLException, NamingException {

	Context initctx;
	initctx = new InitialContext();
	Context ctx = (Context)initctx.lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/ditweb03");
	con = ds.getConnection();

	return con;
}	
	//상품 등록
	public int Registration(ShopDTO dto) throws SQLException,NamingException{
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into productinfo values(PRODUCTID_SEQ_AUTO.nextval,PRODUCTCODE_SEQ_AUTO.nextval,?,?,?,?,?,?)";
								
		try {
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getInfo());
			pstmt.setString(3, dto.getDetailed());
			pstmt.setString(4, dto.getThumbnail());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setInt(6, dto.getStock());
			
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
	
	//상품 불러오기
	public ShopDTO Getinformation(String id) throws SQLException,NamingException{
		con=getConnection();
		Statement st=null;
		ResultSet rs=null;
		
		ShopDTO dto=new ShopDTO();
		String sql="select * from PRODUCTINFO where ProductId="+"'"+id+"'";
		
		try {
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
			while(rs.next()) {
				dto.setProductId(rs.getInt("ProductId"));
				dto.setProductCode(rs.getInt("ProductCode"));
				dto.setName(rs.getString("Name"));
				dto.setInfo(rs.getString("Info"));
				dto.setDetailed(rs.getString("Detailed"));
				dto.setThumbnail(rs.getString("Thumbnail"));
				dto.setPrice(rs.getInt("Price"));
				dto.setStock(rs.getInt("Stock"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(st!=null)st.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	//상품 수정
	public int Modification(ShopDTO dto) throws SQLException,NamingException{
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
	
	//상품삭제
	public int DeleteInfo(String id) throws SQLException,NamingException{
		con=getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from PRODUCTINFO where ProductId=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
