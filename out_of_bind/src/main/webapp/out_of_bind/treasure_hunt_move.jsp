<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
Object obj = null;

String str = request.getParameter("move");
int move = Integer.parseInt(str);

obj = session.getAttribute("map");
char[][] map = (char[][])obj;
obj = session.getAttribute("player");
int[] player = (int[])obj;
obj = session.getAttribute("goal");
int[] goal = (int[])obj;
obj = session.getAttribute("TEXT");
String TEXT = (String)obj;
obj = session.getAttribute("count");
int count = (int)obj;
obj = session.getAttribute("game");
int game = (int)obj;


switch(move)
{
	case 1 : if(player[1] == 0)//초과일때 위;로 즉 0이여서 보다 작아져버릴때	위
			 {
				TEXT = "지도 밖으로는 나갈수 없어";
				break;
			 }
			 else if(map[player[1]-1][player[0]]=='■')
			 {
				TEXT = "벽을 허물었다.";			// 위  y 감소. 벽에 닿지 말것. 현 플레이어 위치에서 y-1 해보앗을때 '벽'이면 굴착
				map[player[1]-1][player[0]] = '□';
				count++;
			 }
			 else	//그게 아니라 갈 수 있다면
			 {
				map[player[1]][player[0]] = '□'; // 원래 있던곳은 비우고
				player[1] -= 1; //위로 한칸 올려줌.
				map[player[1]][player[0]] = '●'; //수정한 좌표에 다시 플레이어 배치
				TEXT = "앞으로 나아갑니다.";
				count++;
			 }break;	
	case 2 : if(player[0] == 0)//초과일때 왼쪽로.. 즉 배열 가로 길이보다 작아져버릴때
			 {
				TEXT = "지도 밖으로는 나갈수 없어";
				break;
			 }
			 else if(map[player[1]][player[0]-1]=='■')
			 {
				TEXT = "벽을 허물었다.";			// 왼쪽 x감소. 벽에 닿지 말것. 현 플레이어 위치에서 x-1 해보앗을때 '벽'이면 굴착
				map[player[1]][player[0]-1] = '□';
				count++;
			 }
			 else	//그게 아니라 갈 수 있다면
			 {
				map[player[1]][player[0]] = '□'; // 원래 있던곳은 비우고
				player[0] -= 1; //옆으로 한칸 올려줌.
				map[player[1]][player[0]] = '●'; //수정한 좌표에 다시 플레이어 배치
				TEXT = "앞으로 나아갑니다.";
				count++;
			 }break;	//좌
	case 3 : if(player[0] == map.length - 1)//초과일때 오른쪽로.. 즉 배열 가로 길이보다 커질때
			 {
				TEXT = "지도 밖으로는 나갈수 없어";
				break;
			 }
			 else if(map[player[1]][player[0]+1]=='■')
			 {
				TEXT = "벽을 허물었다.";			// 오른쪽 x상승. 벽에 닿지 말것. 현 플레이어 위치에서 x+1 해보앗을때 '벽'이면 굴착
				map[player[1]][player[0]+1] = '□';
				count++;
			 }
			 else	//그게 아니라 갈 수 있다면
			 {
				map[player[1]][player[0]] = '□'; // 원래 있던곳은 비우고
				player[0] += 1; //옆으로 한칸 올려줌.
				map[player[1]][player[0]] = '●'; //수정한 좌표에 다시 플레이어 배치
				TEXT = "앞으로 나아갑니다.";
				count++;
			 }break;	//우
	case 4 : if(player[1] == map.length - 1)//초과일때 아래로.. 즉 배열 세로 길이보다 커질때
			 {
			 	TEXT = "지도 밖으로는 나갈수 없어";
				break;
			 }
			 else if(map[player[1]+1][player[0]]=='■')
			 {
				TEXT = "벽을 허물었다.";			// 위  y 상승. 벽에 닿지 말것. 현 플레이어 위치에서 y+1 해보앗을때 '벽'이면 굴착
				map[player[1]+1][player[0]] = '□';
				count++;
			 }
			 else	//그게 아니라 갈 수 있다면
			 {
				map[player[1]][player[0]] = '□'; // 원래 있던곳은 비우고
				player[1] += 1; //아래로 한칸 내려줌.
				map[player[1]][player[0]] = '●'; //수정한 좌표에 다시 플레이어 배치
				TEXT = "앞으로 나아갑니다.";
				count++;
			 }break;	//하
	case 5 :	//??
}
if(player[0]==goal[0] && player[1]==goal[1])
{
	game=0;
	TEXT = "도착했습니다.";
}

session.setAttribute("map", map);
session.setAttribute("player", player);
session.setAttribute("TEXT", TEXT);
session.setAttribute("count", count);
session.setAttribute("game", game);
response.sendRedirect("treasure_hunt_main.jsp");
%>