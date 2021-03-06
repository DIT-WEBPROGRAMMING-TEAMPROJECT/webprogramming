package boardPackege;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
//import java.util.ArrayList;
import javax.sql.DataSource;


public class BoardDAO {
	Connection con = null;
	
	public Connection getConnection() throws SQLException, NamingException {
		Context initctx = new InitialContext();
		Context ctx = (Context)initctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/ditweb03");
		con = ds.getConnection();
		
		return con;
	}
	
	public int boardInsert(String memberId, int productId, String content) throws SQLException, NamingException {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		// 멤버id, 상품id, 게시판id, sysdate, content
		String sql = "insert into BOARD values(?, ?, board_seq_auto.nextval, sysdate, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, productId);
		pstmt.setString(3, content);
		
		return pstmt.executeUpdate();
	}
		
	public int getCount() throws SQLException, NamingException {
		con = getConnection();
		Statement st = null;
		ResultSet rs = null;
		// 
		String sql = "select count(memberId) from BOARD where productId = 1";
		int count = 0;
		
		st = con.createStatement();
		rs = st.executeQuery(sql);
		
		if(rs.next())
			count = rs.getInt("count(memberId)");
		
		rs.close();
		st.close();
		con.close();
		
		return count;
	}
	
	public ArrayList<BoardListDTO> getListBoardAll(int page, int numOfRecords) throws SQLException, NamingException {
		ArrayList<BoardListDTO> dtos = new ArrayList<BoardListDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from (select rownum num, L.* from (select p.name, p.thumbnaillink, b.memberId, b.regtime, b.content from productInfo p join board b on p.productId = b.productId order by b.regtime desc) L) where num between ? and ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, page*numOfRecords - 9);
		pstmt.setInt(2, page*numOfRecords);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardListDTO dto = new BoardListDTO(
					rs.getString("name"), rs.getString("thumbnailLink")
					, rs.getString("memberId"), rs.getString("regtime"),
					rs.getString("content")
				);
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	
	
	// BoardList ↓↓↓
	public ArrayList<BoardDTO> setItemReview(int productId) throws SQLException, NamingException {
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from Board where productId = ? order by regtime desc";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productId);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO(
					rs.getString("memberId"), rs.getInt("productId")
					, rs.getInt("boardId"), rs.getString("regtime")
					, rs.getString("content"));
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	public ArrayList<BoardDTO> getListBoard(int page, int numOfRecords, int productId) throws SQLException, NamingException {
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// select memberId, productId, boardId, title, to_char(regtime, 'yyyy/mm/dd hh24:mi'), content from board;
		// 06/06 productId 부분에 해당 상품 id값 넣기
		String sql = "select * from (select rownum num, L.* from (select * from Board where productId = ? order by regtime desc) L) where num between ? and ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, productId);
		pstmt.setInt(2, page*numOfRecords - 9);
		pstmt.setInt(3, page*numOfRecords);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO(
					rs.getString("memberId"), rs.getInt("productId")
					, rs.getInt("boardId"), rs.getString("regtime")
					, rs.getString("content"));
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
	// DetailReviewList ↓↓↓
	public ArrayList<DetailBoardDTO> getDetailListBoard(int page, int numOfRecords) throws SQLException, NamingException {
		ArrayList<DetailBoardDTO> dtos = new ArrayList<DetailBoardDTO>();
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// select memberId, productId, boardId, title, to_char(regtime, 'yyyy/mm/dd hh24:mi'), content from board;
		String sql = "select * from (select rownum num, L.* from "
				+ "(select B.memberId, B.regtime, B.content, P.name, P.thumbnaillink "
				+ "from board B join productinfo P on B.productId = P.productId order by regtime desc) L) "
				+ "where num between ? and ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, page*numOfRecords - 9);
		pstmt.setInt(2, page*numOfRecords);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			DetailBoardDTO dto = new DetailBoardDTO(
					rs.getString("memberId"), rs.getString("regtime")
					, rs.getString("content"), rs.getString("name")
					, rs.getString("thumbnaillink"));
			dtos.add(dto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return dtos;
	}
}