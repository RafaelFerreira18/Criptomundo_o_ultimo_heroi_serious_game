if (hp <= 0) {
	move_x = 0;
    move_y = 0;
	obj_player.jump_speed = 0;
	obj_player.move_x = 0;
	obj_player.move_y = 0;
    sprite_index = spr_enemy1_hurt;
    enemy_defeated = true;
}
else{
	if (instance_exists(obj_player)) {
	    var distance = distance_to_object(obj_player);
		if (move_x > 0) {
        image_xscale = 1; // Direção para a direita
		sprite_index = spr_enemy1_walk;
		image_speed = 1;
    } else if (move_x < 0) {
        image_xscale = -1; // Direção para a esquerda
		sprite_index = spr_enemy1_walk;
		image_speed = 1;
	}
	else{
		sprite_index = spr_enemy1_idle;
		image_speed = 0;
	}

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
	        // Ataque corpo a corpo com temporizador
	        if (attack_timer <= 0) {
	            obj_player.hp -= 10;
	            attack_timer = 120; // Tempo entre ataques
	        }
	    } else if (distance < 300) {
	        // Aproximar-se
			if(x < obj_player.x){
				move_x = move_speed;
			}
			else{
				move_x = -move_speed;
			}
	        if (distance > 200 && attack_timer <= 0) {
	            // Ataque à distância
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

	// Diminuir temporizadores
	if (attack_timer > 0) attack_timer--;
	if (action_timer > 0) action_timer--;

	// Gravidade
	if (place_meeting(x, y + 2, obj_ground)) {
	    move_y = 0;
	} else if (move_y < 10) {
	    move_y += 1; // Aplicando gravidade
	}

	// Movimento e colisão
	move_and_collide(move_x, move_y, obj_ground);

	// Reação ao ser atingido
	if (place_meeting(x, y, obj_attack_area)) {
	    hp -= 10;
	    hurt = true;
	    hurt_timer = 30; // Define um tempo breve para a reação
	}
}
