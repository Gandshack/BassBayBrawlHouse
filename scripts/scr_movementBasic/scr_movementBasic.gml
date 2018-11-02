//Arguments
mSpeed = argument0;
gravy = argument1;
yy = argument2;
sprMain = argument3;
sprCrouch = argument4;
sprJump = argument5;
//GatherInputs
Jump = keyboard_check_pressed(ord("W")); //detects when 'W' is pressed
mLeft = keyboard_check(ord("A")); //detects when 'A is pressed
mRight = keyboard_check(ord("D")); //detects when 'D is pressed
Crouch = keyboard_check(ord("S")); //detects when 'S is pressed
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
	if(image_index > sprite_index + 1)
	{
		image_speed = 0;
		mSpeed = 0;
	}
}

//if left or right and not crouching move
if(((mLeft)||(mRight))&&!Crouch)
{
	sprite_index = sprMain;
	//changes direction player faces(work in progress)
	if(mRight)
	{
		image_xscale = sign(1); 
	}
	else if(mLeft)
	{
		image_xscale = sign(-1);
	}
	//if in the air, player moves slower(work in progress)
	if(!place_meeting(x,y+1, o_floorMask))
	{
		mSpeed = 1.25;
	}
	else if(place_meeting(x,y+1, o_floorMask))
	{
		mSpeed = 2;
	}
}
xx = mRight - mLeft;
x += xx * mSpeed;
//if up is pressed, player jumps
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














