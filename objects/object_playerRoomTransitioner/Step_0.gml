if(place_meeting(x,y,object_masterPlayerObject)) doTeleport = true;
if(doTeleport)
{
	doTeleport = false;
	with(object_GameMaster)
	{
		if(doRoomLoad == false)
		{

			roomIndexToTransitionTo = other.roomToTeleportTo;
			playerPositionerIndex = other.playerPositionIndexToTeleportTo;
			doRoomLoad = true;
			show_debug_message("Beginning Teleport to room index: " + string(other.roomToTeleportTo) + ", playerPositionIndex: " + string(other.playerPositionIndexToTeleportTo));
		}
	}
}