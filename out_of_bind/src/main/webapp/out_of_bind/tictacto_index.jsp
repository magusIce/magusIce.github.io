<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
 	int player = 3;
	session.setAttribute("player", player);
	int game = 1;
	session.setAttribute("game", game);
	char[][] board = new char[3][3];
	for(int i=0;i<board.length;i++)
	{
		for(int j=0;j<board.length;j++)
		{
			board[i][j] = ' ';
		}
	}
	
	session.setAttribute("board", board);
 %>

<div class="sort">
    <h1>TTT</h1>
    <h2></h2>
    <a href="tictacto_game.jsp">시작</a>
</div>