package bank.board.service;

import java.util.List;

import bank.board.dao.BoardDAO;
import bank.board.vo.BoardVO;

public class BoardService {
	
//	boardDao 가 board 값만 가져오지 않음. member에 접근할 수도 있음.
//	그래서 인스턴스 객체를 생성해주고 여러 dao를 이용해서 접근하도록 함.
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}
	
//	전체 게시글 조회
	public List<BoardVO> selectAllBoard(){
		List<BoardVO> boardList = boardDao.selectAll();
//		System.out.println(boardList.size());
		return boardList;
	}
	
//	게시글 등록
	public void addBoard(BoardVO board) throws Exception {
		int no = boardDao.selectBoardNo();
		board.setNo(no);
		boardDao.insertBoard(board);
	}
}
 