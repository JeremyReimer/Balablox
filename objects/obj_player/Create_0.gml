/// @description Create player character

/// Set up player variables

player_direction_x = 0;
player_direction_y = 0;
player_accelerating = false; // when you start or stop moving, there's a small acceleration period
player_decelerating = false; // same with deceleration
player_acceleration_rate = 0.2;
player_deceleration_rate = 0.1;
player_speed = 0;
player_speed_max = 3;
player_jump_speed = 5.4;
player_jumping = false;
player_absolute_gravity = 1;
player_gravity = 1.5;

player_frozen = false;
player_hanging = false;

player_invulnerable = false; // triggers when losing a life
player_invulnerable_timer_max = 5000;
player_invulnerable_timer = 0;

player_powerup = false; // triggers when grabbing a diamond
player_powerup_timer_max = 10000;
player_powerup_timer = 0;

// stop animation
image_speed = 0;