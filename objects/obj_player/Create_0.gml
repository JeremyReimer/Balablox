/// @description Create player character

/// Set up player variables

player_direction_x = 0;
player_direction_y = 0;
player_speed = 3;
player_jump_speed = 5;
player_jumping = false;
player_absolute_gravity = 1;
player_gravity = 1;

player_frozen = false;
player_hanging = false;

player_invulnerable = false; // triggers when losing a life
player_invulnerable_timer_max = 5000;
player_invulnerable_timer = 0;

player_powerup = false; // triggers when grabbing a diamond
player_powerup_timer_max = 10000;
player_powerup_timer = 0;
