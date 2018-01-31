// Main NPC step event

switch(npcState)
{
	case 0:
		// npcState 0 - First Frame Setup
		npcState = 10;
		break;
	case 10:
		// npcState 10 - First Frame Setup+
		npcState = 20;
		break;
	case 20:
		// npcState 20 - First Frame Setup
		npcState = 30;
		break;
	case 30:
		// npcState 30 - Run
		break;
	default:
	// Catch the rest
		break;
}