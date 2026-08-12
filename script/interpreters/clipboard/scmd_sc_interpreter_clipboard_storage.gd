class_name SCmdScInterpreterClipboardStorage
extends SCmdScInterpreterAbstractBidderNode



signal on_request_to_load_clipboard_from_ram_with_key(key:String)
signal on_request_to_save_clipboard_to_ram_with_key(key:String)
signal on_request_to_load_clipboard_from_file_with_key(key:String)
signal on_request_to_save_clipboard_to_file_with_key(key:String)
signal on_wrong_format_word_found(word: String)


@export var _last_wrong_format_word_found: String = ""


func is_able_to_interpret_given_word(word: String) -> bool:
	return word.begins_with("📋")
		

func interpret_given_word(word: String) -> void:
	if not is_able_to_interpret_given_word(word):
		return
	print("test:"+word)
	word = word.strip_edges()
	if word.begins_with("📋>"):
		var key = word.substr(3, word.length() - 3)
		on_request_to_save_clipboard_to_ram_with_key.emit(key)
	elif word.begins_with("📋<")	:
		var key = word.substr(3, word.length() - 3)
		on_request_to_load_clipboard_from_ram_with_key.emit(key)

	elif word.begins_with("📋📁>"):
		var key = word.substr(3, word.length() - 3)
		print("testddd:"+key)
		on_request_to_save_clipboard_to_file_with_key.emit(key)

	elif word.begins_with("📋📁<")	:
		var key = word.substr(3, word.length() - 3)
		on_request_to_load_clipboard_from_file_with_key.emit(key)
	else:
		_last_wrong_format_word_found = word
		on_wrong_format_word_found.emit(word)
		
	# Examples of valid clipboard commands:
	# No space
	# 📋>1
	# 📋>10
	# 📋<10
	# 📋<1
	# 📋>gpt
	# 📋<gpt

	# 📋📁>1
	# 📋📁>10
	# 📋📁<10
	# 📋📁<1
	# 📋📁>gpt
	# 📋📁<gpt
