void triangle_setup(int px0, int py0, int px1, int py1, int px2, int py2, int pz0, int pz1, int pz2,
					float w[3],int *x0_p, int *y0_p, int *x1_p, int *y1_p, int *x2_p, int *y2_p, 
					int *z0_p,int *z1_p, int *z2_p,float *w0_p,float *w1_p,float *w2_p,int vertex_color[3][3],
					int vertex_color_p[3][3],int *area,float texture_cood[2][3], float tex_cood[2][3])
{
	int	v1, v2, v3, v4;
	int	m1, m2;
	int i=0;
	if(py0<=py1) 
		if(py0<=py2)
		{	v1=px1-px0;	v2=py1-py0;	v3=px2-px0;	v4=py2-py0;
			*x0_p=px0;	*y0_p=py0;
			for(i=0;i<3;i++)
			vertex_color_p[i][0]=vertex_color[i][0];
		}
		else 
		{	v1=px0-px2; v2=py0-py2; v3=px1-px2; v4=py1-py2;
			*x0_p=px2; *y0_p=py2;
			for(i=0;i<3;i++)
			vertex_color_p[i][0]=vertex_color[i][2];
		}
	else 
		if(py1<=py2)
		{	v1=px2-px1; v2=py2-py1; v3=px0-px1; v4=py0-py1;
			*x0_p=px1; *y0_p=py1;
			for(i=0;i<3;i++)
			vertex_color_p[i][0]=vertex_color[i][1];
		}
		else
		{	v1=px0-px2; v2=py0-py2; v3=px1-px2; v4=py1-py2;
			*x0_p=px2; *y0_p=py2;
			for(i=0;i<3;i++)
			vertex_color_p[i][0]=vertex_color[i][2];
		}
			
	m1=v1*v4;
	m2=v2*v3;
	*area=abs(m1-m2);//防止除数为0?

	if(*x0_p==px0 && *y0_p==py0)
		{	
			for(i=0;i<2;i++)
			{
				tex_cood[i][0]=texture_cood[i][0];
			}
			*z0_p=pz0;
			*w0_p=w[0];
		if((m1-m2)>0)
			{  *x1_p=px1; *x2_p=px2;*y1_p=py1; *y2_p=py2;
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][1]; 
					tex_cood[i][2]=texture_cood[i][2];
				}
			   *z1_p=pz1;	*z2_p=pz2;	*w1_p=w[1];	*w2_p=w[2];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][1];
				vertex_color_p[i][2]=vertex_color[i][2];
				}
			}
		else
			{  *x1_p=px2; *x2_p=px1;*y1_p=py2; *y2_p=py1;
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][2]; 
					tex_cood[i][2]=texture_cood[i][1]; 
				}
				*z1_p=pz2;	*z2_p=pz1;	*w1_p=w[2];	*w2_p=w[1];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][2];
				vertex_color_p[i][2]=vertex_color[i][1];
				}
			} 
		}
	else if(*x0_p==px1 && *y0_p==py1)
		{ 
			for(i=0;i<2;i++)
			{
				tex_cood[i][0]=texture_cood[i][1];
			}
			*z0_p=pz1;
			*w0_p=w[1];
		if((m1-m2)>0)
			{ *x1_p=px2; *x2_p=px0;*y1_p=py2; *y2_p=py0;
				
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][2]; 
					tex_cood[i][2]=texture_cood[i][0];
				}
				*z1_p=pz2;	*z2_p=pz0;	*w1_p=w[2];	*w2_p=w[0];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][2];
				vertex_color_p[i][2]=vertex_color[i][0];
				}
			}
		else
			{ *x1_p=px0; *x2_p=px2;*y1_p=py0; *y2_p=py2;
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][0]; 
					tex_cood[i][2]=texture_cood[i][2]; 
				}
				*z1_p=pz0;	*z2_p=pz2;	*w1_p=w[0];	*w2_p=w[2];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][0];
				vertex_color_p[i][2]=vertex_color[i][2];
				}
			}
		}
	else if(*x0_p==px2 && *y0_p==py2)
		{	
			for(i=0;i<2;i++)
			{
				tex_cood[i][0]=texture_cood[i][2];
			}
			*z0_p=pz2;
			*w0_p=w[2];
		if((m1-m2)>0)
			{ *x1_p=px0; *x2_p=px1; *y1_p=py0; *y2_p=py1;
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][0]; 
					tex_cood[i][2]=texture_cood[i][1];
				}
				*z1_p=pz0;	*z2_p=pz1;	*w1_p=w[0];	*w2_p=w[1];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][0];
				vertex_color_p[i][2]=vertex_color[i][1];
				}
			}
		else
			{ *x1_p=px1; *x2_p=px0; *y1_p=py1; *y2_p=py0;
				for(i=0;i<2;i++)
				{
					tex_cood[i][1]=texture_cood[i][1]; 
					tex_cood[i][2]=texture_cood[i][0];
				}
				*z1_p=pz1;	*z2_p=pz0;	*w1_p=w[1];	*w2_p=w[0];
				for(i=0;i<3;i++)
				{
				vertex_color_p[i][1]=vertex_color[i][1];
				vertex_color_p[i][2]=vertex_color[i][0];
				}
			}
		}
	//顶点排序

}

