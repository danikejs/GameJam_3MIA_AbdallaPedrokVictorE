extends CanvasLayer

# ao ser criado na tela, o menu é escondido
func _ready() -> void:
	hide()

# tecla pause
func _input(event) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true

# botão continuar
func _on_continuar_button_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_menu_princiapal_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menuInicial.tscn")
