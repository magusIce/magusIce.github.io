<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="main_up.jsp" ></jsp:include>
<style>
	.sort
	{
		width : 100%;
		margin:0 auto;
		text-align: center;
	}
</style>

<%

int[][] seat = new int[5][10];

session.setAttribute("count", 0);
session.setAttribute("number", 1);
session.setAttribute("seat", seat);


%>
<div class="sort">
	<a href="movie_main.jsp">¿¹¾à</a>
</div>