void triangle_raster(int px0, int py0, int px1, int py1, int px2, int py2, int pz0, int pz1, int pz2, int *Z_buffer_ram,
					 int vertex_color[3][3], int *area, float w[3],float tex_cood[2][3], int texture[200][200][3])
{
	int max_x, max_y, min_x, min_y;
	int tempx, tempy;
	int ex0, ex1, ex2;
	float a[3]={0,0,0};
	float b[3]={0,0,0};
	float c[3]={0,0,0};
	int temp_z=0;
	int *addr_z=0;
	int pix_color[3]={0,0,0}; 
	int color_ver=0; //像素的颜色：由颜色插值得到

	float pix_texture_coodx=0, pix_texture_coody=0;//插值出的纹理坐标 0~1 
	int pix_coodx=0, pix_coody=0; //由插值的纹理坐标转换后的纹理坐标 。

	int color_tex; //像素的颜色：由纹理插值得到 

	//float	sr=float(0.2), sg=float(0.2), sb=float(0.2); // color_tex中red green blue所占权重。 用于颜色融合 
	//float	dr=float(0.8), dg=float(0.8), db=float(0.8); // color_tc
	float	sr=float(0.5), sg=float(0.5), sb=float(0.5); // color_tex中red green blue所占权重。 用于颜色融合 
	float	dr=float(0.5), dg=float(0.5), db=float(0.5); // color_tc

	int  red, green, blue;//融合之后的颜色分量 	
	int color;  //融合之后的颜色 


	int i,j;

	max_x=int((px0>=px1)?((px0>=px2)?px0:px2):((px1>=px2)?px1:px2));
	max_y=int((py0>=py1)?((py0>=py2)?py0:py2):((py1>=py2)?py1:py2));
	min_x=int((px0<=px1)?((px0<=px2)?px0:px2):((px1<=px2)?px1:px2));
	min_y=int((py0<=py1)?((py0<=py2)?py0:py2):((py1<=py2)?py1:py2));

	for(tempy=min_y&&min_y>=0; tempy<=max_y&&max_y<=480; tempy++)
		for(tempx=min_x&&min_x>=0; tempx<=max_x&&max_x<=640; tempx++) 
			//注意0=<tempy<=480，0=<tempx<=640,不然图形越过边界会产生内存错误
			{	
			ex0=(tempx-px0)*(-(py1-py0))+(tempy-py0)*(px1-px0);
			ex1=(tempx-px1)*(-(py2-py1))+(tempy-py1)*(px2-px1);
			ex2=(tempx-px2)*(-(py0-py2))+(tempy-py2)*(px0-px2); //边函数			
				if(ex0>=0 && ex1>=0 && ex2>=0)
				{
					a[0]=float(ex1)/(*area); a[1]=float(ex2)/(*area); a[2]=1-a[0]-a[1];
					//ex和*area都是整数，相除结果为整数，为提高精度先将ex强制类型转换为浮点数
					b[0]=ex1/w[0]; b[1]=ex2/w[1]; b[2]=ex0/w[2];//透视校正
					//b[0]=ex1; b[1]=ex2; b[2]=ex0;	
					c[1]=b[1]/(b[0]+b[1]+b[2]);
					c[2]=b[2]/(b[0]+b[1]+b[2]);
					c[0]=1-c[1]-c[2];

					temp_z=int(pz0*a[0]+pz1*a[1]+pz2*a[2]);
					addr_z=Z_buffer_ram+tempy*640+tempx;
						if(temp_z<=*addr_z)
						{
						*addr_z=temp_z;	
							for(i=0; i<3; i++)
								for(j=0; j<3; j++)
								{	
									pix_color[i]+=int(vertex_color[i][j]*a[j]);
								}
						
							color_ver=(pix_color[0]+pix_color[1]*256+pix_color[2]*65536)&0x00ffffff;
							//像素的颜色：由颜色插值得到
							
							for(i=0; i<2; i++)
								for(j=0; j<3; j++)
								{ 	
								if(i==0) pix_texture_coodx+=tex_cood[0][j]*c[j];
								if(i==1) pix_texture_coody+=tex_cood[1][j]*c[j];
								}//插值出的纹理坐标 0~1（参数空间）
								pix_coodx=int(pix_texture_coodx*200);
								pix_coody=int(pix_texture_coody*200);//参数空间映射到纹理图像空间

								//color_tex=int(texture[pix_coody][pix_coodx][0]+texture[pix_coody][pix_coodx][1]*256+
								//texture[pix_coody][pix_coodx][2]*65536)&0x00ffffff;
								color_tex=(texture[pix_coody][pix_coodx][2]+texture[pix_coody][pix_coodx][1]*256+
								texture[pix_coody][pix_coodx][0]*65536)&0x00ffffff;

								/*red=int(pix_color[0]*dr+texture[pix_coody][pix_coodx][0]*sr)&0x000000ff;
								green=int(pix_color[1]*256*dg+texture[pix_coody][pix_coodx][1]*256*sg)&0x0000ff00;
								blue=int(pix_color[2]*65536*db+texture[pix_coody][pix_coodx][2]*65536*sb)&0x00ff0000;*/
								red=int(pix_color[2]*dr+texture[pix_coody][pix_coodx][2]*sr)&0x000000ff;
								green=int(pix_color[1]*256*dg+texture[pix_coody][pix_coodx][1]*256*sg)&0x0000ff00;
								blue=int(pix_color[0]*65536*db+texture[pix_coody][pix_coodx][0]*65536*sb)&0x00ff0000;
								color=red+green+blue;

							//putpixel(tempx, tempy, color_ver);
							//putpixel(tempx, tempy, color_tex);
								putpixel(tempx, tempy, color);
							
							for(i=0; i<3; i++)
							pix_color[i]=0;
							color_tex=0;
							pix_texture_coodx=0;
							pix_texture_coody=0;
						}

				}

			}
				
}