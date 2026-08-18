class_name SCmdListenToPushShortcutToStaticSingleton
extends Node


signal on_shortcut_to_interpret(shortcut: String)

@export var _last_received_shortcut: String = ""

func _ready() -> void:
	SCmdShortcutStaticSingletonBridge.add_listener_of_shortcut_to_interpret(self._on_received_shortcut_to_interpret)

func _on_received_shortcut_to_interpret(shortcut: String) -> void:
	_last_received_shortcut = shortcut
	on_shortcut_to_interpret.emit(shortcut)

func _exit_tree() -> void:
	SCmdShortcutStaticSingletonBridge.remove_listener_of_shortcut_to_interpret(self._on_received_shortcut_to_interpret)
