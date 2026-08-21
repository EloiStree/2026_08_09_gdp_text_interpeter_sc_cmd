
class_name SCmdCmdInterpreterBooleanRegister
extends SCmdCmdInterpreterAbstractBidderNode


signal on_set_boolean_to_value_from_name(boolean_name: String, value: bool)
signal on_toggle_boolean_from_name(boolean_name: String)

@export var _last_set_request_name: String
@export var _last_set_request_value:bool
@export var _last_toogle_request_name: String

func is_able_to_interpret_given_command_line(line: String) -> bool:
	return line.begins_with("bool:")
	

func interpret_given_command_line(line: String) -> void:
	if not is_able_to_interpret_given_command_line(line):
		return

	var text_after: String = line.substr(5).to_lower()
	var split_text: Array = text_after.split(":")
	var size: int = len(split_text)
	if size == 1:
	## Toggle the boolean value
		on_toggle_boolean_from_name.emit(split_text[0])
		_last_toogle_request_name = split_text[0]
	elif size == 2 and is_true_or_false_string(split_text[1]):
		var boolean_value: bool = is_true_string(split_text[1])
		on_set_boolean_to_value_from_name.emit(split_text[0], boolean_value)
		_last_set_request_name = split_text[0]
		_last_set_request_value = boolean_value


func is_true_string(string: String) -> bool:
	return TRUE_STRINGS.has(string.to_lower())

func is_false_string(string: String) -> bool:
	return FALSE_STRINGS.has(string.to_lower())

func is_true_or_false_string(string: String) -> bool:
	return is_true_string(string) or is_false_string(string)

const TRUE_STRINGS: Array = ["true", "1", "yes", "on"]
const FALSE_STRINGS: Array = ["false", "0", "no", "off"]
