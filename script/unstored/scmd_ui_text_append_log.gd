class_name SCmdUiTextAppendLog
extends Node

signal on_log_text_changed(text: String)

@export var _log_as_text:String = ""

@export_group("UI to change")
@export var _labels: Array[Label] = []
@export var _text_editors: Array[TextEdit] = []


func clear_log() -> void:
	_log_as_text = ""
	_notify_changed()

func append_text_top_to_log(text: String) -> void:
	_log_as_text = text + _log_as_text
	_notify_changed()

func append_text_bottom_to_log(text: String) -> void:
	_log_as_text = _log_as_text + text
	_notify_changed()


func _notify_changed() -> void:
	on_log_text_changed.emit(_log_as_text)
	for label in _labels:
		if label != null:
			label.text = _log_as_text
	for text_editor in _text_editors:
		if text_editor != null:
			text_editor.text = _log_as_text
