extends Node2D

@onready var label = $CanvasLayer/MessageLabel

func _ready():
	show_messages()

func show_messages():

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Você procurou respostas."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Você atravessou obstáculos."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Você acreditou que encontraria algo."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Mas algumas portas não escondem monstros."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Não escondem riquezas."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Nem mesmo a verdade."
	await get_tree().create_timer(2.0).timeout

	label.text = ""
	await get_tree().create_timer(2.0).timeout

	label.text = "Às vezes..."
	await get_tree().create_timer(3.0).timeout

	label.text = ""
	await get_tree().create_timer(1.0).timeout

	label.text = "Não existe nada atrás da porta."
	await get_tree().create_timer(4.0).timeout
