keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);

var moveDirection = keyRight - keyLeft;


horizontalSpeed = moveDirection * walkSpeed;
verticalSpeed = verticalSpeed + grav;



if(place_meeting(x, y + 1, objWall) && (keyJump)) {
	verticalSpeed = jumpSpeed;
}

// Horizontal collision
if (place_meeting(x + horizontalSpeed, y, objWall)) {
	while(!place_meeting(x + sign(horizontalSpeed), y, objWall)) {
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}

x = x + horizontalSpeed;

// Vertical collision
if (place_meeting(x, y + verticalSpeed, objWall)) {
	while(!place_meeting(x, y + sign(verticalSpeed), objWall)) {
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;