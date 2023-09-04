if(instance_exists(object_player)) 
{
	if (point_distance(object_player.x, object_player.y,x,y) < 600)
	{
		enBulletDirection = point_direction(x,y,object_player.x, object_player.y);
		countdown--;
		if (countdown <= 0) 
		{
			countdown = countdownrate;
			if(!collision_line(x,y, object_player.x, object_player.y, oWall, false, false))
			{		
				with (instance_create_layer(x, y,"Bullets", object_enemy_bullet))
				{
		
					spd = 5; //bullet speed is equal to 25 pixels
					direction = other.enBulletDirection + random_range(-3,3);
					image_angle = direction;
				}
			}

		}

	}

}
if (hp <= 0) 
{
	with(instance_create_layer(x,y,layer,object_enemy_finalBoss_dead)) 
	{
		direction = other.hitFrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction)-2;
		if(sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
	}
	
	instance_destroy();
}



