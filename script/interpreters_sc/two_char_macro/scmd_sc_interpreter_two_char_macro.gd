
class_name SCmdScInterpreterTwoCharMacro
extends SCmdScInterpreterAbstractBidderNode


signal on_request_of_one_char_command(one_char: int)
signal on_request_of_two_char_command(left_char: int, right_char: int)

@export var _last_found_one_char_command:String
@export var _last_found_two_char_command:String

func is_able_to_interpret_given_word(word: String) -> bool:
	return word.begins_with("C⌘") or word.begins_with("c⌘")


func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return

	var text_after: String = word.substr(2)

	if len(text_after) == 1:
		on_request_of_one_char_command.emit(text_after.unicode_at(0))
		_last_found_one_char_command= text_after

	elif len(text_after) == 2:
		on_request_of_two_char_command.emit(
			text_after.unicode_at(0),
			text_after.unicode_at(1)
		)
		_last_found_two_char_command= text_after

	
