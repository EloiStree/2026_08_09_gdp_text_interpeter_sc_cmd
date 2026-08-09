class_name SCmdDelayTextWithUiRangeOfTime
extends Node



signal on_request_to_delay_text(milliseconds: int, text: String)

@export var text_editor_for_text_input: TextEdit
@export var line_editor_milliseconds: LineEdit
@export var line_editor_seconds: LineEdit
@export var line_editor_minutes: LineEdit
@export var submit_button: Button
@export var text_editor_for_log: TextEdit


func _ready() -> void:
	if submit_button != null:
		submit_button.pressed.connect(request_to_delay_text_with_insepector_value)

func request_to_delay_text_with_insepector_value() -> void:
	var milliseconds = int(line_editor_milliseconds.text)
	var seconds = int(line_editor_seconds.text)
	var minutes = int(line_editor_minutes.text)
	var total_milliseconds = milliseconds + (seconds * 1000) + (minutes * 60 * 1000)
	on_request_to_delay_text.emit(total_milliseconds, text_editor_for_text_input.text)
	
func log_received_text(text:String):
	if text_editor_for_log != null:
		text_editor_for_log.text = text + "\n" +text_editor_for_log.text

func log_received_text_with_time(text:String, append_at_milliseconds:int, relayed_at_milliseconds:int):
	if text_editor_for_log != null:
		text_editor_for_log.text = "[" + str(append_at_milliseconds) + " -> " + str(relayed_at_milliseconds) + "] " + text + "\n" + text_editor_for_log.text 
