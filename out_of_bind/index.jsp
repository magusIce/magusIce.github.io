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

<table class="sort">
	<tr>
		<td>
			<%
				
				String key = "�˻�"; 
				String google = "http://www.google.com/search";
				String autocom = "off";
				String str = request.getParameter("commend");
								
				if(str!=null)autocom = str;
	
			%>
			<form action=<%=google %> target="_blank"> 
				<input type=text name = q  placeholder="���� �Է�" autocomplete=<%=autocom %> /> 
				<input type=submit name=button value="Google �˻�"  />   
			</form>
			<%
				if(autocom.equals("off"))
				{
					String commend = "on";
				%>
					<button style='background:gray;color:white;' onclick="window.location.href='index.jsp?commend=<%=commend%>'">�˻���� OFF</button>
				<%}
				else if(autocom.equals("on"))
				{
					String commend = "off";
				%>
					<button style='background:lightGray;color:black;' onclick="window.location.href='index.jsp?commend=<%=commend%>'">�˻���� ON</button>
				<%}
			%>
		</td>
	</tr>

</table>
<%--

 --%>