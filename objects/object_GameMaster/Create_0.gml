state = 0;
loadLevelTimer = 0.0;
newGameSelected = false;
loadGameSelected = false;
roomIndexToTransitionTo = 0;

playerPositionerLoopIndex = 0;
playerPositionerIndex = 0;
playerPositionerX = 0;
playerPositionerY = 0;

roomLoadState = 0;
doRoomLoad = false;
roomLoadCompleted = false;

// Character Variables
// Active Characters
currentPlayerObject = asset_object;
activePlayerCharacterIndexes[0] = 0;
character_playerMaxine = object_playerMaxine;
activePlayerCharacterIndexes[1] = 1;
character_playerJohn = object_playerJohn;
activePlayerCharacterIndexes[2] = 2;
character_playerLiam = object_playerLiam;

changeCharacterState = 0;
changeCharacterTimer = 0;
character_selectedCharacterIndex = 0;
character_previousSelectedCharacterIndex = 0;
character_lastSelectibleCharacterIndex = 2;

doPlayerCharacterChange = false;