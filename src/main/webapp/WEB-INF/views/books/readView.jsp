<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/books/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	});
		
	
	$(".delete_btn").on("click", function(){
		
		if(confirm("삭제하시겠습니까?")){
		
			formObj.attr("action", "/books/delete");
			formObj.attr("method", "post");
			formObj.submit();
			
			alert("삭제하셨습니다.");
		}
	
	});
	
	$(".list_btn").on("click", function(){
		
		location.href = "/books/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	});
});


</script>
<body>
  	<%@include file="header.jsp"%>

	<div class="container">
	    <div class="col-lg-12 well">
	        <div class="row">
	         
	         	<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				
	             <form class="row g-3" name="readForm" method="post">
	             	<input type="hidden" id="bno" name="bno" value="${read.bno }" />
	                 <div class="row justify-content-center">
		                 <div class="card p-3 col-8">
		                  	<div class="row mb-3">
		                      <div class="col-4">
		                          <label for="userId" class="form-label" >유저</label>
		                          <input type="text" class="form-control chk" id="userId" name="userId" value="${read.userId}" readonly="readonly">
		                      </div>
		                      <div class="col-md-8">
		                          <label for="title" class="form-label">글 제목</label>
		                          <input type="text" class="form-control" id="title" name="title" value="${read.title}" readonly="readonly">
		                      </div>
		                  	</div>
		
			                <div class="form-floating">
			                      <label for="content"></label>
			                      <input type="text" class="form-control" placeholder="내용" id="content" name="content" readonly="readonly" style="height: 100px" value="${read.content}">
			                </div>
		              	</div>
	              	</div>
	             </form>
	             
				 <div class="d-grid gap-w d-md-block m-3">
					<button type="submit" class="btn btn-outline-primary update_btn">수정</button>
					<button type="submit" class="btn btn-outline-secondary delete_btn">삭제</button>
					<button type="submit" class="btn btn-outline-secondary list_btn">홈으로</button>
				</div>
				
				<!-- comment -->
			    <div id="reply">
				  <ol class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li>
				        <p>
				        작성자 : ${replyList.replyId}<br />
				        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
				        </p>
				
				        <p>${replyList.content}</p>
				      </li>
				    </c:forEach>   
				  </ol>
				</div>
	        </div>
	    </div>
	 </div>
</body>
</html>