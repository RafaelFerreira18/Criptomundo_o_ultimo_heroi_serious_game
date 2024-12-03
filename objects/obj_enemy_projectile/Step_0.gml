// Movimenta o projétil para frente na direção calculada
x += cos(direction) * speed;
y += sin(direction) * speed;

image_angle += 5;

// Verifica se o projétil atingiu o jogador
if (place_meeting(x, y, obj_player)) {
    obj_player.hp -= 5; // Aplica dano ao jogador
    instance_destroy(); // Destrói o projétil
}

// Se o projétil sair da tela, destrói o projétil
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
