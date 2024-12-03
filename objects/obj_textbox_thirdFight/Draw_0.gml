if(obj_enemyfinal.enemy_defeated){
	accept_key = keyboard_check_pressed(vk_space)

textbox_x = camera_get_view_x(view_camera[0]- 100);
textbox_y = camera_get_view_y(view_camera[0]) + 568;


function wrap_text(text, line_width) {
    var wrapped_text = "";
    var current_line = "";
    var words = string_split(text, " ");
    
    for (var i = 0; i < array_length(words); i++) {
        var test_line = current_line + words[i] + " ";
        if (string_width(test_line) > line_width) {
            wrapped_text += current_line + "\n";
            current_line = words[i] + " ";
        } else {
            current_line = test_line;
        }
    }
    wrapped_text += current_line;
    return wrapped_text;
}



if setup == false{
	setup = true;
	
	draw_set_font(font1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	page_number = array_length(text);
	
	for(var p = 0; p < page_number; p++){
		text_length[p] = string_length(text[p]);
		
		
		text_x_offset[p] = 0;
	}
	
	
}


if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
	}


if accept_key
	{
		
		if draw_char == text_length[page]
		{
			
			if page < page_number - 1{
				page++;
				draw_char = 0;
			}
			else{
				instance_destroy();
				room_goto(Room8);
			}
		
		}
		else{
			draw_char = text_length[page];
		}
		
	}


txtb_img = txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

// Calcula posições iniciais.
var _text_x = textbox_x + border + 20;
var _text_y = textbox_y + border;

// Ajusta o texto para respeitar a largura da caixa.

var _drawtext = wrap_text(string_copy(text[page], 1, draw_char), line_width);

// Desenha a caixa e o texto.
draw_set_color(c_black);
draw_sprite_ext(txtb_spr, txtb_img, textbox_x, textbox_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, c_white, 1);
draw_set_color(c_white);
draw_text_ext(_text_x, _text_y, _drawtext, line_sep, line_width);


}