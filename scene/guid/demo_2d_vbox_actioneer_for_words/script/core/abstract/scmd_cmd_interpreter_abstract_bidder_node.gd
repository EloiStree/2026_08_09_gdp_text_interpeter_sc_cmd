## To be an valide interpreter of a line actioneer, you need two methods:
## 1. is_able_to_interpret_given_line(line: String) -> bool
## 2. interpret_given_line(line: String) -> void
class_name SCmdCmdInterpreterAbstractBidderNode
extends Node


func is_able_to_interpret_given_command_line(line: String) -> bool:
	return false

func interpret_given_command_line(line: String) -> void:
	pass
