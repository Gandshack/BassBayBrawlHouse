
//Variables
mSpeed = 2;
//GatherInputs
Jump = keyboard_check(ord("W"));
mLeft = keyboard_check(ord("A"));
mRight = keyboard_check(ord("D"));
Crouch = keyboard_check(ord("S"));
mUpRele = keyboard_check_released(ord("W"));
mLeftRele = keyboard_check_released(ord("A"));
mRightRele = keyboard_check_released(ord("D"));
mCrouchRele = keyboard_check_released(ord("S"));

//Interperate Inputs

//Left and Right


if(!mLeft && !mRight && !Crouch) {
	sprite_index = s_player1;
	image_index = 0;
}

if(Crouch) {
	sprite_index = s_player1Crou;
	mSpeed = 0;
	if(image_index == 2 && sprite_index == s_player1Crou) {
		image_speed = 0;
	}
}
else {
	mSpeed = 2;
	image_speed = 1;
}

if(Jump == true) {
	for(var up = 0; up <= 5; up++)
	{
		y += yy * mSpeed;
	}
	
	for(var down = 0; down <= 5; down++)
	{
		y -= yy * mSpeed;
	}
}
xx = mRight - mLeft;
x += xx * mSpeed;

