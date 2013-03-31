void clear_z_buffer(int *Z_buffer_ram)
{
	int i;
	for(i=0;i<(640*480);i++)
	{
		*(Z_buffer_ram+i)=0xffff;
	}
}//z_buffer初试化，0xffff使位于远处

void clear_matrix(float matrix[4][4])
{	
	int i=0,j=0;
	for(i=0;i<4; i++)
	for(j=0; j<4; j++)
	{
	matrix[i][j]=0;
	}
}