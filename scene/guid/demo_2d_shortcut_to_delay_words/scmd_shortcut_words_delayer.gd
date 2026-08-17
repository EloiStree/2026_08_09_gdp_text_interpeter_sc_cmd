class_name SCmdShortcutWordsDelayer
extends Node

signal on_word_ready_to_be_interpreted(word: String)

@export var _text_delayer: SCmdTextDelayer

func _ready() -> void:
	if _text_delayer != null:
			_text_delayer.on_text_ready_to_be_relayed.connect(self.push_in_text_to_split_and_delay)

func _on_received_delay_word(word: String) -> void:
	on_word_ready_to_be_interpreted.emit(word)

func push_in_text_to_split_and_delay(text: String) -> void:
	var relative_delay :int = 0
	var words := text.split(" ")
	for word in words:
		if can_interpret_word(word):
			relative_delay += get_milliseconds_in(word)
		else:
			if relative_delay > 0:
				_text_delayer.append_text_to_be_delayed_of_milliseconds(relative_delay,word)
			else:
				on_word_ready_to_be_interpreted.emit(word)



var _digits: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func is_char_digit(c: String) -> bool:
	return c in _digits

func can_interpret_word(word: String) -> bool:
	if word.ends_with(">"):
		# 860>
		var number := word.substr(0, word.length() - 1)
		for c in number:
			if not is_char_digit(c):
				return false
		return true

	if word.begins_with("⌛"):
		# ⌛546
		var number := word.substr(1)
		for c in number:
			if not is_char_digit(c):
				return false
		return true
	return false


func get_milliseconds_in(word: String) -> int:
	if not can_interpret_word(word):
		return 0

	if word.ends_with(">"):
		return int(word.substr(0, word.length() - 1))

	if word.begins_with("⌛"):
		return int(word.substr(1))

	return 0
