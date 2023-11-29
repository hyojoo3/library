package kr.spring.book.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BorrowVO {
	private int borrow_num;
	private Date borrow_date;
	private Date return_date;
	private int book_num;
	private int mem_num;
	private int borrow_state;
	
	
	private String book_name;
	private byte[] book_photo;
	private String book_photoName;
	
	private String mem_name;
	
}
