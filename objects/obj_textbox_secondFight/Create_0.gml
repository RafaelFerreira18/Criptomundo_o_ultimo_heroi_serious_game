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
text[0] = "Como isso aconteceu? Eu pensei que fosse invencivel!";
text[1] = "Voce esta certo, irmao... nossas acoes tem consequencias. O que estamos fazendo nao e certo.";
text[2] = "Eu... eu nao posso parar agora. Va, finalize isso! Mas antes, enfrente a porta criptografada!";
text[3] = "A porta esta protegida com a Cifra de Vigenere. A simples forca nao vai ajudar dessa vez.";
text[4] = "A senha esta oculta, mas com sua habilidade, voce pode revelar a verdade. A chave e 'CAOS' e a senha codificada e EORAHIQSEAC.";
text[5] = "Para decodificar a senha, use a tabela da Cifra de Vigenere. A chave 'CAOS' sera usada para descobrir a mensagem.";
text[6] = "Para ler a tabela, siga este procedimento: para cada letra da senha codificada, encontre a letra correspondente na linha da chave 'CAOS'.";
text[7] = "Por exemplo, para a primeira letra da senha 'E', localize 'C' na chave 'CAOS'. Na intersecao da linha de 'C' e a coluna de 'E', estara a letra decodificada.";
text[8] = "Continue esse processo para todas as letras. Use sua habilidade e deducao para resolver o enigma!";
text[9] = "Boa sorte, irmao... Voce tera que enfrentar os maiores desafios agora.";

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
