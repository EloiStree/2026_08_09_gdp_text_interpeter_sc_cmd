class_name SCmdCmdInterpreterRelayToShortcutActioneer
extends SCmdCmdInterpreterAbstractBidderNode


signal on_shortcut_line_to_interpret_found(text_to_interpret: String)

func is_able_to_interpret_given_command_line(line: String) -> bool:
	return line!=null and line.strip_edges().begins_with("sc:")

func interpret_given_command_line(line: String) -> void:
	if not is_able_to_interpret_given_command_line(line):
		return
	var text_to_interpret = line.strip_edges().substr(3, line.strip_edges().length())
	on_shortcut_line_to_interpret_found.emit(text_to_interpret)
