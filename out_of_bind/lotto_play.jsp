<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Random" %>

<%
	Random rand = new Random();

	Object obj = null;
	
	obj = session.getAttribute("game");
	int game = (int)obj;
	
	obj = session.getAttribute("winning");
	int[] winning = (int[])obj;
	obj = session.getAttribute("calling");
	int[] calling = (int[])obj;
	obj = session.getAttribute("position");
	int[] position = (int[])obj;
	
	String str = request.getParameter("a");
	int a = Integer.parseInt(str);
%>

<%
	switch(a)
	{
		case 0 : 
			game = 0;
			for(int i=0;i<calling.length;i++)
			{
				calling[i] = 0;
			}
			break;
		case 100 : 
			for(int i=0;i<calling.length;i++)
			{
				calling[i] = 0;
			}
			for(int i=0;i<position.length;i++)
			{
				position[i]=i+1;
			}
			for(int i=0;i<calling.length;)
			{
				int cheak = 0;
				calling[i] = rand.nextInt(45) + 1;
				for(int j=0;j<i;j++)
				{
					if(calling[i]==calling[j])cheak++;
				}
				if(cheak<1)i++;
			}
			
			game = 6;
			for(int i=0; i<calling.length;i++)
			{
				position[calling[i]-1] = 0;
			}
			break;
			
		default : 
			for(int i=0;i<calling.length;)
			{
				if(calling[i]==0)
				{
					calling[i]=a+1;
					break;
				}
				else i++;
			}
			game++;
			position[a] = 0;
			break;
	}
	session.setAttribute("calling", calling);
	session.setAttribute("game", game);
	session.setAttribute("position", position);
	
	response.sendRedirect("lotto_main.jsp");
%>
