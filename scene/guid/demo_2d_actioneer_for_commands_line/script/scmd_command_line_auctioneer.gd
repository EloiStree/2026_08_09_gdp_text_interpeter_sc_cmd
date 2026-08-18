class_name SCMDCommandLineAuctioneer
extends Node


signal on_command_start_processing(line: String)
signal on_command_found_interpreter(line: String, interpreter_node: Node)
signal on_command_not_found_interpreter(line: String)
signal on_command_end_processing(line: String)

@export var _interpreter_bidders: Array[Node]= []

@export var _method_name_able_to_interpret_given_line: String = "is_able_to_interpret_given_command_line"
@export var _method_name_interpret_given_line: String = "interpret_given_command_line"
@export var _leave_when_found_first_interpreter: bool = true

@export var _last_received:String
func push_in_command_line_text(command_line: String) -> void:
	for line in command_line.split("\n"):
		_push_in_line(line)

func _push_in_line(line: String) -> void:
	line = line.strip_edges()
	_process_line_to_bidders(line)

func _process_line_to_bidders(line: String) -> void:
	_last_received=line
	on_command_start_processing.emit(line)
	for bidder in _interpreter_bidders:
		if bidder == null:
			continue
		if bidder.has_method(_method_name_able_to_interpret_given_line):
			var is_able = bidder.call(_method_name_able_to_interpret_given_line, line)
			if is_able and bidder.has_method(_method_name_interpret_given_line):
				bidder.call(_method_name_interpret_given_line, line)
				if _leave_when_found_first_interpreter:
					on_command_found_interpreter.emit(line, bidder)
					on_command_end_processing.emit(line)
					return
	on_command_not_found_interpreter.emit(line)
	on_command_end_processing.emit(line)


func append_interpreter_node(interpreter_node: Node) -> void:
	if interpreter_node == null:
		return
	if _interpreter_bidders.has(interpreter_node):
		return
	if not interpreter_node.has_method(_method_name_able_to_interpret_given_line):
		print("Interpreter node does not have the required method: ", _method_name_able_to_interpret_given_line)
		return
	if not interpreter_node.has_method(_method_name_interpret_given_line):
		print("Interpreter node does not have the required method: ", _method_name_interpret_given_line)
		return
	_interpreter_bidders.append(interpreter_node)
