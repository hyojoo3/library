<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 게시판 목록 시작 -->
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>대출 목록</h2>
	
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>사진</th>
			<th>도서명</th>
			<th>반납</th>
		</tr>
		<c:forEach var="book" items="${list}">
		<tr>
			<td class="align-center">
			<img src="${pageContext.request.contextPath}/book/photoView.do?book_num=${book.book_num}" width="50" height="50"></td>
			<td class="align-center">${book.book_name}</td>
			<td class="align-center">
				<c:if test="${book.borrow_state==1}">
					<button onclick="location.href='${pageContext.request.contextPath}/book/returnBook.do?book_num=${book.book_num}&borrow_num=${book.borrow_num}'">반납하기</button>
				</c:if>
				<c:if test="${book.borrow_state==0}">
					반납완료
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 게시판 목록 끝 -->