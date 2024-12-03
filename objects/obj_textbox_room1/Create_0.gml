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
page_number = 4; // Total de páginas (ajuste para refletir o número correto).
text[0] = "Acorde... Voce e nossa ultima esperanca. O mundo esta em ruinas, dominado pelo caos dos cavaleiros da criptografia.";
text[1] = " Voce deve enfrenta-los, resolver os enigmas deixados por eles e salvar o reino. Mas tome cuidado... ha coisas sobre voce que nem mesmo voce sabe.";
text[2] = "Primeiro voce deve lembrar o que e a criptografia e como ela funciona...";
text[3] = "Criptografia e a arte de transformar mensagens em codigos, para que apenas aqueles com a chave certas possam entender. Pense nisso como um cadeado em uma porta: sem a chave, voce nao consegue abrir.";
text[4] = "Aqui esta um exemplo simples: imagine que voce quer dizer 'ABRA', mas nao quer que qualquer um entenda. Com uma cifra de Cesar, voce pode deslocar as letras do alfabeto... ";
text[5] = "Com uma cifra de Cesar, voce pode deslocar as letras do alfabeto. Se voce deslocar tres casas, 'A' vira 'D', 'B' vira 'E', e assim por diante...";
text[6] = "A mensagem codificada seria 'DEUD'. Para ler a mensagem, e necessario saber que o deslocamento foi de tres casas.";
text[7] = "Isso e a criptografia, derrote seus irmaos e salve sua princesa usando a criptografia.";
text[8] = "Cada cavaleiro usou um tipo diferente de criptografia para proteger as senhas. Comecaremos com algo simples, mas, a medida que voce avanca...";
text[9] = "Os desafios serao mais dificeis. Prepare-se para pensar, heroi.";


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
