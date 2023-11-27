package kr.spring.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.book.vo.BookVO;

@Mapper
public interface BookMapper {
	
	//create
	public void insertBook(BookVO book);
	
	//read
	@Select("SELECT * FROM book")
	public List<BookVO> selectList(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM book")
	public int selectRowCount(Map<String,Object> map);
	
	//글상세
	@Select("SELECT * FROM book WHERE book_num = #{book_num}")
	public BookVO selectBook(Integer book_num);
	
	//update
	public void modifyBook(BookVO book);
	
	//delete
	@Delete("DELETE FROM book WHERE book_num=#{book_num}")
	public void deleteBook(Integer book_num);
}
