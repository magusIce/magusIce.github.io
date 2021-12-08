<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.Random"%>
<%

Random rand = new Random();
char[][] map = {//12x12 
		{'■','■','■','■','■','■','■','■','■','■','■','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},		//사용될 맵의 형태 제작
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','□','□','□','□','□','□','□','□','□','□','■'},
		{'■','■','■','■','■','■','■','■','■','■','■','■'}		//실제 사용되는곳 == 1,1 ~ 10,10.
};
char player = '●';					//플레이어 위치와
char goal = '▲';					//골 위치의 심볼 제작
String text = "목적지를 향해 나아갑시다.";	//이후 사용될 텍스트 문구가 들어간 변수.

//골을 배치하는 문단
//----------------------------------------------------------------------//
int[] goal_position = new int[2];
	
goal_position[0] = rand.nextInt(10) + 1;	//골 의 위치를 지정해주기위한 랜덤 좌표
goal_position[1] = rand.nextInt(10) + 1;	
map[goal_position[1]][goal_position[0]] = goal;
// 골 배치 끝
//----------------------------------------------------------------------//
int[] player_position = new int[2];
		
if(goal_position[0]>(map.length/2)-1) player_position[0] = rand.nextInt(5) + 1; //골의 x좌표가 반 이상이면 거리를 둔다.
else player_position[0] = rand.nextInt(5) + 6;  //골이 1~5일경우 x를 +6 함으로써 6~10으로 지정
		
if(goal_position[1]>(map.length/2)-1) player_position[1] = rand.nextInt(5) + 1;//동일과정으로 y값도 멀리 떨어뜨려줌
else player_position[1] = rand.nextInt(5) + 6;
		
//상기 과정으로 골과 플레이어는 사각형 4분면 대각선 반대편에 생성되게 됨. 겹치는 일은 없음
		
map[player_position[1]][player_position[0]] = player; //실제로 배치
//----------------------------------------------------------------------//
int[] pin_point = new int[2];
		
	for(int wall=0;wall<map.length;wall++) //벽을 몇번 생성하는가
	{
		for(int i=0;i<pin_point.length;i++)
		{
			pin_point[i] = rand.nextInt(10) + 1;	// 랜덤 좌표를 찍어 저장 
		}
		if(map[pin_point[1]][pin_point[0]] == '□')	// 좌표가 벽, 플레이어, 골이 아닌지 확인
		{
			map[pin_point[1]][pin_point[0]] = '■';	//지정 좌표에 벽 생성
			//벽을 기준으로 더 생성할지 말지 정하는 파트
			for(int wall_point = rand.nextInt(3);wall_point>=0;wall_point--)//3번 반복해서 가로 세로 대각이 모두 나올 수도 있음 겹칠수도 있고,
			{
				int position = rand.nextInt(3); //가로 세로 대각선
				int pick_position = rand.nextInt(3); //좌(상), 우(하), 양쪽 모두
					
				switch(position)
				{
					case 0 :	//가로
						switch(pick_position)
						{
							case 0 :	//좌(상)
								if(map[pin_point[1]][pin_point[0]-1] == '□')map[pin_point[1]][pin_point[0]-1] = '■'; 
								break;
							case 1 :	//우(하)
								if(map[pin_point[1]][pin_point[0]+1] == '□')map[pin_point[1]][pin_point[0]+1] = '■';
								break;
							case 2 :	//양쪽 모두
								if(map[pin_point[1]][pin_point[0]-1] == '□' && map[pin_point[1]][pin_point[0]+1] == '□')
								{
									map[pin_point[1]][pin_point[0]-1] = '■';
									map[pin_point[1]][pin_point[0]+1] = '■';
								}
								break;
						}break;
					case 1 :	//세로
						switch(pick_position)
						{
							case 0 :	//좌(상)
								if(map[pin_point[1]-1][pin_point[0]] == '□')map[pin_point[1]-1][pin_point[0]] = '■'; 
								break;
							case 1 :	//우(하)
								if(map[pin_point[1]+1][pin_point[0]] == '□')map[pin_point[1]+1][pin_point[0]] = '■';
								break;
							case 2 :	//양쪽 모두
								if(map[pin_point[1]-1][pin_point[0]] == '□' && map[pin_point[1]+1][pin_point[0]] == '□')
								{
									map[pin_point[1]-1][pin_point[0]] = '■';
									map[pin_point[1]+1][pin_point[0]] = '■';
								}
								break;
						}break;
					case 2 :	//대각선
						switch(pick_position)
						{
							case 0 :	//좌(상)
								if(map[pin_point[1]-1][pin_point[0]-1] == '□')map[pin_point[1]-1][pin_point[0]-1] = '■';
								if(map[pin_point[1]+1][pin_point[0]+1] == '□')map[pin_point[1]-1][pin_point[0]-1] = '■';
								break;
							case 1 :	//우(하)
								if(map[pin_point[1]-1][pin_point[0]+1] == '□')map[pin_point[1]+1][pin_point[0]+1] = '■';
								if(map[pin_point[1]+1][pin_point[0]-1] == '□')map[pin_point[1]+1][pin_point[0]+1] = '■';
								break;
							case 2 :	//양쪽 모두
								if(map[pin_point[1]-1][pin_point[0]-1] == '□' && map[pin_point[1]+1][pin_point[0]+1] == '□')
								{
									if(map[pin_point[1]-1][pin_point[0]-1] == '□')map[pin_point[1]-1][pin_point[0]-1] = '■';
									if(map[pin_point[1]+1][pin_point[0]+1] == '□')map[pin_point[1]-1][pin_point[0]-1] = '■';
									if(map[pin_point[1]-1][pin_point[0]+1] == '□')map[pin_point[1]+1][pin_point[0]+1] = '■';
									if(map[pin_point[1]+1][pin_point[0]-1] == '□')map[pin_point[1]+1][pin_point[0]+1] = '■';
								}
								break;
						}break;
					}
				}
			}
		}		
//----------------------------------------------------------------------//

session.setAttribute("game", 1);
session.setAttribute("map", map);
session.setAttribute("player", player_position);
session.setAttribute("goal", goal_position);
session.setAttribute("TEXT", text);
session.setAttribute("count",0);

response.sendRedirect("treasure_hunt_main.jsp");
%>
