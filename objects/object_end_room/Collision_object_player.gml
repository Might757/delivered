/// @description Move to next room.

with (object_player) 
{
	 if(hascontrol) 
	 {
		hascontrol = false;
		script_slideTrans(TRANS_MODE.GOTO,other.target)
	 }

}


