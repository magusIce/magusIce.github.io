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
<div class="sort"> 
<%

	Object obj = null;
	obj = session.getAttribute("winning");
	int[] winning = (int[])obj;
	obj = session.getAttribute("calling");
	int[] calling = (int[])obj;	

	int cheak = 0;
	
	for(int i=0;i<calling.length;i++)
	{
		for(int j=0;j<winning.length;j++)
		{
			if(calling[i]==winning[j])cheak++;
		}
	}
	
	for(int i=0;i<winning.length;i++)
	{int h = 0;
		for(int j=0;j<calling.length;j++)
		{
			if(winning[i]==calling[j])
			{
				h++;%>
				<a style="color : blue">  <%=winning[i]%>  </a>
			<%}
		}if(h!=0)continue;%>
		<a>  <%=winning[i]%>  </a>
	<%}
	
	%><br><br><%
	
	for(int i=0;i<calling.length;i++)
	{
		int h = 0;
		for(int j=0;j<winning.length;j++)
		{
			if(calling[i]==winning[j])
			{
				h++;%>
				<a style="color : blue">  <%=calling[i]%>  </a>
		  <%}
		}
		if(h!=0)continue;
		%><a>  <%=calling[i]%>  </a>
	<%}
	
	%><br><%
	
	if(cheak>=5)
	{%>
		<a>1µÓ ¥Á√∑</a>
	<%}
	else if(cheak>=4)
	{%>
		<a>2µÓ ¥Á√∑</a>
	<%}
	else if(cheak>=3)
	{%>
		<a>3µÓ ¥Á√∑</a>
	<%}
	else if(cheak>=2)
	{%>
		<a>4µÓ ¥Á√∑</a>
	<%}	
%>
<hr>
<a href="lotto_index.jsp">µπæ∆∞°±‚</a>
</div>