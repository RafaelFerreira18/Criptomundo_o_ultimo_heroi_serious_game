hp = 100;
max_hp = 100;
move_speed = 4;
jump_speed = 16;
move_x = 0;
move_y = 0;

attacking = false; // Estado inicial do ataque
sprite_index = spr_idle; // Sprite inicial (parado)
image_speed = 1; // Velocidade inicial da animação

d = keyboard_check(ord("D"));
a = keyboard_check(ord("A"));

hp = 100; // HP inicial do jogador
player_hurt = false; // Jogador não está invulnerável
hurt_timer = 0; // Timer de invulnerabilidade