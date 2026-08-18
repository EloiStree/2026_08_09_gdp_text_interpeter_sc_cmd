class_name SCmdCmdInterpreterPrintLog
extends SCmdCmdInterpreterAbstractBidderNode


signal on_command_line_display_as_in_console_print(text_to_interpret: String)
signal on_command_line_display_as_in_console_print_warning(text_to_interpret: String)
signal on_command_line_display_as_in_console_print_error(text_to_interpret: String)

signal on_command_line_display_as_ui_log(text_to_interpret: String)
signal on_command_line_display_as_ui_log_warning(text_to_interpret: String)
signal on_command_line_display_as_ui_log_error(text_to_interpret: String)


@export var _use_directly_print_to_console: bool = true

@export var _labels_for_log: Array[Label] = []
@export var _labels_for_log_warning: Array[Label] = []
@export var _labels_for_log_error: Array[Label] = []


func is_able_to_interpret_given_command_line(line: String) -> bool:
	return line and line.strip_edges().begins_with("log ") or line.strip_edges().begins_with("print ")

func interpret_given_command_line(line: String) -> void:
	if not is_able_to_interpret_given_command_line(line):
		return

	## if start with log it is for ui
	if line.strip_edges().begins_with("log "):
		var text_to_interpret = line.strip_edges().substr(4).strip_edges()
		if text_to_interpret.begins_with("warning "):
			var warning_text = text_to_interpret.substr(8).strip_edges()
			on_command_line_display_as_ui_log_warning.emit(warning_text)
			for label in _labels_for_log_warning:
				if label:
					label.text = warning_text
		elif text_to_interpret.begins_with("error "):
			var error_text = text_to_interpret.substr(6).strip_edges()
			on_command_line_display_as_ui_log_error.emit(error_text)
			for label in _labels_for_log_error:
				if label:
					label.text = error_text
		else:
			on_command_line_display_as_ui_log.emit(text_to_interpret)
			for label in _labels_for_log:
				if label:
					label.text = text_to_interpret

	## if start with print it is for console
	elif line.strip_edges().begins_with("print "):
		var text_to_interpret = line.strip_edges().substr(6).strip_edges()
		if text_to_interpret.begins_with("warning "):
			var warning_text = text_to_interpret.substr(8).strip_edges()
			if _use_directly_print_to_console:
				print("[WARNING] ", warning_text)
			on_command_line_display_as_in_console_print_warning.emit(warning_text)
		elif text_to_interpret.begins_with("error "):
			var error_text = text_to_interpret.substr(6).strip_edges()
			if _use_directly_print_to_console:
				print("[ERROR] ", error_text)
			on_command_line_display_as_in_console_print_error.emit(error_text)
		else:
			if _use_directly_print_to_console:
				print("[LOG] ", text_to_interpret)
			on_command_line_display_as_in_console_print.emit(text_to_interpret)
	
