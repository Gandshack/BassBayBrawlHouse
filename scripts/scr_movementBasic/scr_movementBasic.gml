//Arguments
mSpeed = argument0;
//GatherInputs
Jump = keyboard_check(ord("W"));
mLeft = keyboard_check(ord("A"));
mRight = keyboard_check(ord("D"));
Crouch = keyboard_check(ord("S"));
//Interperate Inputs
//Left and Right
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

if(Crouch)
{
	sprite_index = s_player1Crou;
	if(image_index > 2)
	{
		image_speed = 0;
		mSpeed = 0;
	}
}
else
{
	sprite_index = s_player1;	
}
xx = mRight - mLeft;
x += xx * mSpeed;

