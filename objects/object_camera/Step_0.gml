/// @description Update camera
cursor_sprite = sprite_cursor;
window_set_cursor(cr_none);
//Update destination
if (instance_exists(follow)) //checks if player exists
{
	xTo = follow.x;
	yTo = follow.y;
	
	if((follow).object_index == object_player_dead) 
	{
		x = xTo;
		y = yTo;
	}

}

//Update object position
x += (xTo - x) / 25; // moves the camera horizontally to 1/25 of the position the player wants to go
y += (yTo - y) / 25; // moves the camera vertically to 1/25 of the position the player wants to go

//Keep camera center inside room
x = clamp(x,view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y,view_h_half + buff, room_height - view_h_half - buff);

// Screen Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);


// PARALLAX BG LEVEL EASY
if(layer_exists("Clouds"))
{
	layer_x("Clouds",x/2)
}
if(layer_exists("Mountains"))
{
	layer_x("Mountains",x/4)
}
if(layer_exists("Grass"))
{
	layer_x("Grass",x/8)
}

// PARALLAX BG LEVEL MEDIUM
if (room = room_medium) 
{
	if(layer_exists("BG7"))
	{
		layer_x("BG7",x/2)
	}
	if(layer_exists("BG6"))
	{
		layer_x("BG6",x/4)
	}
	if(layer_exists("BG5"))
	{
		layer_x("BG5",x/8)
	}
	if(layer_exists("BG4"))
	{
		layer_x("BG4",x/10)
	}
	if(layer_exists("BG3"))
	{
		layer_x("BG3",x/12)
	}
	if(layer_exists("BG2"))
	{
		layer_x("BG2",x/14)
	}
	if(layer_exists("BG1"))
	{
		layer_x("BG1",x/16)
	}
}

if (room = room_hard) 
{

	if(layer_exists("BG1"))
	{
		layer_x("BG1",x/2)
	}
	if(layer_exists("BG2"))
	{
		layer_x("BG2",x/4)
	}
	if(layer_exists("BG3"))
	{
		layer_x("BG3",x/6)
	}
	if(layer_exists("BG4"))
	{
		layer_x("BG4",x/8)
	}
}

if (room = room_boss) 
{

	if(layer_exists("BG1"))
	{
		layer_x("BG1",x/2)
	}
	if(layer_exists("BG2"))
	{
		layer_x("BG2",x/4)
	}
	if(layer_exists("BG3"))
	{
		layer_x("BG3",x/6)
	}
	if(layer_exists("BG4"))
	{
		layer_x("BG4",x/8)
	}
	if(layer_exists("BG5"))
	{
		layer_x("BG5",x/10)
	}
}