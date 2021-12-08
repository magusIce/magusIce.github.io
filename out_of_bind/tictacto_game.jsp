<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@page import="java.util.Random"%>
<jsp:include page="main_up.jsp" ></jsp:include>
<style>
	.sort
	{
		width : 100%;
		margin:0 auto;
		text-align: center;
	}
</style>
<div class="sort">
<%
	Object obj = null;
	obj = session.getAttribute("player");
	int player = (int)obj;
	
	obj = session.getAttribute("board");
	char[][] board = (char[][])obj;
	
	obj = session.getAttribute("game");
	int game = (int)obj;
	
	if(game==0)
	{%>
	<h1><%=player %>번 플레이어 승리</h1>
	<%}
	else
	{
		switch(player)
		{
			case 3 :
			case 2 : player = 1; break;
			case 1 : player = 2; break;
		}
		session.setAttribute("player", player);
	%>
	<h1><%=player %>번 플레이어 차례</h1>
	<%}	
%>

<%
//<%-- 플레이 공간 만들기. 3x3 버튼 제작 --


	for(int i=0;i<board.length;i++)
	{
		for(int j=0;j<board.length;j++)
		{
			if(board[i][j]!=' ')
			{%><button style="width : 55pt; height : 55pt; 
					background-color:white" disabled="disabled" onclick="window.location.href='tictacto_gamePro.jsp?a=<%=i%>&b=<%=j%>'"><%=board[i][j]%></button>
		  <%}
			else if(game==0)
			{%>
				<button style="width : 55pt; height : 55pt; 
						background-color:white" disabled="disabled" onclick="window.location.href='tictacto_gamePro.jsp?a=<%=i%>&b=<%=j%>'"><%=board[i][j]%></button>
			<%}
			else
			{%>
			<button style="width : 55pt; height : 55pt; 
					background-color:white" onclick="window.location.href='tictacto_gamePro.jsp?a=<%=i%>&b=<%=j%>'"><%=board[i][j]%></button>
		<%}
		}
		%><br><%
	}
	if(game==0)
	{
	%>
		<button onclick="window.location.href='tictacto_index.jsp'">처음으로 돌아가기</button>
	<%}
	%>
	<br>
</div>