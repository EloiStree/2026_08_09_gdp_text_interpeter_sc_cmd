class_name SCmdScDefaultClipboardStorage
extends Node


@export var _clipboard_storage: Dictionary[String, String] = {}
@export var _data_folder_relative_path: String = "user://data/clipboard_storage/"


func _get_file_path(key: String) -> String:
	var base_path = _data_folder_relative_path
	if not base_path.ends_with("/"):
		base_path += "/"
	return base_path + key

func save_in_ram_clipboard_with_key(key:String) -> void:
	if key == "":
		return

	var clipboard_content = DisplayServer.clipboard_get()
	_clipboard_storage[key] = clipboard_content

func load_from_ram_clipboard_from_key(key:String) -> void:
	if key == "":
		return
	if not _clipboard_storage.has(key):
		return

	var clipboard_content = _clipboard_storage[key]
	DisplayServer.clipboard_set(clipboard_content)

	

func save_in_file_clipboard_with_key(key:String) -> void:
	
	if key == "":
		return
	if not DirAccess.dir_exists_absolute(_data_folder_relative_path):
		var make_dir_error = DirAccess.make_dir_recursive_absolute(_data_folder_relative_path)
		if make_dir_error != OK:
			#print("Failed to create directory: ", _data_folder_relative_path, " error=", make_dir_error)
			return
	if not DirAccess.dir_exists_absolute(_data_folder_relative_path):
		#print("Failed to create directory: ", _data_folder_relative_path)
		return

	var file_path = _get_file_path(key)
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file == null:
		#print("Failed to open file for write: ", file_path, " error=", FileAccess.get_open_error())
		return
	var clipboard_content = DisplayServer.clipboard_get()
	file.store_string(clipboard_content)
	file.close()
	
	#print("Save Clipboard:", file_path)
	var absolute_path:String= ProjectSettings.globalize_path(file_path)
	#print("Absolute path:", absolute_path)
	

func load_from_file_clipboard_from_key(key:String) -> void:
	if key == "":
		return 

	var file_path = _get_file_path(key)
	if not FileAccess.file_exists(file_path):
		return 

	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		print("Failed to open file for read: ", file_path, " error=", FileAccess.get_open_error())
		return 

	#print("Load Clipboard:", file_path)
	var absolute_path:String= ProjectSettings.globalize_path(file_path)
	#print("Absolute path:", absolute_path)
	
	var content = file.get_as_text()
	DisplayServer.clipboard_set(content)
