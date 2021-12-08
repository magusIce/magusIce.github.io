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
Object obj = null;

obj = session.getAttribute("map");
char[][] map = (char[][])obj;
obj = session.getAttribute("player");
int[] player = (int[])obj;
obj = session.getAttribute("goal");
int[] goal = (int[])obj;
obj = session.getAttribute("TEXT");
String TEXT = (String)obj;
obj = session.getAttribute("game");
int game = (int)obj;

%>
<div class="sort">
<%
for(int i=0;i<map.length;i++)
{
	for(int j=0;j<map[0].length;j++)
	{%>
		<a><%=map[i][j] %></a>
  <%}%>
	<br>
	
<%}
%>
</div>
<div class="sort">
<br>플레이어&emsp;:&emsp;●&emsp;&emsp;&emsp;&emsp;골&emsp;:&emsp;▲</br>
<br><%=TEXT %></br>
<br>
<%
String btcap;
if(game==1)btcap="";
else
{
	btcap="disabled=true";
	%>
		<button style='float:center;' onclick="window.location.href='treasure_hunt_index.jsp'">다시하기</button>
	<%
}
%>
<div >
	<button style='width:30;height:30;
	float:center;'<%=btcap %>
	onclick="window.location.href='treasure_hunt_move.jsp?move=1'">▲</button><br>
	
	<button style='width:30;height:30;
	float:center;margin-left:0;margin-right:-3'<%=btcap %>
	onclick="window.location.href='treasure_hunt_move.jsp?move=2'">◀</button>
	
	<button style='width:30;height:30;
	float:center;margin-left:-3;margin-right:-3'<%=btcap %>
	onclick="window.location.href='treasure_hunt_move.jsp?move=5'">◆</button>
	
	<button style='width:30;height:30;
	float:center;margin-left:-3'<%=btcap %>
	onclick="window.location.href='treasure_hunt_move.jsp?move=3'">▶</button><br>
	
	<button style='width:30;height:30;
	float:center;margin-top:-1'<%=btcap %>
	onclick="window.location.href='treasure_hunt_move.jsp?move=4'">▼</button>
</div>
</div>