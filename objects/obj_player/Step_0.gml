if (hp <= 0){
	room_goto(Menu1);
}
else{

}

// MOVIMENTO HORIZONTAL
move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_x = move_x * move_speed;

// Se não estiver atacando, coloca animação de caminhada
if ((keyboard_check(ord("D")) || keyboard_check(ord("A"))) && !attacking) {
    sprite_index = spr_walk;
    image_speed = 0.2;
} else if (!attacking) { // Se não estiver atacando, coloca animação idle
    sprite_index = spr_idle;
    image_speed = 0;
}

// Direção da imagem (espelhamento)
if (keyboard_check(ord("D"))) {
    image_xscale = 1; // Normal
} else if (keyboard_check(ord("A"))) {
    image_xscale = -1; // Espelhado
}

// GRAVIDADE E PULO
if (place_meeting(x, y + 2, obj_ground) && !attacking) {
    move_y = 0;  // Só aplica a gravidade se não estiver atacando
    if (keyboard_check(vk_space)) move_y = -jump_speed;
} else if (move_y < 10) {
    move_y += 1; // Aplicando gravidade
}

// MOVIMENTO E COLISÃO (usando move_and_collide)
if (!attacking) {
    move_and_collide(move_x, move_y, obj_ground); // Movimento do jogador com colisão
}

// ATAQUE
if (mouse_check_button_pressed(mb_left) && !attacking) {
    attacking = true;
    sprite_index = spr_attack; // Muda para o sprite de ataque
    image_index = 0; // Reinicia a animação de ataque
    image_speed = 0.4; // Define a velocidade da animação
    damage_applied = false; // Resetando o controle de dano
}

// DETECTAR INIMIGOS DURANTE O ATAQUE
if (attacking && sprite_index == spr_attack) {
    if (!damage_applied) {
        var hit = instance_place(x + (image_xscale * 16), y, obj_enemy1);
		if (!hit) hit = instance_place(x + (image_xscale * 16), y, obj_enemy2);
		if (!hit) hit = instance_place(x + (image_xscale * 16), y, obj_enemy3);
		if (!hit) hit = instance_place(x + (image_xscale * 16), y, obj_enemyfinal);// Substitua pelo nome correto do inimigo
        if (hit != noone) {
            hit.hp -= 10; // Aplica dano ao inimigo
            hit.hurt = true; // Feedback visual ou lógico (opcional)
            damage_applied = true; // Marca que o dano foi aplicado
        }
    }
}

// FINALIZAR O ATAQUE
if (attacking && sprite_index == spr_attack && image_index >= image_number - 1) {
    attacking = false; // Termina o ataque
    sprite_index = spr_idle; // Retorna para o sprite parado
    image_speed = 0;
}

// MOVIMENTO APÓS O ATAQUE
if (!attacking && (keyboard_check(ord("D")) || keyboard_check(ord("A")))) {
    sprite_index = spr_walk;  // Muda para o sprite de caminhada
    image_speed = 0.2;
}
