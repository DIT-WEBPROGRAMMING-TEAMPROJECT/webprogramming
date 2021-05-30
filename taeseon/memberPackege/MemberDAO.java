package memberPackege;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MemberDAO {
	Connection con = null;
	
	// 커넥션 
	public Connection getConnection() {
		//연결 정보와 SQL
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
		String user = "ditweb03";
		String passwd = "1111";
		
		//1. DB 연동 드라이버 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, passwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//2. 연결 객체 생성
		
		return con;
	}
	
	public int SignUpCheck(String id) {
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from MEMBER where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				return 0;	// 이미 존재하는 회원
			else
				return 1;	// 가입 가능한 회원
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;	// 오류
	}
	
	public int SignUp(MemberDTO dto) {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into MEMBER values(?, ?, ?, ?, ?, ?)";
									//id, pwd, name, email, address, 관리자판별
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setInt(6, 1);	// 수정 - 관리자 판별
			
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
	
	public int Login(String id, String pwd) {
		String checkPwd;
		
		con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select pwd from MEMBER where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checkPwd = rs.getString("pwd");
				if(checkPwd.equals(pwd))
					return 1;
				else
					return 0;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return -1;
	}
	
	public MemberDTO SetEditProfile(String id) {	// EditProfile에 세팅
		con = getConnection();
		Statement st = null;
		ResultSet rs = null;
		
		MemberDTO dto = new MemberDTO();
		String sql = "select * from MEMBER where id="+"'"+id+"'";
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int EditProfile(MemberDTO dto) {	// EditProfile을 토대로 개인정보 수정
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update MEMBER set pwd=?, name=?, email=?, address=? "
				+ "where id=?";	// pwd, name, email, address, id 
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getId());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
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
	
	public int DeleteAccount(String id) {
		con = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from MEMBER where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;	// 오류
	}
}
