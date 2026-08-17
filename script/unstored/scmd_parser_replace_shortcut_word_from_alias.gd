class_name ScmdParserReplaceShortcutWordFromAlias
extends Node


signal on_parsed_text_with_replace_alias(text: String)


@export var _alias_to_replace_value: Dictionary[String, String] = {}


func push_in_to_replace_shortcut_word_from_alias(text: String) -> void:
	if text == null:
		return
	var words: PackedStringArray = text.split(" ")
	for i in range(words.size()):
		var word: String = words[i]
		if _alias_to_replace_value.has(word):
			words[i] = _alias_to_replace_value[word]
	on_parsed_text_with_replace_alias.emit(" ".join(words))


func set_alias_to_value(alias: String, value: String) -> void:
	_alias_to_replace_value[alias] = value


func has_alias_to_value(alias: String) -> bool:
	return _alias_to_replace_value.has(alias)

func get_alias_to_value(alias: String) -> String:
	if _alias_to_replace_value.has(alias):
		return _alias_to_replace_value[alias]
	return ""
