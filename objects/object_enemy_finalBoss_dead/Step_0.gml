if (done == 0) {
	vsp = vsp + grv;


	//Collide and Move
	if (place_meeting(x + hsp, y, oWall)) 
	{
		while (abs(hsp) > 0.1) 
		{
			hsp *= 0.5;
			if (!place_meeting(x + hsp, y, oWall)) 
			{
				x += hsp;

			} 
		}
		hsp = 0;
	}
	x += hsp;

	if (place_meeting(x, y + vsp, oWall)) 
	{
		if (vsp > 0) 
		{
			done = 1;
			image_index = 1;
		}
		while (abs(vsp) > 0.1) 
		{
			vsp *= 0.5;
			if (!place_meeting(x , y + vsp, oWall))
			{
				y += vsp;
			}
	
		}
		vsp = 0;
	}
	y += vsp;
}