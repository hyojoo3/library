<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품등록 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Insertphoto.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<div class="page-main">
    <h2>상품등록</h2>
    <form:form modelAttribute="bookVO" action="bookInsert.do" id="bookInsert" method="post" enctype="multipart/form-data">
        <!-- 사진 등록 시작 -->
        <div>
            <ul>
                <li>
                    <!-- 이미지를 나타낼 <img> 요소 -->
                    <img src="${pageContext.request.contextPath}/images/book_add.png" width="200" height="200" class="book-photo">
                    <div class="camera" id="photo_btn">
                        <img src="${pageContext.request.contextPath}/images/camera.png" width="35">
                    </div>
                </li>
                
            </ul>
        </div>
        <!-- 사진 등록 끝 -->
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
            <input type="submit" value="전송" class="default-btn">
            <input type="button" value="홈으로" class="default-btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
        </div>
    </form:form>
</div>
<!-- 상품등록 끝 -->