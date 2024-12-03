// Definir a fonte para o texto "FIM!"
draw_set_font(font2); // Fonte com tamanho 144

// Obter a largura e altura do texto "FIM!"
var text_width = string_width("FIM!");  // Largura do texto
var text_height = string_height("FIM!");  // Altura do texto

// Cor do fundo da caixa (semi-transparente)
draw_set_color(c_black);
draw_rectangle(room_width / 2 - text_width / 2, room_height / 2 - text_height / 2 - 250, 
               room_width / 2 + text_width / 2, room_height / 2 + text_height / 2 - 115, false);  // Caixa sem borda

// Cor da borda da caixa (opcional)
draw_set_color(c_white);
draw_rectangle(room_width / 2 - text_width / 2, room_height / 2 - text_height / 2 - 250, 
               room_width / 2 + text_width / 2, room_height / 2 + text_height / 2 - 115, true); // Borda

// Cor do texto
draw_set_color(c_white);
draw_text(room_width / 2 - text_width / 2 + 20, room_height / 2 - text_height / 2 - 190, "FIM!");
