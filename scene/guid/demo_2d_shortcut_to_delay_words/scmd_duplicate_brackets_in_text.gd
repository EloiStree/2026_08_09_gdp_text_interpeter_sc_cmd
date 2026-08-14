class_name SCmdDuplicateBracketsInText
extends Node

signal on_parsed_text_emitted(text: String)

@export_multiline var _last_text_received: String = ""
@export_multiline var _last_text_spaced: String = ""
@export_multiline var _last_text_parsed: String = ""


func parse_text_then_emit(text: String) -> void:
	_last_text_received = text
	var parsed_text := _duplicate_round_brackets_in_text(text)
	_last_text_parsed = parsed_text
	on_parsed_text_emitted.emit(parsed_text)

var _regex_of_bracket: String = r"\(([^()]+)\)x(\d+)"

## Collapse all whitespace runs (including newlines) into single spaces.
func _normalize_whitespace(text: String) -> String:
	var t := text.strip_edges()
	# FIX: replace newlines with spaces, NOT delete them
	t = t.replace("\r", " ").replace("\n", " ")
	while t.find("  ") > -1:
		t = t.replace("  ", " ")
	return t


func _duplicate_round_brackets_in_text(text: String) -> String:

	# Normalize whitespace once
	var t := _normalize_whitespace(text)
	t = t.replace(" ) x", " )x") 
	_last_text_spaced = t

	var regex := RegEx.new()
	var err := regex.compile(_regex_of_bracket)
	if err != OK:
		push_error("Failed to compile regex: %s" % _regex_of_bracket)
		return t

	var anti_loop := 100
	while anti_loop > 0:
		var result := regex.search(t)
		if result == null:
			break

		var in_bracket_text: String = result.get_string(1)
		var times: int = int(result.get_string(2))

		# Repeat the captured text N times (clamped to >= 0)
		var duplicated_text := in_bracket_text.repeat(maxi(times, 0))

		t = t.substr(0, result.get_start()) + duplicated_text + t.substr(result.get_end())
		anti_loop -= 1

	if anti_loop <= 0:
		push_warning("Anti-loop limit reached while expanding brackets")

	# FIX: re-normalize whitespace after expansion to clean up doubled spaces
	# caused by repeating strings that have leading/trailing spaces
	t = _normalize_whitespace(t)

	return t
