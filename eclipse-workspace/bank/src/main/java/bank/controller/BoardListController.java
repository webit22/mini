package bank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.board.service.BoardService;
import bank.board.vo.BoardVO;


public class BoardListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		/*
		 * List<BoardVO> list = new ArrayList<>(); list.add(new BoardVO("aaa", "bbb"));
		 * list.add(new BoardVO("ccc", "ddd")); list.add(new BoardVO("eee", "fff"));
		 * 
		 * request.setAttribute("list", list);
		 */
		
		BoardService service = new BoardService();
		List<BoardVO> boardList = service.selectAllBoard();
		
		request.setAttribute("list", boardList);
		
		return "/jsp/board/list.jsp";
	}
}

