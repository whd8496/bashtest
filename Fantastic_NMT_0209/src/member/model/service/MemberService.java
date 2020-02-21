package member.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

/**
 * @author Minhee
	만든날짜 : 200203
	목적 : 서비스단
 *
 */
public class MemberService {

	public Member selectOne(String memberId) {
		Connection conn = getConnection();
		Member m = new MemberDAO().selectOne(conn, memberId);
		close(conn);
		return m;
	}

	public int memberInsert(Member m) {
		Connection conn = getConnection();
		int result = new MemberDAO().memberInsert(conn,m);
		close(conn);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int deleteMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteMember(conn, m);
		if(result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	
	
	
	
	
	
	

}
