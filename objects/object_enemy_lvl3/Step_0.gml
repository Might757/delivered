vsp = vsp + grv;

//Dont walk off edges

if(grounded) && (afraidOfHeights) && (!place_meeting(x + hsp, y + 1, oWall)) 
{
	if (hsp < 0) 
	{
		hsp = 1;
	}
	else 
	{
		hsp = -1
	}
}
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
	if (hsp < 0) 
	{
		hsp = 1;
	}
	else 
	{
		hsp = -1
	}
}
x += hsp;

if (place_meeting(x, y + vsp, oWall)) 
{
	if (vsp > 0) canJump = 10; 
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






//Animation 
if(!place_meeting(x,y+1,oWall)) 
{
	grounded = false;
	sprite_index = sprite_enemy_lvl3_jump;
	image_speed = 0;
	if (sign(vsp) > 0) 
	{
		image_index = 2;
	} else 
	{
		image_index = 1;
	}
} else 
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0) 
	{
		sprite_index = sprite_enemy_lvl3_idle;
		
	} else 
	{
		sprite_index = sprite_enemy_lvl3_walk;
	}

}

if (hsp != 0) 
{
	image_xscale = sign(hsp) * size;
	
}
image_yscale = size;


