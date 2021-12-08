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

obj = session.getAttribute("count");
int count = (int)obj;

obj = session.getAttribute("number");
int number = (int)obj;

obj = session.getAttribute("seat");
int[][] seat = (int[][])obj;
 
if(count==0)
{
	for(int i=0;i<seat.length;i++)
	{
		for(int j=0;j<seat[0].length;j++)
		{
			seat[i][j] = number;
			number++;
		}
	}	
}

%>
<br>
<div class="sort">
<%
	for(int i=0;i<seat.length;i++)
	{
		for(int j=0;j<seat[0].length;j++)
		{
			if(seat[i][j]==0)
			{%>
			<button style="width : 25pt; height : 25pt; 
				background-color:white" disabled='true' onclick="window.location.href='movie_pickup.jsp?a=<%=i%>&b=<%=j%>&reset=0'">X</button>
			<%}
			else
			{%>
			<button style="width : 25pt; height : 25pt; 
				background-color:white" onclick="window.location.href='movie_pickup.jsp?a=<%=i%>&b=<%=j%>&reset=0'"><%=seat[i][j]%></button>
			<%
			
			}
		}
		%><br><%
	}
	if(count>0)
	{%>
	<a><%=number%>번 자리를 예매했습니다.</a>
	<%}
	
	%>
	<br><br>
	<button style="width :120pt; height : 25pt; 
			background-color:white" onclick="window.location.href='movie_pickup.jsp?a=1&b=1&reset=1'">초기화</button>
	<button style="width :120pt; height : 25pt; 
			background-color:white" onclick="window.location.href='movie_index.jsp'">처음으로 돌아가기</button>
	<%


%>
</div>

