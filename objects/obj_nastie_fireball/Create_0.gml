/// @description Insert description here
// You can write your code in this editor

fireball_max_lifetime = 5000;
fireball_current_lifetime = current_time + fireball_max_lifetime;
fireball_current_direction = irandom(1) + 1; // 1 == fly left, 2 == fly right
fireball_speed = 2;
image_speed = 1;