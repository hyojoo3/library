package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import kr.spring.book.vo.BookVO;

public interface BookService {

	public void insertBook(BookVO book);
	public List<BookVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String,Object> map);
	public BookVO bookSelect(Integer book_num);
	
}
