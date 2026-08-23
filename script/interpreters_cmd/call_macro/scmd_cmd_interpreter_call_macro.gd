
class_name SCmdCmdInterpreterCallMacro
extends SCmdCmdInterpreterAbstractBidderNode



signal on_call_macro_request(macro_name: String)

@export var _last_call_macro_request_name: String

func is_able_to_interpret_given_command_line(word: String) -> bool:	
	return word.to_lower().begins_with("macro:")

func interpret_given_command_line(word: String) -> void:
	if not is_able_to_interpret_given_command_line(word):
		return

	var text_after_tag: String = word.substr(6, word.length() - 6)
	if text_after_tag.length() == 0:
		return
	on_call_macro_request.emit(text_after_tag)
	_last_call_macro_request_name = text_after_tag
