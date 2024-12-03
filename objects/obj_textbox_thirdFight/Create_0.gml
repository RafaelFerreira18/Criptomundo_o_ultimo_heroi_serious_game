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
text[0] = "Eu sabia que voce tentaria isso... Nao ha mais volta, irmao.";
text[1] = "Voce nao pode mudar o que ja fizemos! O destino da princesa esta selado, e eu sou o unico que pode controlar isso.";
text[2] = "A porta da gaiola da princesa esta trancada por uma cifra poderosa. So eu sei como decifra-la.";
text[3] = "A senha esta protegida pela Cifra de Atbash. Nao adianta tentar de outra forma.";
text[4] = "a senha codificada e 'KIRMXVHZ'. Voce nao conseguira decifrar.";
text[5] = "A Cifra de Atbash e simples, mas e forte! Basta inverter o alfabeto, e a senha sera revelada.";
text[6] = "Por exemplo, 'O' se torna 'L', 'Z' se torna 'A'. Tente agora!";
text[7] = "Voce pode tentar resolver, mas no final, a princesa ficara onde pertence.";
text[8] = "Faca o que quiser, irmao... Nada vai mudar o destino dela. Eu tenho o controle.";


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
