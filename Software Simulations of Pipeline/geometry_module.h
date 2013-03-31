//**********************************************************

void matrix_product(float matrix[4][4], float vertex[4][4], float vertex_out[4][4])
{
	int i=0, j=0, k=0;
	for(i=0;i<4; i++)
		for(j=0; j<4; j++)
			for(k=0; k<4; k++)
			{vertex_out[i][j]+=matrix[i][k]*vertex[k][j];}
}//矩阵乘法

//**********************************************************

void move_module(float movmatrix[4][4],float tx,float ty, float tz)
{
	movmatrix[0][0]=1; movmatrix[0][1]=0;movmatrix[0][2]=0; movmatrix[0][3]=tx;
	movmatrix[1][0]=0; movmatrix[1][1]=1;movmatrix[1][2]=0; movmatrix[1][3]=ty;
	movmatrix[2][0]=0; movmatrix[2][1]=0;movmatrix[2][2]=1; movmatrix[2][3]=tz;
	movmatrix[3][0]=0; movmatrix[3][1]=0;movmatrix[3][2]=0; movmatrix[3][3]=1;
}//	平移模块

//*********************************************************

void rotany_module(float rotanymatrix[4][4],float axis[3],int *rotcnt)
{
	float quad[4];
	rotanymatrix[0][3]=0; rotanymatrix[1][3]=0;rotanymatrix[2][3]=0; 
	rotanymatrix[3][0]=0; rotanymatrix[3][1]=0;rotanymatrix[3][2]=0; rotanymatrix[3][3]=1;
	if (*rotcnt==0)//旋转0°
		{	
		quad[0]=0; quad[1]=0; quad[2]=0; quad[3]=1;
		}
	if (*rotcnt == 1)//30
	    {	
		quad[0]=float(0.26)*axis[0]; quad[1]=float(0.26)*axis[1]; quad[2]=float(0.26)*axis[2]; quad[3]=float(0.966);
		}	    
	if (*rotcnt == 2)//60
	    { 
		quad[0]=float(0.5)*axis[0]; quad[1]=float(0.5)*axis[1]; quad[2]=float(0.5)*axis[2]; quad[3]=float(0.866);
		} 
	if (*rotcnt == 3)//90
	    {
		quad[0]=float(0.707)*axis[0]; quad[1]=float(0.707)*axis[1]; quad[2]=float(0.707)*axis[2]; quad[3]=float(0.707);
		}
	if (*rotcnt == 4)//120
	    { 
		quad[0]=float(0.866)*axis[0]; quad[1]=float(0.866)*axis[1]; quad[2]=float(0.866)*axis[2]; quad[3]=float(0.5);
		}	
	if (*rotcnt == 5)//150
	    {
		quad[0]=float(0.966)*axis[0]; quad[1]=float(0.966)*axis[1]; quad[2]=float(0.966)*axis[2]; quad[3]=float(0.26);
		}	    
	if (*rotcnt == 6)//180
	    {
		quad[0]=axis[0]; quad[1]=axis[1]; quad[2]=axis[2]; quad[3]=0;
		}	    
	if (*rotcnt == 7)//210
	    {
		quad[0]=float(0.966)*axis[0]; quad[1]=float(0.966)*axis[1]; quad[2]=float(0.966)*axis[2]; quad[3]=float(-0.26);
		}	    
	if (*rotcnt == 8)//240
	    {
		quad[0]=float(0.866)*axis[0]; quad[1]=float(0.866)*axis[1]; quad[2]=float(0.866)*axis[2]; quad[3]=float(-0.5);
		}	    
	if (*rotcnt == 9)//270
	    {
		quad[0]=float(0.707)*axis[0]; quad[1]=float(0.707)*axis[1]; quad[2]=float(0.707)*axis[2]; quad[3]=float(-0.707);
		}	    
	if (*rotcnt == 10)//300
	    { 
		quad[0]=float(0.5)*axis[0]; quad[1]=float(0.5)*axis[1]; quad[2]=float(0.5)*axis[2]; quad[3]=float(-0.866);
		}
	if (*rotcnt == 11)//330
	    { 	
		quad[0]=float(0.26)*axis[0]; quad[1]=float(0.26)*axis[1]; quad[2]=float(0.26)*axis[2]; quad[3]=float(-0.966);
		*rotcnt=0;
		}
	rotanymatrix[0][0]=1-2*(quad[1]*quad[1]+quad[2]*quad[2]);
	rotanymatrix[0][1]=2*(quad[0]*quad[1]-quad[3]*quad[2]);
	rotanymatrix[0][2]=2*(quad[0]*quad[2]+quad[3]*quad[1]);
	rotanymatrix[1][0]=2*(quad[0]*quad[1]+quad[3]*quad[2]);
	rotanymatrix[1][1]=1-2*(quad[0]*quad[0]+quad[2]*quad[2]);
	rotanymatrix[1][2]=2*(quad[1]*quad[2]-quad[3]*quad[0]);
	rotanymatrix[2][0]=2*(quad[0]*quad[2]-quad[3]*quad[1]);
	rotanymatrix[2][1]=2*(quad[1]*quad[2]+quad[3]*quad[0]);
	rotanymatrix[2][2]=1-2*(quad[0]*quad[0]+quad[1]*quad[1]);
	*rotcnt+=1;

}//选择角度的旋转模块（应用了四元组）		

