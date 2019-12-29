/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(defont);

for (var i=0; i<list_len; i++)
{
	if i==highlight
	{
		draw_set_color(c_black);
		draw_sprite(menu_highlight,0,x,y +i*16);
	}
	draw_text(x+3,y-sprite_height+i*16,list[i,0]);
	draw_set_color(c_white);
}

if choice == "facing"
{
	switch facing
	{
		case 0: draw_sprite(sel_target,0,target_x-range*unit,target_y); break;
		case 1: draw_sprite(sel_target,0,target_x,target_y-range*unit); break;
		case 2: draw_sprite(sel_target,0,target_x+range*unit,target_y); break;
		case 3: draw_sprite(sel_target,0,target_x,target_y+range*unit); break;
	}
}

draw_text(100,20,parent);