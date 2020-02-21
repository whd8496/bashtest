package board.model.dao;
import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import board.model.vo.Notice;

public class NoticeDAO {

	private Properties prop = new Properties();
	
	public NoticeDAO() {
		try {		
			String fileName = NoticeDAO.class.getResource("/sql/board/notice-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<Notice> selectNoticeList(Connection conn) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(query);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				notice.setBoardNo(rset.getInt("board_No"));
				notice.setMcode(rset.getInt("member_code"));
				notice.setBoardCate(rset.getString("board_cate"));
				notice.setBoardTitle(rset.getString("board_title"));
				notice.setBoardContent(rset.getString("board_content"));
				notice.setBoardOrigin(rset.getString("board_origin"));
				notice.setBoardRename(rset.getString("board_renamed"));
				notice.setBoardDate(rset.getDate("board_date"));
				notice.setBoardReadcnt(rset.getInt("board_readcnt"));
				list.add(notice);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getBoardTitle());
			pstmt.setString(2, n.getBoardContent());
			
			result=pstmt.executeUpdate();
			System.out.println("result@dao="+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
