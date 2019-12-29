/// @description move and act

var left = keyboard_check_pressed(vk_left);
var right = keyboard_check_pressed(vk_right);
var down = keyboard_check_pressed(vk_down);
var up = keyboard_check_pressed(vk_up);
var men = keyboard_check_pressed(vk_space);

if state == "idle" && men 
	state = "menu";

if state == "idle"
{
	if left 
		x-=unit;
	if right 
		x+=unit;
	if up 
		y-=unit;
	if down 
		y+=unit;
	if left || right || down || up
	{
		state ="wait";
		enemy.state="action";
	}
} 

if state == "changing"
	state = "idle";

if state == "wait"
	state = "changing";