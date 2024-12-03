if (attack_timer > 0) {
    attack_timer -= 1;
} else {
    instance_destroy(); // Destrói a área de ataque após o tempo
}