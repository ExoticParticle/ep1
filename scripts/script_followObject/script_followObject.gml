// Needs objectToFollow, distanceFromObjectToFollow, minimumFollowDistance, maximumFollowDistance, doFollow

if(distance_to_object(objectToFollow) > maximumDistanceFromObjectToFollow)
{
	// Farther away from object than allowed, do follow	
	doFollow = true;
}
else if(distance_to_object(objectToFollow) < minimumDistanceFromObjectToFollow)
{
	// Too Close To Object, just stop	
		move_towards_point(objectToFollow.x, objectToFollow.y, 0);
	doFollow = false;
}
else
{
	// in-between min and max volumes, do nothing
}

if(doFollow)
{
	move_towards_point(objectToFollow.x, objectToFollow.y, move_speed);
}
