--회원테이블
CREATE TABLE member(
	mem_num number,
	mem_id varchar2(12) unique not null,
	mem_name varchar2(30) not null,
	mem_auth number(1) default 2 not null,
	constraint member_pk primary key(mem_num)
);
CREATE SEQUENCE member_seq;

CREATE TABLE member_detail(
	mem_num number,
	mem_pw varchar2(20) not null,
	mem_email varchar2(50) not null,
	mem_phone varchar2(14) not null,
	constraint member_detail_pk primary key (mem_num),
	constraint member_detail_fk1 foreign key (mem_num) references member (mem_num)
);

--도서정보
CREATE TABLE book(
	book_num number,
	book_name varchar2(100) not null,
	book_photo blob not null,
 	book_photoName varchar2(100) not null,
	book_writer varchar2(30) not null,
	book_publisher varchar2(30) not null,
	book_state number(1) default 0 not null,
	constraint book_pk primary key (book_num)
);
CREATE SEQUENCE book_seq;

--대출정보
CREATE TABLE book_borrow(
	borrow_num number,
	book_num number not null,
	mem_num number not null,
	constraint book_borrow_pk primary key (borrow_num),
	constraint book_borrow_fk1 foreign key (book_num) references book (book_num),
	constraint book_borrow_fk2 foreign key (mem_num) references member (mem_num)
);
CREATE SEQUENCE borrow_seq;