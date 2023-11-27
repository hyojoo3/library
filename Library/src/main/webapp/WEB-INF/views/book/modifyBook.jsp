<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 도서수정 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<div class="page-main">
    <h2>도서 수정</h2>
    <form:form modelAttribute="bookVO" action="modifyBook.do" id="update_form" method="post" enctype="multipart/form-data">
    <form:hidden path="book_num"/>
		<ul>
			<li>
				<form:label path="book_name">도서명</form:label>
				<form:input path="book_name" placeholder="도서명을 입력하세요" autocomplete="off"/><br>
				<form:errors path="book_name" cssClass="error-color" id="error"/>
			</li>
			<li>
				<form:label path="book_writer">작가명</form:label>
				<form:input path="book_writer" placeholder="작가명을 입력하세요" autocomplete="off"/><br>
				<form:errors path="book_writer" cssClass="error-color" id="error"/>
			</li>
			<li>
				<form:label path="book_publisher">출판사</form:label>
				<form:input path="book_publisher" placeholder="출판사를 입력하세요" autocomplete="off"/><br>
				<form:errors path="book_publisher" cssClass="error-color" id="error"/>
			</li>
			<li>
                <div id="photo_choice">
                	<!-- 파일 업로드 입력 폼 -->
                    <input type="file" id="upload" name="upload" accept="image/gif,image/png,image/jpeg"><br>
                    <form:errors path="book_photo" cssClass="error-color"/>
                </div>
            </li>
		</ul>
		
        <div class="align-center">
            <input type="submit" value="수정" class="default-btn">
            <input type="button" value="홈으로" class="default-btn" onclick="location.href='${pageContext.request.contextPath}/book/adminBook.do'">
            
        </div>
    </form:form>
</div>
<!-- 상품등록 끝 -->