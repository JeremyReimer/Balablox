/// @description Insert description here
// You can write your code in this editor


if image_index > image_number - 1
{
	// Go through all instances in the Collision layer and delete the one that expired
	var a = layer_get_all_elements("Collision");
	show_debug_message("Searching collider layer to remove collider...");
	
	for (var i = 0; i < array_length(a); i++;)
	{
		//show_debug_message("Checking: " + string(layer_get_element_type(a[i])));
		var layerelement = a[i];
		var inst = layer_instance_get_instance(layerelement);
		//show_debug_message("FOUND COLLIDER AT: " + string(inst.x) + " " + string(inst.y));
		if inst.x == x and inst.y == y
		{
		 instance_destroy(inst);
		 show_debug_message("Destroyed collider!");
		}
	}
	instance_destroy(); // don't forget to get rid of the block itself!
}