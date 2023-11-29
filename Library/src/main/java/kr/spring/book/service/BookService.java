package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import kr.spring.book.vo.BookVO;
import kr.spring.book.vo.BorrowVO;

public interface BookService {

	public void insertBook(BookVO book);
	public List<BookVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String,Object> map);
	public BookVO selectBook(Integer book_num);
	public void modifyBook(BookVO book);
	public void deleteBook(Integer book_num);
	
	public void checkIn(BorrowVO borrow);
	public void borrow(Integer book_num);
	public int borrowCheck(Integer mem_num);
	public void returnBook(Integer book_num);
	public void checkOut(Integer borrow_num);
	
	public List<BorrowVO> borrowList(Map<String, Object> map);
	public int borrowRowCount(Map<String,Object> map);
	
	public List<BorrowVO> adminBorrowList(Map<String, Object> map);
	public int adminBorrowRowCount(Map<String,Object> map);
	
}
