
Example of a Python listener that plays MIDI output, because Godot does not include MIDI support by default.


```
class_name SCmdScSendMidiOutputToLocalhost
extends Node

@export var _target_ip: String = "127.0.0.1"
@export var _target_port: int = 7032

@export var _channel_if_omitted: int = 0
func send_channel_note_velocity_to_localhost(channel:int, note:int, velocity:int) -> void:
	# MIDI Note On message: status byte (0x90 | channel), note, velocity
	var status_byte = 0x90 | (channel & 0x0F)
	var data = PackedByteArray()
	data.append(status_byte)
	data.append(note & 0x7F)
	data.append(velocity & 0x7F)
	send_byte_to_inspector_target(data)

func send_note_velocity_to_localhost(note:int, velocity:int) -> void:
	send_channel_note_velocity_to_localhost(_channel_if_omitted, note, velocity)

func send_controller_velocity_to_localhost(controller:int, value:int) -> void:
	# MIDI Control Change message: status byte (0xB0 | channel), controller, value
	var status_byte = 0xB0 | (0 & 0x0F)  
	var data = PackedByteArray()
	data.append(status_byte)
	data.append(controller & 0x7F)
	data.append(value & 0x7F)
	send_byte_to_inspector_target(data)

func send_byte_to_inspector_target(bytes:PackedByteArray) -> void:
	if _target_ip == "":
		return
	var packet = PacketPeerUDP.new()
	packet.set_broadcast_enabled(true)
	var send_err = packet.set_dest_address(_target_ip, _target_port)
	if send_err != OK:
		print("Failed to set broadcast destination: ", _target_ip, ":", _target_port, " error=", send_err)
		return
	send_err = packet.put_packet(bytes)
	if send_err != OK:
		print("Failed to send packet to host: ", _target_ip, ":", _target_port, " error=", send_err)
```
