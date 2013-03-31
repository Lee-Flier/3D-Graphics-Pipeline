void	vertex_input(float matrix[4][4],float	texture_coord[2][3],int *count, int vertex_color[3][3])
{
	matrix[3][0]=1.0; matrix[3][1]=1.0;matrix[3][2]=1.0; matrix[3][3]=0.0;
	matrix[0][3]=0.0;	matrix[1][3]=0.0;matrix[2][3]=0.0; matrix[3][3]=0.0;
	if(*count==0)
		{	
			matrix[0][0]=-0.5;	matrix[0][1]=0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=-0.5;	matrix[1][1]=-0.5;	matrix[1][2]=0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=-0.5;		matrix[2][2]=-0.5;
			
			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;
			
			vertex_color[0][0]=0;	vertex_color[0][1]=255;		vertex_color[0][2]=0;
			vertex_color[1][0]=255;	vertex_color[1][1]=255;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==1)
		{	
			matrix[0][0]=0.5;		matrix[0][1]=-0.5;		matrix[0][2]=0.5;
			matrix[1][0]=-0.5;		matrix[1][1]=0.5;		matrix[1][2]=0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=-0.5;		matrix[2][2]=-0.5;	

			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=0;		vertex_color[0][2]=255;
			vertex_color[1][0]=255;	vertex_color[1][1]=0;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
	if(*count==2)
		{	
			matrix[0][0]=-0.5;	matrix[0][1]=0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=-0.5;	matrix[1][1]=-0.5;	matrix[1][2]=0.5;
			matrix[2][0]=0.5;		matrix[2][1]=0.5;		matrix[2][2]=0.5;

			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=0;	vertex_color[0][1]=255;		vertex_color[0][2]=0;
			vertex_color[1][0]=255;	vertex_color[1][1]=0;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==3)
		{	
			matrix[0][0]=0.5;		matrix[0][1]=-0.5;		matrix[0][2]=0.5;
			matrix[1][0]=-0.5;		matrix[1][1]=0.5;		matrix[1][2]=0.5;
			matrix[2][0]=0.5;		matrix[2][1]=0.5;		matrix[2][2]=0.5;
			
			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=0;		vertex_color[0][2]=255;
			vertex_color[1][0]=0;	vertex_color[1][1]=0;		vertex_color[1][2]=255;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
//正方体前后面
//**********************************************************************************************	
	if(*count==4)
		{	
			matrix[0][0]=-0.5;	matrix[0][1]=0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=-0.5;	matrix[1][1]=-0.5;	matrix[1][2]=-0.5;
			matrix[2][0]=-0.5;	matrix[2][1]=-0.5;		matrix[2][2]=0.5;

			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=0;	vertex_color[0][1]=255;		vertex_color[0][2]=0;
			vertex_color[1][0]=0;	vertex_color[1][1]=0;		vertex_color[1][2]=255;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==5)
		{	
			matrix[0][0]=0.5;		matrix[0][1]=-0.5;		matrix[0][2]=0.5;
			matrix[1][0]=-0.5;		matrix[1][1]=-0.5;		matrix[1][2]=-0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=0.5;	    matrix[2][2]=0.5;
			
			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=0;		vertex_color[0][2]=255;
			vertex_color[1][0]=0;	vertex_color[1][1]=255;		vertex_color[1][2]=255;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
	if(*count==6)
		{	
			matrix[0][0]=-0.5;	matrix[0][1]=0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=0.5;	matrix[1][1]=0.5;	matrix[1][2]=0.5;
			matrix[2][0]=-0.5;	matrix[2][1]=-0.5;		matrix[2][2]=0.5;

			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=255;		vertex_color[0][2]=0;
			vertex_color[1][0]=255;	vertex_color[1][1]=0;		vertex_color[1][2]=255;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==7)
		{	
			matrix[0][0]=0.5;		matrix[0][1]=-0.5;		matrix[0][2]=0.5;
			matrix[1][0]=0.5;		matrix[1][1]=0.5;		matrix[1][2]=0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=0.5;	    matrix[2][2]=0.5;
			
			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=0;		vertex_color[0][2]=0;
			vertex_color[1][0]=0;	vertex_color[1][1]=255;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
//正方体上下面
//**********************************************************************************************
	if(*count==8)
		{	
			matrix[0][0]=-0.5;	matrix[0][1]=-0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=-0.5;	matrix[1][1]=-0.5;	matrix[1][2]=0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=0.5;		matrix[2][2]=-0.5;

			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=0;	vertex_color[0][1]=0;		vertex_color[0][2]=255;
			vertex_color[1][0]=255;	vertex_color[1][1]=0;		vertex_color[1][2]=255;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==9)
		{	
			matrix[0][0]=-0.5;		matrix[0][1]=-0.5;		matrix[0][2]=-0.5;
			matrix[1][0]=-0.5;		matrix[1][1]=0.5;		matrix[1][2]=0.5;
			matrix[2][0]=0.5;		matrix[2][1]=-0.5;		matrix[2][2]=0.5;
			
			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=0;	vertex_color[0][1]=255;		vertex_color[0][2]=255;
			vertex_color[1][0]=0;	vertex_color[1][1]=255;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
	if(*count==10)
		{	
			matrix[0][0]=0.5;	matrix[0][1]=0.5;		matrix[0][2]=0.5;
			matrix[1][0]=-0.5;	matrix[1][1]=-0.5;	matrix[1][2]=0.5;
			matrix[2][0]=-0.5;		matrix[2][1]=0.5;		matrix[2][2]=-0.5;

			texture_coord[0][0]=0.0;	texture_coord[0][1]=1.0; texture_coord[0][2]=0.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=0.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=0;	vertex_color[0][1]=255;		vertex_color[0][2]=0;
			vertex_color[1][0]=255;	vertex_color[1][1]=255;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		//color:p0                    p1                          p2
		}
	if(*count==11)
		{	
			matrix[0][0]=0.5;		matrix[0][1]=0.5;		matrix[0][2]=0.5;
			matrix[1][0]=-0.5;		matrix[1][1]=0.5;		matrix[1][2]=0.5;
			matrix[2][0]=0.5;		matrix[2][1]=-0.5;		matrix[2][2]=0.5;
			
			texture_coord[0][0]=1.0;	texture_coord[0][1]=0.0; texture_coord[0][2]=1.0;
			texture_coord[1][0]=0.0;	texture_coord[1][1]=1.0; texture_coord[1][2]=1.0;

			vertex_color[0][0]=255;	vertex_color[0][1]=0;		vertex_color[0][2]=255;
			vertex_color[1][0]=255;	vertex_color[1][1]=0;		vertex_color[1][2]=0;
			vertex_color[2][0]=0;	vertex_color[2][1]=0;		vertex_color[2][2]=0;
		}
//正方体左右面

	
}