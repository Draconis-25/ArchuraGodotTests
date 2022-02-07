extends Control

var path

func create_log_file() -> void:
	var file = File.new()
	file.open(str(path + "/data.txt"), File.WRITE)
	file.close()

func generate_string() -> String:
	var string : String

	string = string + str(OS.get_locale_language()) + "\n\n"
	string = string + str(OS.get_latin_keyboard_variant()) + "\n\n"
	string = string + str(OS.get_screen_count()) + "\n\n"
	string = string + str(OS.get_screen_size()) + "\n\n"
	string = string + str(OS.get_environment("PATH")) + "\n\n"
	string = string + str(OS.get_environment("path")) + "\n\n"
	string = string + str(OS.get_processor_count()) + "\n\n"
	string = string + str(VisualServer.get_video_adapter_name()) + "\n\n"
	string = string + str(VisualServer.get_video_adapter_vendor()) + "\n\n"

	string = string + "IP: \n"
	var ip_array = IP.get_local_addresses()
	for i in range(0, ip_array.size()):
		string = string + ip_array[i] + "\n"

	return string

func write_string(string : String) -> void:
	var file = File.new()
	file.open(str(path + "/data.txt"), File.WRITE)
	file.store_string(string)
	file.close()

func _ready() -> void:
	path = OS.get_executable_path().get_base_dir()
	create_log_file()
	write_string(generate_string())