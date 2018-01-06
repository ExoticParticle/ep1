if(place_meeting(x,y,TestPlayerObject)) doTeleport = true;
if(doTeleport)
{
	show_debug_message("Beginning Teleport");
	//show_message("Doing Teleport");
	room_goto(roomToTeleportTo);
	
}