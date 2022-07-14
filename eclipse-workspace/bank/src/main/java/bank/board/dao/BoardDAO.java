package bank.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bank.board.vo.BoardVO;
import bank.util.ConnectionFactory;
import bank.util.JDBCClose;

public class BoardDAO {
	
	public BoardVO selectByNo(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("	 , to_char(reg_date,'yyyy-mm-dd') reg_date ");
		sql.append("from t_board where no = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<BoardVO> selectAll() {
		
		List<BoardVO> list = new ArrayList<>();

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date,'yyyy-mm-dd') as reg_date ");
			sql.append("  from t_board ");
			sql.append(" order by no desc ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				list.add(board);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		return list;
	}
	
	public int selectBoardNo() {
		String sql = "select seq_t_board_no.nextval from dual ";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	

	public void insertBoard(BoardVO board) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no, title, writer, content) ");
			sql.append("values(?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			int loc = 1;
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
			pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}	
	
}
	

