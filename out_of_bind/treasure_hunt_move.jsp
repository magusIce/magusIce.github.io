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
	case 1 : if(player[1] == 0)//�ʰ��϶� ��;�� �� 0�̿��� ���� �۾���������	��
			 {
				TEXT = "���� �����δ� ������ ����";
				break;
			 }
			 else if(map[player[1]-1][player[0]]=='��')
			 {
				TEXT = "���� �㹰����.";			// ��  y ����. ���� ���� ����. �� �÷��̾� ��ġ���� y-1 �غ������� '��'�̸� ����
				map[player[1]-1][player[0]] = '��';
				count++;
			 }
			 else	//�װ� �ƴ϶� �� �� �ִٸ�
			 {
				map[player[1]][player[0]] = '��'; // ���� �ִ����� ����
				player[1] -= 1; //���� ��ĭ �÷���.
				map[player[1]][player[0]] = '��'; //������ ��ǥ�� �ٽ� �÷��̾� ��ġ
				TEXT = "������ ���ư��ϴ�.";
				count++;
			 }break;	
	case 2 : if(player[0] == 0)//�ʰ��϶� ���ʷ�.. �� �迭 ���� ���̺��� �۾���������
			 {
				TEXT = "���� �����δ� ������ ����";
				break;
			 }
			 else if(map[player[1]][player[0]-1]=='��')
			 {
				TEXT = "���� �㹰����.";			// ���� x����. ���� ���� ����. �� �÷��̾� ��ġ���� x-1 �غ������� '��'�̸� ����
				map[player[1]][player[0]-1] = '��';
				count++;
			 }
			 else	//�װ� �ƴ϶� �� �� �ִٸ�
			 {
				map[player[1]][player[0]] = '��'; // ���� �ִ����� ����
				player[0] -= 1; //������ ��ĭ �÷���.
				map[player[1]][player[0]] = '��'; //������ ��ǥ�� �ٽ� �÷��̾� ��ġ
				TEXT = "������ ���ư��ϴ�.";
				count++;
			 }break;	//��
	case 3 : if(player[0] == map.length - 1)//�ʰ��϶� �����ʷ�.. �� �迭 ���� ���̺��� Ŀ����
			 {
				TEXT = "���� �����δ� ������ ����";
				break;
			 }
			 else if(map[player[1]][player[0]+1]=='��')
			 {
				TEXT = "���� �㹰����.";			// ������ x���. ���� ���� ����. �� �÷��̾� ��ġ���� x+1 �غ������� '��'�̸� ����
				map[player[1]][player[0]+1] = '��';
				count++;
			 }
			 else	//�װ� �ƴ϶� �� �� �ִٸ�
			 {
				map[player[1]][player[0]] = '��'; // ���� �ִ����� ����
				player[0] += 1; //������ ��ĭ �÷���.
				map[player[1]][player[0]] = '��'; //������ ��ǥ�� �ٽ� �÷��̾� ��ġ
				TEXT = "������ ���ư��ϴ�.";
				count++;
			 }break;	//��
	case 4 : if(player[1] == map.length - 1)//�ʰ��϶� �Ʒ���.. �� �迭 ���� ���̺��� Ŀ����
			 {
			 	TEXT = "���� �����δ� ������ ����";
				break;
			 }
			 else if(map[player[1]+1][player[0]]=='��')
			 {
				TEXT = "���� �㹰����.";			// ��  y ���. ���� ���� ����. �� �÷��̾� ��ġ���� y+1 �غ������� '��'�̸� ����
				map[player[1]+1][player[0]] = '��';
				count++;
			 }
			 else	//�װ� �ƴ϶� �� �� �ִٸ�
			 {
				map[player[1]][player[0]] = '��'; // ���� �ִ����� ����
				player[1] += 1; //�Ʒ��� ��ĭ ������.
				map[player[1]][player[0]] = '��'; //������ ��ǥ�� �ٽ� �÷��̾� ��ġ
				TEXT = "������ ���ư��ϴ�.";
				count++;
			 }break;	//��
	case 5 :	//??
}
if(player[0]==goal[0] && player[1]==goal[1])
{
	game=0;
	TEXT = "�����߽��ϴ�.";
}

session.setAttribute("map", map);
session.setAttribute("player", player);
session.setAttribute("TEXT", TEXT);
session.setAttribute("count", count);
session.setAttribute("game", game);
response.sendRedirect("treasure_hunt_main.jsp");
%>