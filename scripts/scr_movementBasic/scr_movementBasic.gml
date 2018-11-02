//Arguments
mSpeed = argument0;
gravy = argument1;
yy = argument2;
sprMain = argument3;
sprCrouch = argument4;
sprJump = argument5;
//GatherInputs
Jump = keyboard_check_pressed(ord("W"));
mLeft = keyboard_check(ord("A"));
mRight = keyboard_check(ord("D"));
Crouch = keyboard_check(ord("S"));
//Interperate Inputs
//stops animation if !pressing a key (will change later to idle animation)
if(!keyboard_key)
{
	image_speed = 0;
	image_index = 0;
	mSpeed = 2;
}
else
{
	image_speed = 1;	
}
//crouch animation
if(Crouch)
{
	sprite_index = sprCrouch;
	if(image_index > 2)
	{
		image_speed = 0;
		mSpeed = 1;
	}
}

//left and right
if((mLeft)||(mRight))
{
	sprite_index = sprMain;
}
xx = mRight - mLeft;
x += xx * mSpeed;
//Jump
if(!place_meeting(x,y+1,o_floorMask))
{
	yy += gravy;
}
else if(place_meeting(x,y+1,o_floorMask))
{
	yy = 0;
}
if(Jump && yy == 0)
{
	yy = -12;
}



y += yy;














