package bank.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet{
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propLocation = config.getInitParameter("propLocation");
		System.out.println(propLocation);
		
		// handlermapping : servlet에서 호출됨 == init() 에서 호출시키면 딱 1번만 호출하고 재사용 가능!
		mappings = new HandlerMapping(propLocation);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		
//		/Mission-MVC/board/list.do  -> uri : /Mission-MVC �� �����ϰ� ���� ���ϴ� ���� ��θ� ������
		uri = uri.substring(context.length()); 
		System.out.println("uri : " + uri);
		System.out.println("context : " + context);
		
		
		try {
			
			 Controller control = mappings.getController(uri);
//			 System.out.println(control.toString());
			
			if(control != null) {
				String callPage = control.handleRequest(request, response);
				System.out.println(callPage);
				
				if(callPage.startsWith("redirect:")) {
					callPage = callPage.substring("redirect:".length());
					response.sendRedirect(request.getContextPath() + callPage);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
					dispatcher.forward(request, response);
				}		
			} 
		} catch(Exception e) {
			throw new ServletException(e);
		}
		
	}


}
