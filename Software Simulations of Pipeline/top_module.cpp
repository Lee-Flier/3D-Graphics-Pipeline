#include<graphics.h>
#include<conio.h>
#include<time.h>
#include<math.h>
#include<stdlib.h>
#include<stdio.h>
#include<assert.h>
#include"geometry_module.h"
#include"raster_module.h"
#include"vertex_input.h"
#include"shubmp.h"
#include"clear.h"

int px0, py0, pz0, px1, py1, pz1, px2, py2, pz2;
int area;	
int vertex_color[3][3];
int	vertex_color_tmp[3][3];											

float vertex_matrix[4][4];
float vertex_out[4][4];
float rotation_matrix[4][4];
float rotation_matrix_out[4][4];
float scale_matrix[4][4];
float scale_matrix_out[4][4];
float move_matrix[4][4];
float move_matrix_out[4][4];
float geometry_matrix[4][4];
float geometry_matrix_out[4][4];

#if 1
float projection_matrix[4][4]={{1,	    0,		0,		 0},
							{ 0,  		1,	    0,		 0},
							{ 0,		0,		-1,		-2},
							{ 0,		0,		-1,		 0}};//͸��ͶӰ
#endif
#if 0
float projection_matrix[4][4]={{1,	    0,		0,		0},
							{ 0,  		1,	    0,		0},
							{ 0,		0,		1,		0},
							{ 0,		0,		0,		1}};//����ͶӰ
#endif

float projection_matrix_out[4][4];
float screen_matrix[4][4]={{320,	0,		0,		320},
							{ 0,  	240,	0,		240 },
							{ 0,	0,		200,	200 },
							{ 0,	0,		0,		1	}};

float texture_coord[2][3];//��������ǰ��������	
float tex_cood[2][3];//�����������������
/*int texture[8][8][3]=	{{{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255}},
								  {{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0}},
								  {{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255}},
								  {{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0}},
								  {{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255}},
								  {{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0}},
								  {{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255}},
								  {{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0},	{255,255,	255},	{255,	0,		0}}};*/
int texture[200][200][3];

float	ex0, ex1, ex2;
float	max_x,  min_x, max_y, min_y;
int		x0_tmp, y0_tmp, z0_tmp;
int		x1_tmp, y1_tmp, z1_tmp;
int		x2_tmp, y2_tmp, z2_tmp;
float	w0_p,w1_p,w2_p;
float   w[3]={0.0,0.0,0.0};

int	rotcnt=0;
int count=0;//�����α��

float t[3]={0,0,-2.5};//ƽ�Ʋ���
float s[3]={1,1,1};//���Ų���
//float axis[3]={1,0,0};
float axis[3]={0,float(0.707),float(0.707)};//���ⵥλ��ת������

int *Z_buffer_ram=(int*)malloc(sizeof(int)*(640*480));	//�ֱ���Ϊ640*480

int main()
{
	assert(Z_buffer_ram != NULL);
	clear_z_buffer(Z_buffer_ram);
	initgraph(640,480);
	bmp_input(texture);

	while(1)
	{
	geometry_module(geometry_matrix,t,s,axis,&rotcnt);//���μ����任
	//auto_geometry_module(geometry_matrix,t,s,axis);
	//void auto_geometry_module(float matrix[4][4],float t[3],float s[3],float axis[3])//�任˳��Ϊ���š���ת��ƽ��
		for(count=0;count<12;count++)
		{
		vertex_input(vertex_matrix,texture_coord,&count, vertex_color);//��������
		matrix_product(geometry_matrix,vertex_matrix,geometry_matrix_out);//����ͼ�α任
		matrix_product(projection_matrix,geometry_matrix_out,projection_matrix_out);//ͶӰ��������͸�ӣ�
		matrix_product(screen_matrix, projection_matrix_out,  vertex_out);//��Ļӳ��

		//px0=int(vertex_out[0][0]); py0=int(vertex_out[1][0]); pz0=int(vertex_out[2][0]);
		//px1=int(vertex_out[0][1]); py1=int(vertex_out[1][1]); pz1=int(vertex_out[2][1]);
		//px2=int(vertex_out[0][2]); py2=int(vertex_out[1][2]); pz2=int(vertex_out[2][2]);
		
		w[0]=vertex_out[3][0]; w[1]=vertex_out[3][1]; w[2]=vertex_out[3][2];
		px0=int(vertex_out[0][0]/w[0]); py0=int(vertex_out[1][0]/w[0]); pz0=int(vertex_out[2][0]/w[0]);
		px1=int(vertex_out[0][1]/w[1]); py1=int(vertex_out[1][1]/w[1]); pz1=int(vertex_out[2][1]/w[1]);
		px2=int(vertex_out[0][2]/w[2]); py2=int(vertex_out[1][2]/w[2]); pz2=int(vertex_out[2][2]/w[2]);
		
		triangle_setup(px0, py0, px1, py1, px2, py2, pz0, pz1, pz2,w,&x0_tmp, &y0_tmp, &x1_tmp, 
		           &y1_tmp, &x2_tmp, &y2_tmp, &z0_tmp, &z1_tmp, &z2_tmp,&w0_p,&w1_p,&w2_p,vertex_color,
				   vertex_color_tmp,&area,texture_coord, tex_cood);	
		w[0]=w0_p;w[1]=w1_p;w[2]=w2_p;
		triangle_raster(x0_tmp, y0_tmp, x1_tmp, y1_tmp, x2_tmp, y2_tmp, z0_tmp, z1_tmp, z2_tmp, 
			Z_buffer_ram,vertex_color_tmp, &area, w, tex_cood, texture);

		//void clear_matrix(float matrix[4][4])
		clear_matrix(geometry_matrix_out);
		clear_matrix(projection_matrix_out);
		clear_matrix(vertex_out);//ע������ľ���Ҫ��ʱ���㣬��Ȼ������ڴ����
		}
	clear_matrix(geometry_matrix);
	clear_z_buffer(Z_buffer_ram);
	//Sleep(10000000000); 
	Sleep(1000); //0.1s
	cleardevice(); //����
	}

	free(Z_buffer_ram);
	getch();
	closegraph();
	return 0;


}