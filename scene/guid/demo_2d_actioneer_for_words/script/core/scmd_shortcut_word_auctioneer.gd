
## The aim of the class is to give to the good interpreter the word to interpret.
class_name SCmdShortcutWordAuctioneer
extends Node


signal on_word_start_processing(word: String)
signal on_word_found_interpreter(word: String, interpreter_node: Node)
signal on_word_not_found_interpreter(word: String)
signal on_word_end_processing(word: String)

@export var _interpreter_bidders: Array[Node]= []
@export var _method_name_able_to_interpret_given_word: String = "is_able_to_interpret_given_word"
@export var _method_name_interpret_given_word: String = "interpret_given_word"
@export var _leave_when_found_first_interpreter: bool = true

func push_in_shortcut_text(text: String) -> void:
	for line in text.split("\n"):
		_push_in_line(line)

func _push_in_line(line: String) -> void:
	line = line.strip_edges()
	while line.find("  ")>-1:
		line = line.replace("  "," ")

	var words = line.split(" ")
	for word in words:
		if word == "":
			continue
		_process_word_to_bidders(word)

func _process_word_to_bidders(word: String) -> void:
	on_word_start_processing.emit(word)
	for bidder in _interpreter_bidders:
		if bidder == null:
			continue
		if bidder.has_method(_method_name_able_to_interpret_given_word):
			var is_able = bidder.call(_method_name_able_to_interpret_given_word, word)
			if is_able and bidder.has_method(_method_name_interpret_given_word):
				bidder.call(_method_name_interpret_given_word, word)
				if _leave_when_found_first_interpreter:
					on_word_found_interpreter.emit(word, bidder)
					on_word_end_processing.emit(word)
					return
	on_word_not_found_interpreter.emit(word)
	on_word_end_processing.emit(word)


func append_interpreter_node(interpreter_node: Node) -> void:
	if interpreter_node == null:
		return
	if _interpreter_bidders.has(interpreter_node):
		return
	if not interpreter_node.has_method(_method_name_able_to_interpret_given_word):
		print("Interpreter node does not have the required method: ", _method_name_able_to_interpret_given_word)
		return
	if not interpreter_node.has_method(_method_name_interpret_given_word):
		print("Interpreter node does not have the required method: ", _method_name_interpret_given_word)
		return
	_interpreter_bidders.append(interpreter_node)
