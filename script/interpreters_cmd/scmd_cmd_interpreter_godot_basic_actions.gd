
class_name SCmdCmdInterpreterGodotBasicActions
extends SCmdCmdInterpreterAbstractBidderNode

func is_able_to_interpret_given_command_line(line: String) -> bool:
	return line.begins_with("godot:") 
	

func interpret_given_command_line(line: String) -> void:
	if not is_able_to_interpret_given_command_line(line):
		return

	var text_after: String = line.substr(6).strip_edges()

	if text_after == "":
		return

	if text_after.begins_with("load_scene:"):
		var scene_path: String = text_after.substr(11).strip_edges()
		if scene_path != "":
			get_tree().change_scene(scene_path)
		else:
			push_error("No scene path provided for load_scene command.")
	elif text_after=="reload":
		get_tree().reload_current_scene()
	elif text_after=="fullscreen":
		get_tree().set_screen_fullscreen(not get_tree().is_screen_fullscreen())
	elif text_after=="user":
		## Open user:// folder
		var user_path: String = "user://"
		var dir: DirAccess = DirAccess.open(user_path)
		if dir != null:
			OS.shell_open(dir.get_current_dir())		
	elif text_after=="res":
		## Open res:// folder
		var res_path: String = "res://"
		var dir: DirAccess = DirAccess.open(res_path)
		if dir != null:
			OS.shell_open(dir.get_current_dir())
	elif text_after=="quit" or text_after=="exit":
		get_tree().quit()
	elif text_after=="restart":
		quit_and_relaunch_application()
	else:
		push_error("Unknown command: " + text_after)



func quit_and_relaunch_application() -> void:
	var executable_path: String = OS.get_executable_path()
	var args: Array = OS.get_cmdline_args()
	var command: String = "\"" + executable_path + "\""
	for arg in args:
		command += " \"" + arg + "\""
	OS.execute(command, [])
	get_tree().quit()

#
