f2 = keyboard_check_released(vk_f2);
f3 = keyboard_check_released(vk_f3);
f5 = keyboard_check_released(vk_f5);
f6 = keyboard_check_released(vk_f6);
if(f3)
{
	f3Count ++;
	if(f3Count == 1)
	{
		debug = true;	
	}
	else if(f3Count == 2)
	{
		debug = false;
		f3Count = 0;
	}
}

if(f2)
{
	room_restart();
}
if(f5)
{
	room_goto_previous();
}
if(f6)
{
	room_goto_previous();
}
