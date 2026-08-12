class_name SCmdPushShortcutToStaticSingleton
extends Node


signal on_shortcut_to_interpret(shortcut: String)

@export var _last_pushed_shortcut: String = ""

func push_shortcut_to_static_singleton(shortcut: String) -> void:
	SCmdShortcutToStaticSingleton.push_in_shortcut_to_interpret(shortcut)
	_last_pushed_shortcut = shortcut
	on_shortcut_to_interpret.emit(shortcut)
