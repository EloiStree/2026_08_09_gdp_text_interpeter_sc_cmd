class_name ScmdScInterpreterMidi
extends SCmdScInterpreterAbstractBidderNode




signal on_midi_channel_note_velocity_found(channel_0_15: int, note_0_127: int, velocity_0_127: int)
signal on_midi_note_velocity_found(channel_0_15: int, note_0_127: int, velocity_0_127: int)
signal on_midi_controller_velocity_found(controller_0_127: int, value_0_127: int)
signal on_wrong_format_word_found(word: String)


@export var _last_wrong_format_word_found: String = ""

func is_able_to_interpret_given_word(word: String) -> bool:
	return word.begins_with("🎹")


func contains_cnv_pattern(word: String) -> bool:
	return word.find("c") != -1 and word.find("n") != -1 and word.find("v") != -1

func contains_nv_pattern(word: String) -> bool:
	return word.find("n") != -1 and word.find("v") != -1


var _digit_char: String = "0123456789"
func _extract_tagged_value(word: String, tag: String) -> int:
	var tag_index = word.find(tag)
	if tag_index == -1:
		return -1

	var value_start_index = tag_index + 1
	var value_end_index = value_start_index

	while value_end_index < word.length() and word[value_end_index] in _digit_char:
		value_end_index += 1

	if value_start_index == value_end_index:
		return -1

	var value_str = word.substr(value_start_index, value_end_index - value_start_index)
	return int(value_str)





func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return
	word = word.strip_edges().replace("🎹", "")


	if  contains_cnv_pattern(word):
		var channel:int = _extract_tagged_value(word, "c")
		var note:int = _extract_tagged_value(word, "n")
		var velocity:int = _extract_tagged_value(word, "v")

		if channel == -1 or note == -1 or velocity == -1:
			_last_wrong_format_word_found = word
			on_wrong_format_word_found.emit(word)
			return

		on_midi_channel_note_velocity_found.emit(channel, note, velocity)
		return

	if contains_nv_pattern(word):
		var note:int = _extract_tagged_value(word, "n")
		var velocity:int = _extract_tagged_value(word, "v")

		if note == -1 or velocity == -1:
			_last_wrong_format_word_found = word
			on_wrong_format_word_found.emit(word)
			return
		on_midi_note_velocity_found.emit(0, note, velocity)
	elif word.begins_with("-"):
		var note = word.substr(1, word.length() - 1)
		on_midi_note_velocity_found.emit(0, int(note), 0)
	elif word.begins_with("+"):
		var note = word.substr(1, word.length() - 1)
		on_midi_note_velocity_found.emit(0, int(note), 127)
	elif word.begins_with("🎛️"):
		var controller = word.substr(3, word.find("v") - 3)
		var value = word.substr(word.find("v") + 1, word.length() - word.find("v") - 1)
		on_midi_controller_velocity_found.emit(int(controller), int(value))
	else:
		_last_wrong_format_word_found = word
		on_wrong_format_word_found.emit(word)
		

	#'''
	#🎹c9n10v100
	#🎹+10  # press note 10 on channel 1
	#🎹-10  # release note 10 on channel 1
	#🎹🎛️10v100 # Controller knob at 100
	#'''
