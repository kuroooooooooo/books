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
		
		location.href = "/books/list";
	});
});


</script>
<body>
	<div class="row pt-3">
		<div class="col-mb-3">
			
			<!-- nav바 -->
			<nav class="navbar navbar-expand-lg bg-light">
				<ul class="nav justify-content-center">
					<li class="nav-item card">
						<a class="nav-link active fs-5" href="/books/list">BOOK STORE</a>
					</li>
				</ul>
				<div class="container-fluid">
					<a class="navbar-brand" href="#">N</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item">
								<a class="nav-link active" aria-current="page" href="#">Home</a>
							</li>
							<li class="nav-item">
					        	<a class="nav-link" href="#">Link</a>
					        </li>
					        <li class="nav-item dropdown">
					        	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            Dropdown
						        </a>
						        <ul class="dropdown-menu">
						        	<li><a class="dropdown-item" href="#">Action</a></li>
						        	<li><a class="dropdown-item" href="#">Another action</a></li>
						        	<li><hr class="dropdown-divider"></li>
						        	<li><a class="dropdown-item" href="#">Something else here</a></li>
						        </ul>
					        </li>
					        <li class="nav-item">
					        	<a class="nav-link disabled">Disabled</a>
					        </li>
						</ul>
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        					<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</div>
	</div>
				
	<hr />
	<!-- 본문 -->
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" name="bno" value="${read.bno}" readonly />
		</form>
		<table class="table table-striped">
			<tbody class="card-body pmd-3 text-center">
				<tr class="col-3 card text-bg-info mb-3 mx-auto">
					<td>
						<label for="title">제목</label>
						<input type="text" id="title" name="title" value ="${read.title}" readonly/>
					</td>
				</tr>
				<tr class="col-3 card text-bg-light mb-3 mx-auto">
					<td>
						<label for="content">내용</label>
						<textarea id="content" name="content" readonly><c:out value ="${read.content}"></c:out></textarea>
					</td>
				</tr>
				<tr class="col-3 card text-bg-info mb-3 mx-auto">
					<td>
						<label for="userId">작성자</label>
						<input type="text" id="userId" name="userId" value = "${read.userId }" readonly/>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 버튼 -->
		<div class="d-grid gap-w d-md-block">
			<button type="submit" class="btn btn-outline-primary update_btn">수정</button>
			<button type="submit" class="btn btn-outline-secondary delete_btn">삭제</button>
			<button type="submit" class="btn btn-outline-secondary list_btn">홈으로</button>
		</div>
	</section>
</body>
</html>