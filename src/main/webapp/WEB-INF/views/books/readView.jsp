<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		//수정
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/books/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		//삭제
		$(".delete_btn").on("click", function(){
			formObj.attr("action", "/books/delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		//취소
		$(".list_btn").on("click", function(){
			location.href = "/books/list";
		});
		
	});
	
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				</form>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label>
									<input type="text" id="title" name="title" value="${read.title }" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label>
									<input type="text" id="content" name="content" value="${read.content}" readonly />
								</td>
							</tr>
							<tr>
								<td>
									<label for="userId">작성자</label>
									<input type="text" id="userId" name="userId" value="${read.userId }" readonly/>
								</td>
							</tr>
						</tbody>			
					</table>
			<!-- 버튼 -->
				<div class="d-grid gap-2 d-md-block m-3">
					<button type="submit" class="btn btn-outline-primary update_Btn">수정</button>
					<button type="submit" class="btn btn-outline-secondary delete_btn">삭제</button>
					<button type="submit" class="btn btn-outline-success list_btn">홈으로</button>
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>