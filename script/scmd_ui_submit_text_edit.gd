class_name SCmdUiSubmitTextEdit
extends Node

signal on_text_edit_submit(text:String)
signal on_text_edit_text_changed(text:String)
signal on_submit_button_pressed(text:String)
signal on_text_edit_any_action(text:String)

@export var text_edit:TextEdit
@export var submit_button:Button


func _ready():
	if text_edit:
		text_edit.connect("text_changed", Callable(self, "_on_text_edit_text_changed"))
		
	if submit_button:
		submit_button.connect("pressed", Callable(self, "_on_submit_button_pressed"))

func _on_text_edit_gui_input(event:InputEvent):
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_ENTER and not event.shift_pressed:
		_on_text_edit_submit(text_edit.text)
	
func _on_text_edit_text_changed(new_text:String):
	on_text_edit_text_changed.emit(new_text)
	on_text_edit_any_action.emit(new_text)

func _on_text_edit_submit(submitted_text:String):
	on_text_edit_submit.emit(submitted_text)
	on_text_edit_any_action.emit(submitted_text)

func _on_submit_button_pressed():
	if text_edit:
		var text = text_edit.text
		on_submit_button_pressed.emit(text)
		on_text_edit_any_action.emit(text)
