# Arquivo: powerup_speed.gd

extends Area2D

# sinal speed_collected criado já com o parâmetro body, que será 
# enviado junto ao sinal ao ser emitido, informando o nó que ouvir este sinal 
# todas as informações sobre o nó que entrou naquela área
signal speed_collected(body)

# Cria as variáveis que referenciam o nó de Partículas, Sprite2D e CollisionShape
@onready var particles: GPUParticles2D = $Particles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":

		body.apply_invincibility()

		sprite_2d.visible = false
		collision_shape_2d.set_deferred("disabled", true)

		await particles.finished

		queue_free()
