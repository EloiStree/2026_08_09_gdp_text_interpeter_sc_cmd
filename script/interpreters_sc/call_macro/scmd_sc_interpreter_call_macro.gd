
class_name SCmdScInterpreterCallMacro
extends SCmdScInterpreterAbstractBidderNode


signal on_call_aa_macro_request(macro_name: String)
signal on_call_text_macro_request(macro_name: String)
signal on_call_unicode_macro_request(macro_name: String)
signal on_call_integer_macro_request(macro_name: String)

@export var _last_call_macro_request_name: String

func is_able_to_interpret_given_word(word: String) -> bool:	
	word = word.to_lower()
	return word.begins_with("⌘") or word.begins_with("i⌘") or word.begins_with("u⌘")or word.begins_with("c⌘")


func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return	
	var word_low = word.to_lower()
	if word_low.begins_with("⌘"):
		var text_after_tag: String = word.substr(1, word.length() - 1)
		if text_after_tag.length() == 0:
			return
		on_call_text_macro_request.emit(text_after_tag)
		_last_call_macro_request_name = text_after_tag
	elif word_low.begins_with("i⌘"):
		var text_after_tag: String = word.substr(2, word.length() - 2)
		if text_after_tag.length() == 0:
			return
		on_call_integer_macro_request.emit(text_after_tag)
		_last_call_macro_request_name = text_after_tag
	elif word_low.begins_with("u⌘"):
		var text_after_tag: String = word.substr(2, word.length() - 2)
		if text_after_tag.length() == 0:
			return
		on_call_unicode_macro_request.emit(text_after_tag)
		_last_call_macro_request_name = text_after_tag
	elif word_low.begins_with("c⌘"):
		var text_after_tag: String = word.substr(2, word.length() - 2)
		if text_after_tag.length() == 0:
			return
		on_call_aa_macro_request.emit(text_after_tag)
		_last_call_macro_request_name = text_after_tag
