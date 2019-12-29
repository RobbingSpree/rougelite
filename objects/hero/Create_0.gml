/// @description Setup
draw_set_font(defont);

health=6;
unit=16;
state="idle";
last_dir = 0;
actions=2;
max_actions=2;
menu = noone;

skills = [];
s_total = 3;
skills[0,0]="Steal"; //skill name
skills[0,1]=0; //skill index
skills[1,0]="Swap";
skills[1,1]=1;
skills[2,0]="Forget";
skills[2,1]=2;