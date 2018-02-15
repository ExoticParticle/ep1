// Main NPC creation event

// Follow vars
objectToFollow = asset_object;
doFollow = false;
distanceFromObjectToFollow = 0;
minimumDistanceFromObjectToFollow = 20;
maximumDistanceFromObjectToFollow = 30;

// state machines
npcState = 0;
customState = 0;

// Attack Vars
doAttack = false;
hasAttackTargetObject = false;
attackPositionX = 0;
attackPositionY = 0;
attackTargetObject = asset_object;