/// @description create spark
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (place_meeting(x,y,oWall)) && (image_index != 0) 
{
	instance_change(object_hitSpark, true);
}


