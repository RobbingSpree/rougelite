/// @description move and act

var left = keyboard_check_pressed(vk_left);
var right = keyboard_check_pressed(vk_right);
var down = keyboard_check_pressed(vk_down);
var up = keyboard_check_pressed(vk_up);
var A = keyboard_check_pressed(ord("Z"));
var B = keyboard_check_pressed(ord("X"));

if state == "idle" && A 
{
	state = "menu";
	menu = instance_create_layer(x,y-unit,"Instances",menu_);
	menu.list=skills;
	menu.list_len=s_total;
	menu.parent=self;
	menu.facing = last_dir;
	menu.target_x=x;
	menu.target_y=y;
}

if state == "menu" && !instance_exists(menu_)
	state = "idle";
	
var input = false;

if state == "idle"
{
	if left && !input {
		x-=unit;
		last_dir = 0;
		input = true;
	}
	if right && !input {
		x+=unit;
		last_dir = 2;
		input = true;
	}
	if up && !input {
		y-=unit;
		last_dir = 1;
		input = true;
	}
	if down && !input {
		y+=unit;
		last_dir = 3;
		input = true;
	}
	if left || right || down || up
	{
		actions -=1;
		if actions <= 0
		{
			state ="wait";
			enemy.state="action";
			actions = max_actions;
		}
	}
} 

if state == "changing"
	state = "idle";

if state == "wait"
	state = "changing";