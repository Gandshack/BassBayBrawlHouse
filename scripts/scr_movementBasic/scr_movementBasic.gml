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
//if left or right and not crouching move
if(((mLeft)||(mRight))&&!Crouch)
{
	sprite_index = sprMain;
	//changes direction player faces(work in progress)
	if(mRight)
	{
		image_xscale = 1; 
	}
	else if(mLeft)
	{
		image_xscale = -1
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
//jumping animation (WIP)
if(Jump && yy == 0)//checks if jump key is pressed and on the ground
{	
	sprite_index = sprJump; //sets sprite
	image_speed = 0 //stops animation
	framecount = 0 //sets variable used to count frames
	for(i = 0; i < 60; i++)// for loop checks 60 times 60fps
	{
		framecount ++;// evrey check adds to the counter
		switch(framecount)// changes image depending on framenumber(framecount)
		{
			case 0: //no frames first image in animation
				image_index = 0;
				break;
			case 10://10 frames later goes to next image
				image_index = 1;
				break;
			case 20://20 frames it initiates jump on 3rd image in animation
				image_index = 2;
				yy = -12;
				break;
			case 30://...
				image_index = 3;
				break;
			case 40://...
				image_index = 4;
				break;
			case 50://...
				image_index = 5;
				break;
			case 60://...
				break;
		}
	}

}



y += yy;














