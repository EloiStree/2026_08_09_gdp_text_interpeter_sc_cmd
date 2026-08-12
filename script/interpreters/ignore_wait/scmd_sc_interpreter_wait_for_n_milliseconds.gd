class_name SCmdScInterpreterWaitForNMilliseconds
extends SCmdScInterpreterAbstractBidderNode

signal on_wait_for_n_milliseconds_found(n_milliseconds: int)

var _digits: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
func is_char_digit(c: String) -> bool:
	if c in _digits:
		return true
	else:
		return false

func is_able_to_interpret_given_word(word: String) -> bool:
	if not word.ends_with(">"):
		return false
	for c in word.substr(0, word.length() - 1):
		if not is_char_digit(c):
			return false
	return true

func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return
	var milliseconds = int(word.substr(0, word.length() - 1))
	on_wait_for_n_milliseconds_found.emit(milliseconds)
	
