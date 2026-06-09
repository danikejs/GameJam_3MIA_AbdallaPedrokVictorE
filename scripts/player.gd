extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -470.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

		# Faz cair mais rápido
		if velocity.y > 0:
			velocity += get_gravity() * delta * 1.0

	# Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movimento
	var direction := Input.get_axis("left", "right")

	# Vira o personagem
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	# Animações
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	elif direction != 0:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")

	# Movimento horizontal
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	get_tree().reload_current_scene()
