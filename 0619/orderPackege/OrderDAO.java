package orderPackege;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {
	Connection con = null;
	
	public Connection getConnection() throws SQLException, NamingException {
		Context initctx = new InitialContext();
		Context ctx = (Context)initctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/ditweb03");
		con = ds.getConnection();
		
		return con;
	}
	
	public void BuyOne(String memberId, int productId, int quantity) throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into orderlist values(?, ?, ?, sysdate)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, productId);
		pstmt.setInt(3, quantity);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<OrderListDTO> getOrder(String id) throws SQLException, NamingException {
		ArrayList <OrderListDTO> dtos = new ArrayList <OrderListDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select o.regtime, p.thumbnailLink, p.name, p.price, o.quantity from productInfo p join orderlist o on p.productid = o.productid where o.memberid = ? order by o.regtime desc";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderListDTO dto = new OrderListDTO(
					rs.getString("regtime"), rs.getString("thumbnailLink")
					, rs.getString("name"), rs.getInt("price")
					, rs.getInt("quantity")
					);
			
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		
		return dtos;
	}
	
	public void deleteBasket(String memberId) throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from basket where memberId=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
