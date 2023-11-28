package kr.spring.book.vo;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	private int book_num;
	private String book_name;
	private byte[] book_photo;
	private String book_photoName;
	private String book_writer;
	private String book_publisher;
	private int book_state;
	
	
	
	public void setUpload(MultipartFile upload)throws IOException{
		//MultipartFile -> byte[]
		setBook_photo(upload.getBytes());
		//파일이름
		setBook_photoName(upload.getOriginalFilename());
	}
}
