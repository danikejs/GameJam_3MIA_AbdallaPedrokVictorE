extends Area2D

signal collected

@onready var particles: GPUParticles2D = $Particles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		GameManager.keys_collected += 1

		var hud = get_tree().get_first_node_in_group("hud")
		if hud:
			hud.atualizar_chaves()

		collected.emit()

		sprite_2d.visible = false
		collision_shape_2d.set_deferred("disabled", true)

		particles.emitting = true

		await get_tree().create_timer(1.0).timeout

		queue_free()
