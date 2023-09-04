

with (other) // other indicates this specific enemy, if the object_enemy was used instead of other, this would apply to every enemy, making the code less efficient
{
	hp--;
	flash = 3;
	hitFrom = other.direction;
}
instance_destroy();

