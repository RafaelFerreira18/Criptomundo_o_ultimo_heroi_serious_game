depth = -9999;

textbox_width = 1366;
textbox_height = 200;
border = 8;
line_sep = 44;
line_width = textbox_width - border * 2; // Corrige o cálculo do limite do texto.

txtb_spr = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6 / 60;

page = 0;
text[0] = "Nao pode ser, como eu perdi?";
text[1] = "Voce esta certo, irmao, o que estamos fazendo nao e correto...";
text[2] = "Va e acabe com isso, irmao, mas primeiro voce precisa passar pela porta criptografada!";
text[3] = "A porta foi criptografada usando a Cifra de Ceasar, a forca bruta nao vai funcionar nela";
text[4] = "Use seu poder da criptografia para abrir ela, a senha codificada e FULSWRJUDILD";
text[5] = "Olhe para o passado. Recuar tres passos no alfabeto revelara a verdade!";
text[6] = "Boa sorte, irmao...";
page_number = array_length(text); // Atualize para o número correto de páginas


text_length = []; 
text_x_offset = [];

// Inicializa os comprimentos do texto e deslocamentos para cada página.
for (var i = 0; i < page_number; i++) {
    text_length[i] = string_length(text[i]);
    text_x_offset[i] = 44; // Padrão para deslocamento horizontal.
}

draw_char = 0;
text_spd = 2; // Velocidade ajustada.

setup = false;
