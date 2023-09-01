<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<style>
table {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ccc;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    td button {
        border: none;
        color: white;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    td button:hover {
        background-color: #2980b9;
    }
</style>
<body>
	<h1>1:1문의</h1>
	<div class="search">
	
    <select>
        <option value="qtitle" selected>제목</option>
        <option value="memberno">작성자</option>
    </select>
    
    <input type="text" name="sk" value="${resk }" placeholder="검색어를 입력하세요">
    <button type="submit">검색</button>
</div>

<table border="1" width="500" >
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>작성날짜</td>
		<td>상태</td>
		<td>상세보기</td>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.qnano }</td>
			<td>${dto.member.mname }</td>
			<td>${dto.qtitle }</td>
			<td>${dto.qregdate}</td>
			<td>${dto.qstatus }</td>
			<td><button> <a href="qnadetail?qnano=${dto.qnano }">상세보기</a> </button></td>
		</tr>
	</c:forEach>
</table>
<hr/>
<c:if test="${searchVO.page>1 }">
	<a href="list?page=1" style="text-decoration: none;">처음</a>
	<a href="list?page=${searchVO.page-1 }" style="text-decoration: none;">이전</a>
</c:if>
<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
	<c:choose>
		<c:when test="${i eq searchVO.page }">
			<span style="color: red; font-weight: bold;">${i }</span>
		</c:when>
		<c:otherwise>
			<a href="list?page=${i }" style="text-decoration: none;">${i }</a>
		</c:otherwise>
	</c:choose>	
</c:forEach>
<c:if test="${searchVO.page < searchVO.totPage }">
	<a href="list?page=${searchVO.page+1 }" style="text-decoration: none;">다음</a>
	<a href="list?page=${searchVO.totPage }" style="text-decoration: none;">마지막</a>
</c:if> 

<script>
	document.title = "몬스타북스' 관리자"; 
</script>
</body>
</html>