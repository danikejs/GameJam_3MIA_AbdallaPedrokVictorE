extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -454.0

const INVINCIBLE_DURATION = 5.0
var invincible = false
var invincible_time_left = 0.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hud: CanvasLayer = $"../Hud"
@onready var posicao_inicial: Marker2D = $"../PosicaoInicial"

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

		if velocity.y > 0:
			velocity += get_gravity() * delta * 1.5

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	if not is_on_floor():
		animated_sprite_2d.play("jump")
	elif direction != 0:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# INVENCIBILIDADE
func apply_invincibility():
	invincible = true
	invincible_time_left = INVINCIBLE_DURATION

	if hud != null:
		hud.mostrar_invencivel(true)

	while invincible_time_left > 0:
		await get_tree().create_timer(1.0).timeout
		invincible_time_left -= 1.0

	invincible = false

	if hud != null:
		hud.mostrar_invencivel(false)

# MORTE
func die():
	if invincible:
		return

	tomar_dano(1)

func tomar_dano(dano: int) -> void:
	GameManager.vidas -= dano

	if hud != null:
		hud.atualizar_vidas()

	if GameManager.vidas <= 0:
		print("Game Over")
		get_tree().reload_current_scene()
	else:
		respawn()

# RESPAWN
func respawn() -> void:
	global_position = posicao_inicial.global_position
	velocity = Vector2.ZERO
