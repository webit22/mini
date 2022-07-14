package bank.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	
	private Map<String, Controller> mappings = new HashMap<>();
	public HandlerMapping(String propLocation) {
		
		Properties prop = new Properties(); // 얘가 bean.properties 내용을 읽어옴
		
		try {
//			InputStream is = new FileInputStream("D:\\workspace\\bank\\bean.properties");
			InputStream is = new FileInputStream(propLocation);
			prop.load(is);
			
			// bean 파일에서 "/board/list.do"같은 키에 대한 값을 가져옴
			Set<Object> keys = prop.keySet();
			for(Object key : keys) {
				System.out.println(key);
				String className = prop.getProperty(key.toString()); 

				
				Class<?> clz = Class.forName(className);
				Constructor<?> constructor = clz.getConstructor();
				mappings.put(key.toString(), (Controller)constructor.newInstance());
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		/*
		mappings.put("/board/list.do", new BoardListController());
		mappings.put("/board/writeForm.do", new BoardWriteFormController());
		mappings.put("/board/write.do", new BoardWriteController());
		*/
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
	
	
	
	
	
//	public static void main(String[] args) throws Exception{
//		// 객체 생성 방법 3
//		Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController"); // 클래스명 써주면
//		BoardListController obj = (BoardListController) clz.newInstance(); // 동적인 객체 생성 가능!
//		System.out.println(obj.handleRequest(null, null));
//		
//		
//		/* 객체 생성 방법 2
//		Class<?> clz = Class.forName("java.util.Random"); // java.util.Random 에 대한걸 clz가 알고있음
//		java.util.Random r = (java.util.Random) clz.newInstance();
//		int random = r.nextInt(10) + 1;
//		System.out.println(random);
//		*/
//		
//		/* 객체 생성 방법 1
//		java.util.Random r = new java.util.Random();
//		int random = r.nextInt(10) + 1;
//		System.out.println(random);
//		*/
//	}

}
