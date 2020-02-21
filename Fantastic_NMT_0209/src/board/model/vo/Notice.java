package board.model.vo;
/* 작성자 : 장여주 
 * 작성일자: 200205
 * 작성목표 : 관리자 공지사항 게시판
 * */

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private int mcode;
	private String boardCate;
	private String boardTitle;
	private String boardContent;
	private String boardOrigin;
	private String boardRename;
	private Date boardDate;
	private int boardReadcnt;
	
	//기본 생성자
	public Notice() {
		super();
	}

	public Notice(int boardNo, int mcode, String boardCate, String boardTitle, String boardContent, String boardOrigin,
			String boardRename, Date boardDate, int boardReadcnt) {
		super();
		this.boardNo = boardNo;
		this.mcode = mcode;
		this.boardCate = boardCate;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardOrigin = boardOrigin;
		this.boardRename = boardRename;
		this.boardDate = boardDate;
		this.boardReadcnt = boardReadcnt;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(String boardCate) {
		this.boardCate = boardCate;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardOrigin() {
		return boardOrigin;
	}

	public void setBoardOrigin(String boardOrigin) {
		this.boardOrigin = boardOrigin;
	}

	public String getBoardRename() {
		return boardRename;
	}

	public void setBoardRename(String boardRename) {
		this.boardRename = boardRename;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadcnt() {
		return boardReadcnt;
	}

	public void setBoardReadcnt(int boardReadcnt) {
		this.boardReadcnt = boardReadcnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [boardNo=" + boardNo + ", mcode=" + mcode + ", boardCate=" + boardCate + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardOrigin=" + boardOrigin + ", boardRename="
				+ boardRename + ", boardDate=" + boardDate + ", boardReadcnt=" + boardReadcnt + "]";
	}

	
}
