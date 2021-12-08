<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% 
	String str = request.getParameter("a");
	int a = Integer.parseInt(str);
	str = request.getParameter("b");
	int b = Integer.parseInt(str);
	str = request.getParameter("reset");
	int reset = Integer.parseInt(str);
	
	Object obj = null;
	
	obj = session.getAttribute("count");
	int count = (int)obj;
	obj = session.getAttribute("seat");
	int[][] seat = (int[][])obj;
	
	obj = session.getAttribute("number");
	int number = (int)obj;

%>	

<%
	number = seat[a][b];
	seat[a][b] = 0;
%>

<%
	session.setAttribute("number", number);
	session.setAttribute("seat", seat);
	session.setAttribute("count", ++count);
	
	if(reset==1)
	{
		session.setAttribute("count", 0);
		session.setAttribute("number", 1);
	}
	
	response.sendRedirect("movie_main.jsp");
%>   
