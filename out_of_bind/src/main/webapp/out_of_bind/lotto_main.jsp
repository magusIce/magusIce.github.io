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
������ �ʿ��ұ�

��ư���� �迭 1��
���빰 �� �迭 1��
��÷��ȣ ���� 1��
	
��ư �������... 777 ���߱�??
��¥ �ζǷ� ����
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
<%--	�� ���������� �ζǹ�ȣ �Է� �ϰ� ���� ���������� ��÷��ȣ �����. �����ؼ� ��� ��ȯ �ϱ� --%>
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
	<h2>���� 6���� ���ų� ���� ���� �ϱ�</h2>
	
	<a>��÷��ȣ ġƮ</a>
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
			background-color:white" onclick="window.location.href='lotto_play.jsp?a=<%=100%>'">���� ����</button>
	<button style="width : 95pt; height : 25pt; 
			background-color:white" onclick="window.location.href='lotto_play.jsp?a=<%=0%>'">�ʱ�ȭ</button>
	<button style="width : 95pt; height : 25pt; 
			background-color:white" onclick="window.location.href='lotto_out.jsp'">Ȯ��</button>
			<%--�� �����Ѱ� �ƴϸ� �ǵ������� --%>
</div>


