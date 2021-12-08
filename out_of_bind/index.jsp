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

<table class="sort">
	<tr>
		<td>
			<%
				
				String key = "검색"; 
				String google = "http://www.google.com/search";
				String autocom = "off";
				String str = request.getParameter("commend");
								
				if(str!=null)autocom = str;
	
			%>
			<form action=<%=google %> target="_blank"> 
				<input type=text name = q  placeholder="내용 입력" autocomplete=<%=autocom %> /> 
				<input type=submit name=button value="Google 검색"  />   
			</form>
			<%
				if(autocom.equals("off"))
				{
					String commend = "on";
				%>
					<button style='background:gray;color:white;' onclick="window.location.href='index.jsp?commend=<%=commend%>'">검색기록 OFF</button>
				<%}
				else if(autocom.equals("on"))
				{
					String commend = "off";
				%>
					<button style='background:lightGray;color:black;' onclick="window.location.href='index.jsp?commend=<%=commend%>'">검색기록 ON</button>
				<%}
			%>
		</td>
	</tr>

</table>
<%--

 --%>
