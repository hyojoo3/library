package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.book.dao.BookMapper;
import kr.spring.book.vo.BookVO;
import kr.spring.book.vo.BorrowVO;

@Service
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public void insertBook(BookVO book) {
		bookMapper.insertBook(book);
	}

	@Override
	public List<BookVO> selectList(Map<String, Object> map) {
		return bookMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return bookMapper.selectRowCount(map);
	}

	@Override
	public BookVO selectBook(Integer book_num) {
		return bookMapper.selectBook(book_num);
	}

	@Override
	public void modifyBook(BookVO book) {
		bookMapper.modifyBook(book);
	}

	@Override
	public void deleteBook(Integer book_num) {
		bookMapper.deleteBook(book_num);
	}

	@Override
	public void checkIn(BorrowVO borrow) {
		bookMapper.checkIn(borrow);
	}

	@Override
	public void borrow(Integer book_num) {
		bookMapper.borrow(book_num);
	}

	@Override
	public void returnBook(Integer book_num) {
		bookMapper.returnBook(book_num);
	}

	@Override
	public void checkOut(Integer borrow_num) {
		bookMapper.checkOut(borrow_num);
	}

	@Override
	public List<BorrowVO> borrowList(Map<String, Object> map) {
		return bookMapper.borrowList(map);
	}

	@Override
    public int borrowRowCount(Map<String, Object> map) {
        return bookMapper.borrowRowCount(map);
    }

	@Override
	public List<BorrowVO> adminBorrowList(Map<String, Object> map) {
		return bookMapper.adminBorrowList(map);
	}

	@Override
	public int adminBorrowRowCount(Map<String, Object> map) {
		return bookMapper.adminBorrowRowCount(map);
	}

}
