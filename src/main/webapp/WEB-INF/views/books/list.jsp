<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="/member/logout";
	});
	$("#registerBtn").on("click", function(){
		location.href="member/register";
	});
	
	
	$("#memberUpdateBtn").on("click", function(){
		location.href="/member/memberUpdateView";
	});
	
});


</script>

<body>
  	<%@include file="header.jsp"%>


    
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	   <a href="/books/writeView">
	   	  <button class="btn btn-primary me-md-2" type="button">글쓰기</button>
	   </a>
	</div>
	
    <div class="row">
      <div class="col m-3 text-center" >
        <div class="table-responsive-xl">
          <form role="form" method="get">
	          <table class="table table-hover table-striped table-bordered">
	            <thead class="thead-dark">
		            <tr>
		              <th scope="col">번호</th>
		              <th scope="col">글 제목</th>
		              <th scope="col">작성자</th>
		              <th scope="col">시간</th>
		              <th scope="col">추천 수</th>
		            </tr>
		            
		            <c:forEach items="${list}" var="list">
		            	<tr>
			              <th scope="col"><c:out value="${list.bno}" /></th>
			              <th scope="col"><a href="/books/readView?bno=${list.bno}" /><c:out value="${list.title}" /></a></th>
			              <th scope="col"><c:out value="${list.userId}" /></th>
			              <th scope="col"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" /></th>
			              <th scope="col"><c:out value="${list.cnt}" /></th>
			            </tr>
		            </c:forEach>
	            </thead>
	          </table>
          </form>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <c:if test="${pm.prev}">
	            <li class="page-item">
	              <a class="page-link" href="list${pm.makeSearch(pm.startPage - 1)}">이전</a>
	            </li>
            </c:if>
            <c:forEach  begin="${pm.startPage}" end="${pm.endPage}" var="idx">
            	<li class="page-item"><a class="page-link" href="list${pm.makeSearch(idx)}">${idx}</a></li>
            </c:forEach>
            <c:if test="${pm.next && pm.endPage > 0}">
	            <li class="page-item">
					<a class="page-link" href="list${pm.makeSearch(pm.endPage + 1)}">다음</a>
	            </li>
            </c:if>
          </ul>
        </nav>
      </div>
    </div>
</body>
</html>