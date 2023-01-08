/// @description Insert description here
// You can write your code in this editor

vortex_direction_x = random_range(-5,5);
vortex_direction_y = random_range(-5,5);

vortex_max_travel = 5000;
vortex_current_traveltime = current_time + vortex_max_travel;

vortex_max_lifetime = 10000;
vortex_current_lifetime = current_time + vortex_max_lifetime;