class_name SCmdScInterpreterIntegerAction
extends SCmdScInterpreterAbstractBidderNode


signal on_integer_found(integer_value: int)
signal on_integer_found_as_string(integer_value: String)

var _digits: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
func is_char_digit(c: String) -> bool:
	if c in _digits:
		return true
	else:
		return false

func is_able_to_interpret_given_word(word: String) -> bool:
	for c in word:
		if not is_char_digit(c):
			return false
	return true

func interpret_given_word(word: String) -> void:
	var is_valid_integer = is_able_to_interpret_given_word(word)
	if is_valid_integer:
		on_integer_found.emit(int(word))
		on_integer_found_as_string.emit(word)
