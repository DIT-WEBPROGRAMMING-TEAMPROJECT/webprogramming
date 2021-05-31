package boardPackege;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;


public class BoardDAO {
	Connection con=null;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	public BoardDAO() {
		String url="jdbc:oracle:thin:@localhost:1521/xepdb1";
		String user="yuseong";
		String passwd="1111";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, user, passwd);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(stmt!=null)rs.close();
		if(pstmt!=null)rs.close();
		if(con!=null)rs.close();
	}
	
	//���� �ۼ�
	public int insert(BoardDTO dto) throws SQLException{
		String writer=dto.getMemberId();
		String title=dto.getTitle();
		String content=dto.getContent();
		
		return this.insert(writer, title, content);
	}

	
	public int insert(String writer, String title, String content) throws SQLException{
		int cnt=0;
		try {
			pstmt=con.prepareStatement("INSERT INTO BOARD"+ "(memberId, title, content) "+ "VALUES"+ "(?, ?, ?)");
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
		}finally {
			close();
		}
		
		return cnt;
	}
	
	//  ResultSet --> DTO �迭�� ��ȯ ����
	/*public BoardDTO[] createArray(ResultSet rs) throws SQLException{
		ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
		
		while (rs.next()) {
			int 
		}
		int size=list.size();
		BoardDTO[] arr=new BoardDTO[size];
		list.toArray(arr);
		return arr;
	}*/
	
	//�� ��� �о����
	
	//�� �����ϱ�
	
	//�� �����ϱ�
}
