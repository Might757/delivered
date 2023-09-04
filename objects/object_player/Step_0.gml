/// @description Insert description here
//Player Input
if (hascontrol) 
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
}
else 
{
	key_left = 0;
	key_jump = 0;
}
	
//Calculate movement (if both left and right keys pressed, object wont move)
hsp = (key_right - key_left) * walksp;
vsp = vsp + grv;
bulletDirection = point_direction(x,y,mouse_x,mouse_y);

//JUMP
if (canJump-- > 0) && (key_jump) 
{
	vsp = vspJump;
	canJump = 0;
	audio_play_sound(sound_player_jump, 10, false);
	
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
	hsp = 0;
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
	sprite_index = sprite_player_jump;
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

	image_speed = 1;
	if (hsp == 0) 
	{
		sprite_index = sprite_player_idle_right;
		
	} else 
	{
		sprite_index = sprite_player_walk_right;
	}

}

if (hsp != 0) 
{
	image_xscale = sign(hsp);
}


//SHOOT
firingDelay = firingDelay - 1;
aniRecoil = max(0,aniRecoil - 1)
if (mouse_check_button(mb_left)) && (firingDelay < 0) 
{

	firingDelay = 5;
	aniRecoil = 4;
	script_screenShake(1,10);
	audio_sound_pitch(sound_player_bullet,choose(0.8,1,1.2));
	audio_play_sound(sound_player_bullet,5,false);
	with (instance_create_layer(x, y,"Bullets", object_player_bullet))
	{
		
		spd = 10; //bullet speed is equal to 25 pixels
		direction = other.bulletDirection + random_range(-3,3);
		image_angle = direction;
	}


}

if (y > room_height) // if player out of bounds, game restarts, player loses.
{
script_screenShake(10,10);
room_restart();
}
