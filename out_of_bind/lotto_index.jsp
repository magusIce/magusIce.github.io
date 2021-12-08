<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.util.Random" %>
<%--
	무엇이 필요할까
	
	버튼갯수 배열 1개
	내용물 들어갈 배열 1개
	당첨번호 생성 1개
	
	버튼 누른장소... 777 맞추기??
	진짜 로또로 하자
	1~45 
 --%>
<%
	Random rand = new Random();

 	int[] lotto = new int[45];
	int[] position = new int[45];
	int[] winning = new int[6]; 
	int[] calling = new int[6];
	
	for(int i=0;i<winning.length;)
	{
		int cheak = 0;
		winning[i] = rand.nextInt(45) + 1;
		for(int j=0;j<i;j++)
		{
			if(winning[i]==winning[j])cheak++;
		}
		if(cheak<1)i++;
	}

	session.setAttribute("game", 0);
	session.setAttribute("lotto", lotto);
	session.setAttribute("winning", winning);
	session.setAttribute("position", position);
	session.setAttribute("calling", calling);
	
	response.sendRedirect("lotto_main.jsp");
%>
    
    