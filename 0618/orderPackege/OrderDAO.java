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
	
	public ArrayList<OrderDTO> getOrder(String id) throws SQLException, NamingException {
		ArrayList <OrderDTO> dtos = new ArrayList <OrderDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from orderlist where memberid = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDTO dto = new OrderDTO(
				rs.getInt("orderid"), rs.getString("memberid"), rs.getInt("productid")
				, rs.getString("thumbnaillink"), rs.getInt("quantity"), rs.getDate("regtime") 
				, rs.getInt("price")
			);
			
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		
		return dtos;
		
	}

}
