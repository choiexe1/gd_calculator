extends Node

##################################################
var num_label_node: Label
var grid_container_node: GridContainer
var current_operand: String = "0"
var input_operator: String = ""
var first_operand: float = 0.0
var memory_value: float = 0.0
##################################################

func _ready() -> void:
	num_label_node = $VBoxContainer/MarginContainer2/NumLabel
	grid_container_node = $VBoxContainer/MarginContainer3/GridContainer

	for btn in grid_container_node.get_children():
		btn.connect("pressed", Callable(self, "_on_btn_pressed")
		.bind(btn.name))

func _on_btn_pressed(btn_name: String) -> void:
	match btn_name:
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
			_input_digit(btn_name[0])
		"Point":
			_input_point()
		"AC":
			_input_all_clear()
		"Multiplication", "Division", "Substraction", "Plus":
			_input_operator()
		"Equivalent":
			_input_equivalent()
		"MR":
			_input_memory_recall()
		"MS":
			_input_memory_store()
		"Root":
			_input_root()

func _input_digit(value: String) -> void:
	if current_operand == "0":
		if value == "0":
			return
		else:
			current_operand = value
	else:
		current_operand += value

	_update_display()

func _input_point() -> void:
	pass

func _input_all_clear() -> void:
	current_operand = "0"
	input_operator = ""
	first_operand = 0.0
	memory_value = 0.0

func _input_operator() -> void:
	pass
func _input_equivalent() -> void:
	pass

func _input_memory_recall() -> void:
	pass

func _input_memory_store() -> void:
	pass

func _input_root() -> void:
	pass

func _update_display() -> void:
	num_label_node.text = current_operand
