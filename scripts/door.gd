extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("TOCOU NA PORTA")

	if body.name != "Player":
		return

	print("CHAVES:", GameManager.keys_collected)

	if GameManager.keys_collected >= 3:
		print("ABRINDO CUTSCENE")
		get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
