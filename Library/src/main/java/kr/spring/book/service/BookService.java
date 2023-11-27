package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import kr.spring.book.vo.BookVO;

public interface BookService {

	public void insertBook(BookVO book);
	public List<BookVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String,Object> map);
	public BookVO selectBook(Integer book_num);
	public void modifyBook(BookVO book);
	public void deleteBook(Integer book_num);
	
}
