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
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/books/readView?bno=${update.bno}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
	});
	
	
});

function fn_valiChk(){
	var regForm = $("form[name='updateForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
<body>
	<%@include file="header.jsp"%>
				
	<hr />
	<!-- 본문 -->
	<div id="container">
		<div class="col-lg-12 well center">
			<div class="row">
				<form name="updateForm" role="form" method="post" action="/books/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly />
					<div class="row justify-content-center">
						<div class="card p-3 col-8">
							<div class="row mb-3">
								<div class="col-4">
									<label for="userId" class="form-label bg-warning text-dark bg-opacity-25">작성자</label>
									<input type="text" class="form-control chk" id="userId" name="userId" value = "${update.userId }" readonly/>
								</div>
								<div class="col-8">
									<label for="title" class="form-label bg-warning text-dark bg-opacity-25">제목</label>
									<input type="text" id="title" class="form-control chk" name="title" value ="${update.title}" />
								</div>
							</div>
							<div class="col-12">
								<label for="content" class="form-label bg-warning text-dark bg-opacity-25">내용</label>
								<input type="text" class="form-control chk" id="content" name="content"  style="height: 100px" value="${update.content}">
							</div>
						</div>
					</div>
				</div>
				<!-- 버튼 -->
				<div class="d-grid gap-w d-md-block">
					<button type="submit" class="btn btn-outline-primary update_btn">저장</button>
					<button type="submit" class="btn btn-outline-secondary cancle_btn">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>