/// @description Insert description here
// You can write your code in this editor

dir =-1;
next_dir=irandom(3);
/*
	directions
	0 left
	1 up
	2 right
	3 down
*/
state = "idle";
attention=false;
unit=16;
hp=3;
skills=[];
s_total=2;
skills[0,0]="Slash";
skills[0,1]=3;
skills[1,0]="Bite";
skills[1,1]=4;