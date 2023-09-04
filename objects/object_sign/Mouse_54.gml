/// @description Shows message when right click is pressed

if (point_in_circle(object_player.x, object_player.y, x,y, 64)) &&  (!instance_exists(object_text))
{
	with(instance_create_layer(x,y-64,layer,object_text)) 
	{
		text = other.text;
		length = string_length(text);
		
	}
	with (object_camera) follow = other.id;
}
