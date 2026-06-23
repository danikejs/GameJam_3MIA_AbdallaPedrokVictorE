extends CanvasLayer

@onready var health_label: Label = $Control/HealthLabel
@onready var invencivel_label: Label = $Control/InvencivelLabel

var invencivel_timer := 0.0
var invencivel_active := false


func _ready() -> void:
	atualizar_vidas()
	invencivel_label.visible = false


func _process(delta: float) -> void:
	if invencivel_active:
		invencivel_timer -= delta

		if invencivel_timer > 0:
			invencivel_label.text = "INVENCÍVEL: " + str(round(invencivel_timer)) + "s"
		else:
			invencivel_active = false
			invencivel_label.visible = false


func atualizar_vidas() -> void:
	health_label.text = "Vidas: " + str(GameManager.vidas)


func mostrar_invencivel(valor: bool) -> void:
	invencivel_active = valor

	if valor:
		invencivel_timer = 5.0
		invencivel_label.visible = true
	else:
		invencivel_label.visible = false
