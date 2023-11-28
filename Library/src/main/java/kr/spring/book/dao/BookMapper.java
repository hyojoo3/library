package kr.spring.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.book.vo.BookVO;
import kr.spring.book.vo.BorrowVO;

@Mapper
public interface BookMapper {
	
	//create
	public void insertBook(BookVO book);
	
	//read
	public List<BookVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	//글상세
	@Select("SELECT * FROM book WHERE book_num = #{book_num}")
	public BookVO selectBook(Integer book_num);
	
	//update
	public void modifyBook(BookVO book);
	
	//delete
	@Delete("DELETE FROM book WHERE book_num=#{book_num}")
	public void deleteBook(Integer book_num);
	
	
	//도서 대출
	//대출
	@Insert("INSERT INTO book_borrow(borrow_num,book_num,mem_num) VALUES (borrow_seq.nextval,#{book_num},#{mem_num})")
	public void checkIn(BorrowVO borrow);
	@Update("UPDATE book SET book_state=1 WHERE book_num=#{book_num}")
	public void borrow(Integer book_num);
	
	//반납
	@Update("UPDATE book_borrow SET borrow_state=0 WHERE borrow_num=#{borrow_num}")
	public void checkOut(Integer borrow_num);
	@Update("UPDATE book SET book_state=0 WHERE book_num=#{book_num}")
	public void returnBook(Integer book_num);
	
	//나의 도서 대출 목록
	public List<BorrowVO> borrowList(Map<String, Object> map);
	public int borrowRowCount(Map<String,Object> map);
	
	//관리자 도서 대출 목록
	public List<BorrowVO> adminBorrowList(Map<String, Object> map);
	public int adminBorrowRowCount(Map<String,Object> map);
}