//*********************************************************

void autorotany_module(float autorotanymatrix[4][4],float axis[3])
{
	float quad[4];
	static float sin,cos;

	autorotanymatrix[0][3]=0; autorotanymatrix[1][3]=0;autorotanymatrix[2][3]=0; 
	autorotanymatrix[3][0]=0; autorotanymatrix[3][1]=0;autorotanymatrix[3][2]=0; autorotanymatrix[3][3]=1;
	if(sin<=1)
	{	
		cos=(float)sqrt(1-sin*sin);
		quad[0]=sin*axis[0]; quad[1]=sin*axis[1]; quad[2]=sin*axis[2]; quad[3]=cos;
	}
	else sin=-1;
	autorotanymatrix[0][0]=1-2*(quad[1]*quad[1]+quad[2]*quad[2]);
	autorotanymatrix[0][1]=2*(quad[0]*quad[1]-quad[3]*quad[2]);
	autorotanymatrix[0][2]=2*(quad[0]*quad[2]+quad[3]*quad[1]);
	autorotanymatrix[1][0]=2*(quad[0]*quad[1]+quad[3]*quad[2]);
	autorotanymatrix[1][1]=1-2*(quad[0]*quad[0]+quad[2]*quad[2]);
	autorotanymatrix[1][2]=2*(quad[1]*quad[2]-quad[3]*quad[0]);
	autorotanymatrix[2][0]=2*(quad[0]*quad[2]-quad[3]*quad[1]);
	autorotanymatrix[2][1]=2*(quad[1]*quad[2]+quad[3]*quad[0]);
	autorotanymatrix[2][2]=1-2*(quad[0]*quad[0]+quad[1]*quad[1]);	
	sin=float(sin+0.01);
}//自动旋转模块（四元组）

//*********************************************************

void scale_module(float scmatrix[4][4], float sx,float sy,float sz)
{
	scmatrix[0][0]=sx; scmatrix[0][1]=0;scmatrix[0][2]=0; scmatrix[0][3]=0;
	scmatrix[1][0]=0; scmatrix[1][1]=sy;scmatrix[1][2]=0; scmatrix[1][3]=0;
	scmatrix[2][0]=0; scmatrix[2][1]=0;scmatrix[2][2]=sz; scmatrix[2][3]=0;
	scmatrix[3][0]=0; scmatrix[3][1]=0;scmatrix[3][2]=0; scmatrix[3][3]=1;
}//缩放模块

//*********************************************************
void geometry_module(float matrix[4][4],float t[3],float s[3],float axis[3],int *rotcnt)//变换顺序为缩放、旋转、平移
{
static float movmatrix[4][4];
static float rotanymatrix[4][4];
static float scmatrix[4][4];
static float tmpmatrix[4][4];

	move_module(movmatrix,t[0],t[1],t[2]);

	scale_module(scmatrix,s[0],s[1],s[2]);

	rotany_module(rotanymatrix,axis,rotcnt);

	matrix_product(movmatrix,rotanymatrix,tmpmatrix);
	matrix_product(tmpmatrix,scmatrix,matrix);
	
	int i, j;		
	for(i=0;i<4; i++)
			for(j=0; j<4; j++)
			{
				rotanymatrix[i][j]=0;
				scmatrix[i][j]=0;
				tmpmatrix[i][j]=0;
				movmatrix[i][j]=0;
			}//注意输出的矩阵要及时清零，不然会产生内存错误
}
//将各图形变换级联的几何变换模块（效率更高）
void auto_geometry_module(float matrix[4][4],float t[3],float s[3],float axis[3])//变换顺序为缩放、旋转、平移
{
static float movmatrix[4][4];
static float autorotanymatrix[4][4];
static float scmatrix[4][4];
static float tmpmatrix[4][4];

	move_module(movmatrix,t[0],t[1],t[2]);

	scale_module(scmatrix,s[0],s[1],s[2]);

	autorotany_module(autorotanymatrix,axis);

	matrix_product(movmatrix,autorotanymatrix,tmpmatrix);
	matrix_product(tmpmatrix,scmatrix,matrix);
	
	int i, j;		
	for(i=0;i<4; i++)
			for(j=0; j<4; j++)
			{
				autorotanymatrix[i][j]=0;
				scmatrix[i][j]=0;
				tmpmatrix[i][j]=0;
				movmatrix[i][j]=0;
			}//注意输出的矩阵要及时清零，不然会产生内存错误
}
//将各图形变换级联的几何变换模块（效率更高）
