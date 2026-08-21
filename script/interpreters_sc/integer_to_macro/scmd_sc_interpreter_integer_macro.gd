
class_name SCmdScInterpreterIntegerToMacro
extends SCmdScInterpreterAbstractBidderNode

signal on_request_to_trigger_command_based_on_integer(integer: int)

@export var _last_integer_to_macro_found:int


func is_able_to_interpret_given_word(word: String) -> bool:
	return word.begins_with("I⌘") or word.begins_with("i⌘")


func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return

	var text_after: String = word.substr(2)
	if is_integer_string(text_after):
		var integer_value: int = int(text_after)
		_last_integer_to_macro_found = integer_value
		on_request_to_trigger_command_based_on_integer.emit(integer_value)


const DIGITS: String = "-0123456789"

func is_string_digit_only(string: String) -> bool:
	for char in string:
		if not DIGITS.contains(char):
			return false
	return true

func is_integer_string(string: String) -> bool:
	for char in string:
		if not DIGITS.contains(char):
			return false
	return true
