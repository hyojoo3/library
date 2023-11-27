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
	<h2>도서 목록</h2>
	<%-- <form action="bookList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>ID+별명</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword"
				       id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" 
				    onclick="location.href='list.do'">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
				<option value="4" <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
			</select>
			<script type="text/javascript">
				$(function(){
					$('#order').change(function(){
						location.href='list.do?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
					});
				});
			</script>
			<c:if test="${!empty user}">
				<input type="button" value="글쓰기" 
			                     onclick="location.href='write.do'">
			</c:if>
		</div>
	</form> --%>
	
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>도서번호</th>
			<th>사진</th>
			<th>도서명</th>
			<th>작가명</th>
			<th>출판사</th>
			<th>대출</th> <!-- 대출가능 여부 버튼 -->
		</tr>
		<c:forEach var="book" items="${list}">
		<tr>
			<td class="align-center">${book.book_num}</td>
			<td class="align-center">
			<img src="${pageContext.request.contextPath}/book/photoView.do?book_num=${book.book_num}" width="50" height="50"></td>
			<td class="align-center">${book.book_name}</td>
			<td class="align-center">${book.book_writer}</td>
			<td class="align-center">${book.book_publisher}</td>
			<td  class="align-center">
				<c:if test="${book.book_state==0}">
					<button onclick="location.href='${pageContext.request.contextPath}/main/main.do'">대출하기</button>
				</c:if>
				<c:if test="${book.book_state==1}">
					<button disabled>대출중</button>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 게시판 목록 끝 -->





