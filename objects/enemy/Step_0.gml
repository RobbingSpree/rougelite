/// @description Insert description here
// You can write your code in this editor

if state == "action"
{
	if abs(hero.x-x)<8*unit && abs(hero.y-y)<8*unit
	{
		var disx = hero.x-x;
		var disy = hero.y-y;
		if abs(disx) < abs(disy) || disy == 0
		{
			x+=unit*sign(disx);
		} else {
			y+=unit*sign(disy);
		}
		attention=true;
	} else {
		dir = next_dir;
		switch dir
		{
			case 0: x-=unit; break;//left
			case 1: y-=unit; break;//up
			case 2: x+=unit; break;//right
			case 3: y+=unit; break;//down
			case -1: break;
		}
		attention=false;
	}
	state = "changing";
}

if state== "changing"
{
	dir =-1;
	next_dir=irandom(3);
	state="idle";
}