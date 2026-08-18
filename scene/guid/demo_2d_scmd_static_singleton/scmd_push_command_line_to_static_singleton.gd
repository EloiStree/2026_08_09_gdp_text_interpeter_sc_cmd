class_name SCmdPushCommandLineToStaticSingleton
extends Node


signal on_command_line_to_interpret(command_line: String)

@export var _last_pushed_command_line: String = ""

func push_command_line_to_static_singleton(command_line: String) -> void:
	SCmdCommandLineStaticSingletonBridge.push_in_command_line_to_interpret(command_line)
	_last_pushed_command_line = command_line
	on_command_line_to_interpret.emit(command_line)
