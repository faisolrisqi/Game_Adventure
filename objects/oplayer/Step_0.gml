//input pengguna
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Gerakan
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;
 
if(place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
}

//horizontal
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x+sign(hsp);
	}
	hsp = 0;
}
x = x+hsp;

//vertical
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y+sign(vsp);
	}
	vsp = 0;
}
y = y+vsp;

//Animasi
if(!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 6; else image_index = 0;
}
else
{
	image_speed = 0.5;
	if(hsp == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

if(hsp != 0) image_xscale = sign(hsp);