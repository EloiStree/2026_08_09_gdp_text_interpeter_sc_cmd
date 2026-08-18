class_name SCmdTextDelayer
extends Node

signal on_text_ready_to_be_relayed(text: String)
signal on_text_ready_to_be_relayed_with_time(text: String, when_added_milliseconds:int, when_relayed_milliseconds:int)
signal on_text_queue_size_changed(queue_size:int)
signal on_text_queue_size_changed_as_string(queue_size:String)

var _waiting_texts_to_be_delayed: Array[SCmdWaitingTextToRelay] = []


func _process(delta: float) -> void:
	var element_count = _waiting_texts_to_be_delayed.size()
	## for inverse
	for i in range(element_count - 1, -1, -1):
		var waiting_text = _waiting_texts_to_be_delayed[i]
		if waiting_text == null:
			_waiting_texts_to_be_delayed.remove_at(i)
			continue
		var current_time = get_time_in_milliseconds()
		var time_elapsed = current_time - waiting_text._milliseconds_on_device_when_received
		if current_time >= waiting_text._milliseconds_on_device_when_to_be_relayed:
			on_text_ready_to_be_relayed.emit( waiting_text._text_to_relay)
			on_text_ready_to_be_relayed_with_time.emit(waiting_text._text_to_relay, waiting_text._milliseconds_on_device_when_received, waiting_text._milliseconds_on_device_when_to_be_relayed)

			_waiting_texts_to_be_delayed.remove_at(i)

			var s = _waiting_texts_to_be_delayed.size()
			on_text_queue_size_changed_as_string.emit(str(s))
			on_text_queue_size_changed.emit(s)

func get_time_in_milliseconds() -> int:
	return int(Time.get_ticks_msec())


func _add_waiting_text( holder:SCmdWaitingTextToRelay):
	_waiting_texts_to_be_delayed.append(holder)
	var s = _waiting_texts_to_be_delayed.size()
	on_text_queue_size_changed_as_string.emit(str(s))
	on_text_queue_size_changed.emit(s)
	

	

func append_text_to_be_delayed_of_milliseconds(delay_time_in_milliseconds: int, text: String) -> void:
	var waiting_text = SCmdWaitingTextToRelay.new()
	var current_time = get_time_in_milliseconds()
	waiting_text._milliseconds_on_device_when_received = current_time
	waiting_text._milliseconds_on_device_when_to_be_relayed = current_time + delay_time_in_milliseconds
	waiting_text._text_to_relay = text
	_add_waiting_text(waiting_text)


class SCmdWaitingTextToRelay:
	var _milliseconds_on_device_when_received: int = 0
	var _milliseconds_on_device_when_to_be_relayed: int = 0
	var _text_to_relay: String = ""
