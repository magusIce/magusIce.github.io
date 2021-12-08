<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.Random"%>
<%

Random rand = new Random();
char[][] map = {//12x12 
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},		//���� ���� ���� ����
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'},
		{'��','��','��','��','��','��','��','��','��','��','��','��'}		//���� ���Ǵ°� == 1,1 ~ 10,10.
};
char player = '��';					//�÷��̾� ��ġ��
char goal = '��';					//�� ��ġ�� �ɺ� ����
String text = "�������� ���� ���ư��ô�.";	//���� ���� �ؽ�Ʈ ������ �� ����.

//���� ��ġ�ϴ� ����
//----------------------------------------------------------------------//
int[] goal_position = new int[2];
	
goal_position[0] = rand.nextInt(10) + 1;	//�� �� ��ġ�� �������ֱ����� ���� ��ǥ
goal_position[1] = rand.nextInt(10) + 1;	
map[goal_position[1]][goal_position[0]] = goal;
// �� ��ġ ��
//----------------------------------------------------------------------//
int[] player_position = new int[2];
		
if(goal_position[0]>(map.length/2)-1) player_position[0] = rand.nextInt(5) + 1; //���� x��ǥ�� �� �̻��̸� �Ÿ��� �д�.
else player_position[0] = rand.nextInt(5) + 6;  //���� 1~5�ϰ�� x�� +6 �����ν� 6~10���� ����
		
if(goal_position[1]>(map.length/2)-1) player_position[1] = rand.nextInt(5) + 1;//���ϰ������� y���� �ָ� ����߷���
else player_position[1] = rand.nextInt(5) + 6;
		
//��� �������� ��� �÷��̾�� �簢�� 4�и� �밢�� �ݴ��� �����ǰ� ��. ��ġ�� ���� ����
		
map[player_position[1]][player_position[0]] = player; //������ ��ġ
//----------------------------------------------------------------------//
int[] pin_point = new int[2];
		
	for(int wall=0;wall<map.length;wall++) //���� ��� �����ϴ°�
	{
		for(int i=0;i<pin_point.length;i++)
		{
			pin_point[i] = rand.nextInt(10) + 1;	// ���� ��ǥ�� ��� ���� 
		}
		if(map[pin_point[1]][pin_point[0]] == '��')	// ��ǥ�� ��, �÷��̾�, ���� �ƴ��� Ȯ��
		{
			map[pin_point[1]][pin_point[0]] = '��';	//���� ��ǥ�� �� ����
			//���� �������� �� �������� ���� ���ϴ� ��Ʈ
			for(int wall_point = rand.nextInt(3);wall_point>=0;wall_point--)//3�� �ݺ��ؼ� ���� ���� �밢�� ��� ���� ���� ���� ��ĥ���� �ְ�,
			{
				int position = rand.nextInt(3); //���� ���� �밢��
				int pick_position = rand.nextInt(3); //��(��), ��(��), ���� ���
					
				switch(position)
				{
					case 0 :	//����
						switch(pick_position)
						{
							case 0 :	//��(��)
								if(map[pin_point[1]][pin_point[0]-1] == '��')map[pin_point[1]][pin_point[0]-1] = '��'; 
								break;
							case 1 :	//��(��)
								if(map[pin_point[1]][pin_point[0]+1] == '��')map[pin_point[1]][pin_point[0]+1] = '��';
								break;
							case 2 :	//���� ���
								if(map[pin_point[1]][pin_point[0]-1] == '��' && map[pin_point[1]][pin_point[0]+1] == '��')
								{
									map[pin_point[1]][pin_point[0]-1] = '��';
									map[pin_point[1]][pin_point[0]+1] = '��';
								}
								break;
						}break;
					case 1 :	//����
						switch(pick_position)
						{
							case 0 :	//��(��)
								if(map[pin_point[1]-1][pin_point[0]] == '��')map[pin_point[1]-1][pin_point[0]] = '��'; 
								break;
							case 1 :	//��(��)
								if(map[pin_point[1]+1][pin_point[0]] == '��')map[pin_point[1]+1][pin_point[0]] = '��';
								break;
							case 2 :	//���� ���
								if(map[pin_point[1]-1][pin_point[0]] == '��' && map[pin_point[1]+1][pin_point[0]] == '��')
								{
									map[pin_point[1]-1][pin_point[0]] = '��';
									map[pin_point[1]+1][pin_point[0]] = '��';
								}
								break;
						}break;
					case 2 :	//�밢��
						switch(pick_position)
						{
							case 0 :	//��(��)
								if(map[pin_point[1]-1][pin_point[0]-1] == '��')map[pin_point[1]-1][pin_point[0]-1] = '��';
								if(map[pin_point[1]+1][pin_point[0]+1] == '��')map[pin_point[1]-1][pin_point[0]-1] = '��';
								break;
							case 1 :	//��(��)
								if(map[pin_point[1]-1][pin_point[0]+1] == '��')map[pin_point[1]+1][pin_point[0]+1] = '��';
								if(map[pin_point[1]+1][pin_point[0]-1] == '��')map[pin_point[1]+1][pin_point[0]+1] = '��';
								break;
							case 2 :	//���� ���
								if(map[pin_point[1]-1][pin_point[0]-1] == '��' && map[pin_point[1]+1][pin_point[0]+1] == '��')
								{
									if(map[pin_point[1]-1][pin_point[0]-1] == '��')map[pin_point[1]-1][pin_point[0]-1] = '��';
									if(map[pin_point[1]+1][pin_point[0]+1] == '��')map[pin_point[1]-1][pin_point[0]-1] = '��';
									if(map[pin_point[1]-1][pin_point[0]+1] == '��')map[pin_point[1]+1][pin_point[0]+1] = '��';
									if(map[pin_point[1]+1][pin_point[0]-1] == '��')map[pin_point[1]+1][pin_point[0]+1] = '��';
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
