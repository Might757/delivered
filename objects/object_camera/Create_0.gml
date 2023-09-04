/// @description Set up camera
cam = view_camera[0]; // camera viewport 0
follow = object_player; // id of last instance of the player
view_w_half = camera_get_view_width(cam) * 0.5; // half of the width so the camera is always centered to the player;
view_h_half = camera_get_view_height(cam) * 0.5; // half of the height so the camera is always centered to the player;
xTo = xstart; 
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;