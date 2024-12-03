if (hp <= 0) {
    move_x = 0;
    move_y = 0;
    obj_player.move_x = 0;
    obj_player.move_y = 0;
    enemy_defeated = true;
    sprite_index = samurai_hurt;
	exit;
}

// Verifica a existência do jogador
if (instance_exists(obj_player)) {
    var distance = distance_to_object(obj_player);

    if (hurt) {
        // Fugir ou contra-atacar
        if (hurt_timer > 0) {
            hurt_timer--;
            move_x = (x < obj_player.x) ? -move_speed : move_speed; // Fugir
            if (hurt_timer == 15) { // Contra-atacar após fugir brevemente
                if (irandom(1) == 0) {
                    // Investida
                    move_x = (x < obj_player.x) ? move_speed * 2 : -move_speed * 2;
                } else {
                    // Ataque especial (projétil, por exemplo)
                    instance_create_layer(x, y, "Instances", obj_enemy_projectile);
                }
            }
        } else {
            hurt = false; // Sai do estado ferido
        }
    } else if (distance < 100) {
        // Ataque corpo a corpo
        if (attack_timer <= 0) {
            sprite_index = samurai_attack; // Troca para a animação de ataque
            image_speed = 1; // Controla a velocidade da animação
            attack_timer = 120; // Tempo entre ataques

            // Dano ao jogador
            obj_player.hp -= 10;
        }
    } else if (distance < 300) {
        // Aproximar-se do jogador
        move_x = (x < obj_player.x) ? move_speed : -move_speed;

        // Ataque à distância
        if (distance > 200 && attack_timer <= 0) {
            instance_create_layer(x, y, "Instances", obj_enemy_projectile);
            attack_timer = 30; // Temporizador para o ataque à distância
        }
    } else {
        // Movimento aleatório
        if (action_timer <= 0) {
            var action = irandom(2);
            if (action == 0) move_x = 0;
            else move_x = (irandom(1) == 0) ? -move_speed : move_speed;
            action_timer = irandom_range(30, 120);
        } else {
            action_timer--;
        }
    }
}

// Atualiza a direção do sprite
if (move_x > 0) {
    image_xscale = 1; // Direção para a direita
} else if (move_x < 0) {
    image_xscale = -1; // Direção para a esquerda
}

// Diminuir temporizadores
if (attack_timer > 0) attack_timer--;
if (action_timer > 0) action_timer--;

// Gravidade (sem usar "gravity" para evitar flutuação)
if (place_meeting(x, y + 2, obj_ground)) {
    move_y = 0; // Se estiver no chão, não há movimento vertical
} else if (move_y < 10) {
    move_y += 1; // Aplica uma gravidade controlada
}

// Movimento e colisão
move_and_collide(move_x, move_y, obj_ground);

// Impede que o inimigo ultrapasse os limites do mapa
var map_left = 0; // Limite esquerdo do mapa
var map_right = room_width; // Limite direito do mapa
var map_top = 0; // Limite superior do mapa
var map_bottom = room_height; // Limite inferior do mapa

if (x < map_left) x = map_left; 
if (x > map_right) x = map_right; 
if (y < map_top) y = map_top; 
if (y > map_bottom) y = map_bottom;

// Reação ao ser atingido por um ataque
if (place_meeting(x, y, obj_attack_area)) {
    hp -= 10; // Diminui a vida ao ser atingido
    hurt = true; // Entra no estado de "ferido"
    hurt_timer = 30; // Define o tempo para "fugir"
}

// Após o ataque, verifica se a animação terminou e retorna ao estado "idle"
if (sprite_index == samurai_attack && image_index >= sprite_get_number(sprite_index) - 1) {
    state = "idle"; // Retorna para o estado "idle"
    sprite_index = samurai_idle; // Retorna para o sprite de idle
    image_speed = 1; // Define a velocidade da animação para idle
}