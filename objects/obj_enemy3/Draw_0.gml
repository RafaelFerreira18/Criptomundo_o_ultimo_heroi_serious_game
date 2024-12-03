// Desenha o sprite do inimigo (se houver)
draw_self();

// Desenha a barra de vida do inimigo
var hp_percentage = hp / max_hp;  // Calcula a porcentagem de vida
var bar_width = 80;  // Largura da barra (em pixels)
var bar_height = 8;  // Altura da barra (em pixels)

// Cor da barra (verde para a vida, vermelho para falta de vida)
draw_set_color(c_red);
draw_rectangle(x - bar_width / 2, y - 30, x + bar_width / 2, y - 30 + bar_height, false);  // Desenha a borda da barra

draw_set_color(c_green);
draw_rectangle(x - bar_width / 2, y - 30, x - bar_width / 2 + (bar_width * hp_percentage), y - 30 + bar_height, false);  // Desenha o preenchimento da barra de vida
