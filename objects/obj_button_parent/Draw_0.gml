draw_self();

draw_set_font(font1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var text_x = x + sprite_width / 2;
var text_y = y + sprite_height / 2 - 5;


draw_set_color(c_white);
draw_text(text_x, text_y, button_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);