package board.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import board.model.dao.NoticeDAO;
import board.model.vo.Notice;

public class noticeService {

	public List<Notice> selectNoticeList() {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeList(conn);
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn,n);

		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}


}
