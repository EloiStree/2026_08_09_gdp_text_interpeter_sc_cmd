class_name SCmdScInterpreterIndexIntegerAction
extends SCmdScInterpreterAbstractBidderNode


signal on_index_integer_found(index: int, integer_value: int)
signal on_index_integer_found_as_string(integer_value: String)


func is_able_to_interpret_given_word(word: String) -> bool:
	var splits = word.split("|")
	if splits.size() != 2:
		return false
	if not is_integer(splits[0]):
		return false
	if not is_integer(splits[1]):
		return false
	return true

func interpret_given_word(word: String) -> void:
	var is_valid_integer = is_able_to_interpret_given_word(word)
	if is_valid_integer:
		var splits = word.split("|")
		var index = splits[0].to_int()
		var value = splits[1].to_int()
		on_index_integer_found.emit(index, value)
		on_index_integer_found_as_string.emit(word)


const DIGITS: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-"]

func is_digit(text: String) -> bool:
	if text.length() == 1:
		var c = text[0]
		return c in DIGITS
	else:
		return false

func is_integer(text: String) -> bool:
	if text.length() == 0:
		return false
	for c in text:
		if not is_digit(c):
			return false
	return true
