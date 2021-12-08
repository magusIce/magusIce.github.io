<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	Object obj = null;

	String str = request.getParameter("a");
	int a= Integer.parseInt(str);
	
	str = request.getParameter("b");
    int b = Integer.parseInt(str);
		
	obj = session.getAttribute("player");
	int player = (int)obj;
	
	obj = session.getAttribute("game");
	int game = (int)obj;
	
	obj = session.getAttribute("board");
	char[][] board = (char[][])obj;
%>

<%
	char insert = ' ';
	switch(player)
	{
		case 1 : insert = 'O'; break;
		case 2 : insert = 'X'; break;
	}
	
%>

<%
	if(board[a][b]==' ')board[a][b] = insert;
	else
	{%>
		
  <%}

	for(int i=0;i<board.length;i++)//가로 승리조건
	{
		if(board[i][0]==insert && board[i][1]==insert && board[i][2]==insert)
		{
			session.setAttribute("board", board);
			game = 0;
			session.setAttribute("game", game);
		}
	}
	
	for(int i=0;i<board[0].length;i++) //세로 승리조건
	{
		if(board[0][i]==insert && board[1][i]==insert && board[2][i]==insert)
		{
			session.setAttribute("board", board);
			game = 0;
			session.setAttribute("game", game);
		}
	}
	
	if(board[0][0]==insert && board[1][1]==insert && board[2][2]==insert)
	{
		session.setAttribute("board", board);
		game = 0;
		session.setAttribute("game", game);
		
	}
	else if(board[0][2]==insert && board[1][1]==insert && board[2][0]==insert)
	{
		session.setAttribute("board", board);
		game = 0;
		session.setAttribute("game", game);
	}
	
	session.setAttribute("board", board); 
 
	response.sendRedirect("tictacto_game.jsp");
%>
