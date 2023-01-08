/// @description Insert description here
// You can write your code in this editor

enemy_speed = 0.4;
enemy_behavior = 2; // default is to chase the player, 2 is to move randomly
enemy_countdown_min = 100;  // minimum time enemy can move in a random direction
enemy_countdown_max = 100; // for resetting enemy countdown
enemy_countdown = 100; // default countdown until changing behavior
enemy_random = 0.2; // 80% chance of changing to random move
enemy_random_direction = 1; // default random direction
enemy_special_move_chance = 1; // percent chance that enemy will do special move
enemy_try_special_move = 0; // whether or not the enemy will try a special move

dragon_max_roar = 500;
dragon_current_roar = current_time + dragon_max_roar;

image_speed = 0; // animation speed, we'll manually change frames for some things
dragon_hit_points = 20; // hit points