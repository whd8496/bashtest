package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;

import member.model.vo.Member;

/**
 * @author Minhee
	만든날짜 : 200203
	목적 : DAO
 *
 */
public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties")
										 .getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectOne(Connection conn, String memberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		System.out.println("query="+query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				m = new Member();
				m.setMcode(rset.getInt("member_code"));
				m.setMemberId(rset.getString("member_id"));
				m.setPassword(rset.getString("member_password"));
				m.setPhone(rset.getString("member_phone"));
				m.setEmail(rset.getString("member_email"));
				m.setAddress(rset.getString("member_address"));
				m.setEnrollDate(rset.getDate("member_regdate"));
				m.setMile(rset.getDouble("member_mile"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setMemberName(rset.getString("member_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}

	public int memberInsert(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("memberInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setDate(6, m.getBirthDay());
			pstmt.setString(7, m.getMemberName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	//민희 / 200206 / 회원정보수정 
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember");
		//여기까진 됨
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getAddress());
			pstmt.setDate(3, m.getBirthDay());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getMemberId());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//민희 / 200206 / 회원탈퇴
		public int deleteMember(Connection conn, Member m) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = prop.getProperty("deleteMember");
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, m.getMemberId());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
