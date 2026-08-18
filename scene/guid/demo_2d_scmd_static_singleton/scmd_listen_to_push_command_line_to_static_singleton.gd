class_name SCmdListenToPushCommandLineToStaticSingleton
extends Node


signal on_command_line_to_interpret(command_line: String)

@export var _last_received_command_line: String = ""

func _ready() -> void:
	SCmdCommandLineStaticSingletonBridge.add_listener_of_command_line_to_interpret(self._on_received_command_line_to_interpret)

func _on_received_command_line_to_interpret(command_line: String) -> void:
	_last_received_command_line = command_line
	on_command_line_to_interpret.emit(command_line)


func _exit_tree() -> void:
	SCmdCommandLineStaticSingletonBridge.remove_listener_of_command_line_to_interpret(self._on_received_command_line_to_interpret)
