/// @description 
var A = keyboard_check_pressed(ord("Z"));
var B = keyboard_check_pressed(ord("X"));
var left = keyboard_check_pressed(vk_left);
var right = keyboard_check_pressed(vk_right);
var down = keyboard_check_pressed(vk_down);
var up = keyboard_check_pressed(vk_up);

if (up || down) && (choice == "top" || choice=="supermenu") //move on the menu
{
	var dir = down-up;
	highlight+=dir;
	if highlight >= list_len
		highlight=0;
	if highlight< 0
		highlight = list_len-1;
}

if choice == "supermenu" && A
{
	if target_x.skills[highlight,1] != -1
	{
		//add stolen skill to player skill list
		hero.skills[hero.s_total,0] = target_x.skills[highlight,0];
		hero.skills[hero.s_total,1] = target_x.skills[highlight,1];
		hero.s_total+=1;
		target_x.skills[highlight,0] = "????";
		target_x.skills[highlight,1] = -1;
	}
	instance_destroy(self);
	instance_destroy(parent);
}

if choice == "facing"
{
	if left
	{
		if last_face == facing
			range +=1;
		facing = 0;
	}
	if up
	{
		if last_face == facing
			range +=1;
		facing = 1;
	}
	if right
	{
		if last_face == facing
			range +=1;
		facing = 2;
	}
	if down
	{
		if last_face == facing
			range +=1;
		facing = 3;
	}
	if last_face != facing
		range =1;
	last_face = facing;
}

if choice == "top" && A
{
	choice = "facing";
}

if choice == "facing" && A
{
	var xoffset = 0;
	var yoffset = 0;
	switch facing
	{
		case 0: xoffset=range*unit*-1;
		case 1: yoffset=range*unit*-1;
		case 2: xoffset=range*unit*1;
		case 3: yoffset=range*unit*1;
	}
	if place_meeting(target_x+xoffset,target_y+yoffset,enemy)
	{
		if list[highlight,1]<2 //steal or swap skill
		{
			var targe = instance_place(target_x+xoffset,target_y+yoffset,enemy);
			choice="submenu";
			var _menu = instance_create_layer(x+32,y+32,"Instances",menu_);
			_menu.choice = "supermenu";
			_menu.list=targe.skills;
			_menu.list_len=targe.s_total;
			_menu.depth=depth-1;
			_menu.target_x=targe;
		} else {
			//do skill and close window
			if parent == hero
				hero.state="idle";
			instance_destroy(self);
		}
	}
}

if B
{
	if choice == "top"
	{
		if parent == hero
			hero.state="idle";
		instance_destroy(self);
	} else {
		choice = "top";
	}
}