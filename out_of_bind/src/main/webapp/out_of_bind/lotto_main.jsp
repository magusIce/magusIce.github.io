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
	Object obj = null;
	
	obj = session.getAttribute("game");
	int game = (int)obj;
	obj = session.getAttribute("lotto");
	int[] lotto = (int[])obj;
	obj = session.getAttribute("position");
	int[] position = (int[])obj;
	obj = session.getAttribute("winning");
	int[] winning = (int[])obj;
	obj = session.getAttribute("calling");
	int[] calling = (int[])obj;
%>
<%--	이 페이지에서 로또번호 입력 하고 다음 페이지에서 당첨번호 만들기. 조합해서 결과 반환 하기 --%>
<%
	if(game==0)
	{
		for(int i=0;i<lotto.length;i++)
		{
			lotto[i]=i+1;
			position[i] = lotto[i];
		}
	}

	int lineSeeker = 0;
%>
<div class="sort">
	<h2>LOTTO</h2>
	<br>
	<h2>숫자 6개를 고르거나 랜덤 생성 하기</h2>
	
	<a>당첨번호 치트</a>
	<%
		for(int i=0;i<winning.length;i++)
		{%>
			<a style="color : blue"> <%=winning[i] %> </a>
		<%}
	%>
	<br>
	<%
		for(int i=0;i<lotto.length;i++)
		{
			if(game>5)
			{
				if(position[i]!=lotto[i])
				{%>
				<button style="width : 25pt; height : 25pt; 
					background-color:#555555; color : red" disabled='true' onclick="window.location.href='lotto_play.jsp?a=<%=i%>'"><%=lotto[i] %></button>
				<%}
				else 
				{%>
				<button style="width : 25pt; height : 25pt; 
					background-color:#555555; color : white" disabled='true' onclick="window.location.href='lotto_play.jsp?a=<%=i%>'"><%=lotto[i] %></button>
				<%}%>
			<%}
			else if(position[i]==lotto[i])
			{%>
			<button style="width : 25pt; height : 25pt; 
				background-color:white" onclick="window.location.href='lotto_play.jsp?a=<%=i%>'"><%=lotto[i] %></button>
		  <%}
			else
			{%>
			<button style="width : 25pt; height : 25pt; 
				background-color:#555555; color : red" disabled='true' onclick="window.location.href='lotto_play.jsp?a=<%=i%>'"><%=lotto[i] %></button>
		  <%}
			lineSeeker++;
			if(lineSeeker==7)
			{
				lineSeeker=0;
				%><br><%
			}
		}
	%>
	<br>
	<button style="width : 95pt; height : 25pt; 
			background-color:white" onclick="window.location.href='lotto_play.jsp?a=<%=100%>'">랜덤 생성</button>
	<button style="width : 95pt; height : 25pt; 
			background-color:white" onclick="window.location.href='lotto_play.jsp?a=<%=0%>'">초기화</button>
	<button style="width : 95pt; height : 25pt; 
			background-color:white" onclick="window.location.href='lotto_out.jsp'">확인</button>
			<%--다 선택한게 아니면 되돌려야함 --%>
</div>


