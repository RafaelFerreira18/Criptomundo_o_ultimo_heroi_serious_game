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
text[0] = "Ah, voce... voce me salvou! Eu nao sei como agradecer.";
text[1] = "Eu nunca pensei que veria a liberdade novamente. Fiquei presa tanto tempo, sem esperanca...";
text[2] = "Mas agora... tudo esta diferente. Voce me deu uma nova chance, uma nova vida!";
text[3] = "Eu sei que o caminho sera dificil, mas com a sua ajuda, acredito que posso enfrentar qualquer desafio.";
text[4] = "Eu nunca poderei agradecer o suficiente por tudo o que fez. Voce me libertou da escuridao.";
text[5] = "Com voce, vejo um futuro possivel, um futuro onde o reino pode se reerguer e ser prospero novamente.";
text[6] = "Eu vou lutar ao lado de todos, por um reino justo e livre das sombras que me aprisionaram.";
text[7] = "Agora, posso finalmente respirar novamente... e posso ajudar a restaurar o que foi perdido.";
text[8] = "Eu confio em nos. Juntos, podemos reconstruir tudo o que foi destruido.";


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
