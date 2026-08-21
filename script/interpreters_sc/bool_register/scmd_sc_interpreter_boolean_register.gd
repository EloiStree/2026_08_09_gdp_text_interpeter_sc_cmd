
class_name SCmdScInterpreterBooleanRegister
extends SCmdScInterpreterAbstractBidderNode


signal on_set_boolean_to_value_from_name(boolean_name: String, value: bool)
signal on_toggle_boolean_from_name(boolean_name: String)

@export var _last_set_request_name: String
@export var _last_set_request_value:bool
@export var _last_toogle_request_name: String


func is_able_to_interpret_given_word(word: String) -> bool:
	return is_starting_with_tag_and_only_alphanumeric_chars(word)

func interpret_given_word(word: String) -> void:
	var split_result: Array = split_in_two_tag_and_name(word)
	var tag: String = split_result[0]
	var name: String = split_result[1]
	print("TAG: ", tag, " NAME: ", name)
	if TAG_SET_TRUE.has(tag):
		_last_set_request_name = name
		_last_set_request_value = true
		on_set_boolean_to_value_from_name.emit(name, true)
	elif TAG_SET_FALSE.has(tag):
		_last_set_request_name = name
		_last_set_request_value = false
		on_set_boolean_to_value_from_name.emit(name, false)
	elif TAG_TOGGLE.has(tag):
		_last_toogle_request_name = name
		on_toggle_boolean_from_name.emit(name)


func is_true_string(string: String) -> bool:
	return TRUE_STRINGS.has(string.to_lower())

func is_false_string(string: String) -> bool:
	return FALSE_STRINGS.has(string.to_lower())

func is_true_or_false_string(string: String) -> bool:
	return is_true_string(string) or is_false_string(string)

const TRUE_STRINGS: Array = ["true", "1", "yes", "on"]
const FALSE_STRINGS: Array = ["false", "0", "no", "off"]
const TAG_SET_TRUE: Array = ["☑", "✓", "⬇️", "b1|"]
const TAG_SET_FALSE: Array = ["☐", "✗", "⬆️", "b0|"]
const TAG_TOGGLE: Array = ["☯️", "~", "↕", "b~|"]


const ALPHANUMERIC_CHARS: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"


func is_starting_with_tag_and_only_alphanumeric_chars(string: String) -> bool:
	if not start_with_set_true_tag(string) \
		and not start_with_set_false_tag(string) \
		and not start_with_toggle_tag(string):
		return false

	var split_result: Array = split_in_two_tag_and_name(string)
	var name: String = split_result[1]
	return is_alphanumeric_chars(name)


func start_with_set_true_tag(string: String) -> bool:
	for tag in TAG_SET_TRUE:
		if string.begins_with(tag):
			return true
	return false

func start_with_set_false_tag(string: String) -> bool:
	for tag in TAG_SET_FALSE:
		if string.begins_with(tag):
			return true
	return false

func start_with_toggle_tag(string: String) -> bool:
	for tag in TAG_TOGGLE:
		if string.begins_with(tag):
			return true
	return false

func split_in_two_tag_and_name(string: String) -> Array:
	for tag in TAG_SET_TRUE:
		if string.begins_with(tag):
			return [tag, string.substr(tag.length())]
	for tag in TAG_SET_FALSE:
		if string.begins_with(tag):
			return [tag, string.substr(tag.length())]
	for tag in TAG_TOGGLE:
		if string.begins_with(tag):
			return [tag, string.substr(tag.length())]
	return ["", string]

func is_alphanumeric_chars(string: String) -> bool:
	for char in string:
		if not ALPHANUMERIC_CHARS.contains(char):
			return false
	return true
