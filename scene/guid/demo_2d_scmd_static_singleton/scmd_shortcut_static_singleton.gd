## Represent a static singleton to transfert text to interpret from any where in the application
class_name SCmdShortcutToStaticSingleton
extends Node

static var _callable_listeners_shortcut_to_interpret: Array[Callable] = []


static func add_listener_to_shortcut_to_interpret(listener: Callable) -> void:
	if listener in _callable_listeners_shortcut_to_interpret:
		return
	_callable_listeners_shortcut_to_interpret.append(listener)

static func remove_listener_to_shortcut_to_interpret(listener: Callable) -> void:
	if listener in _callable_listeners_shortcut_to_interpret:
		_callable_listeners_shortcut_to_interpret.erase(listener)


static func push_in_shortcut_to_interpret(shortcut: String) -> void:
	for listener in _callable_listeners_shortcut_to_interpret:
		listener.call(shortcut)
