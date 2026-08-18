class_name SCmdCmdInterpreterInTimeDelayer
extends SCmdCmdInterpreterAbstractBidderNode


signal on_command_line_to_delay_found(milliseconds_to_delay: int,text_to_interpret: String)

func is_able_to_interpret_given_command_line(line: String) -> bool:
	return line and line.strip_edges().begins_with("in ") and line.find(":") > 3


const _DIGITS: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
func is_char_digit(c: String) -> bool:
	if c in _DIGITS:
		return true
	else:
		return false
func is_integer_string(s: String) -> bool:
	for c in s:
		if not is_char_digit(c):
			return false
	return true

func interpret_given_command_line(line: String) -> void:
	if not is_able_to_interpret_given_command_line(line):
		return
	var text_to_interpret = line.strip_edges().substr(3, line.strip_edges().length())
	var first_colon_index = text_to_interpret.find(":")
	var left_part = text_to_interpret.substr(0, first_colon_index).strip_edges()
	var right_part = text_to_interpret.substr(first_colon_index + 1, text_to_interpret.length()).strip_edges()

	if is_integer_string(left_part):
		var milliseconds_to_delay = int(left_part)
		on_command_line_to_delay_found.emit(milliseconds_to_delay,right_part)
	else:
		var milliseconds_to_delay = _handle_delay_with_parameters(left_part)
		on_command_line_to_delay_found.emit(milliseconds_to_delay,right_part)
	

func _handle_delay_with_parameters(text_to_interpret: String) -> int:
	var milliseconds_to_delay = 0
	# Code later
#     if left_part.find("m") > 0:
#         # Code later
#         pass
#     elif left_part.find("s") > 0:
#         # Code later
#         pass
#     elif left_part.find("ms") > 0:
#         # Code later
#         pass


	return milliseconds_to_delay
