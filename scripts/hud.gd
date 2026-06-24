extends CanvasLayer

@onready var invencivel_label: Label = $Control/InvencivelLabel
@onready var coracoes: HBoxContainer = $Control/coracao
@onready var chaves: HBoxContainer = $Control/chaves

var texture_cheio = preload("res://assets/coracao_cheio.png")
var texture_vazio = preload("res://assets/coracao_vazio.png")
var key_texture = preload("res://assets/keyRed.png")
var invencivel_active := false
var invencivel_timer := 0.0
signal vida_alterada(vida_atual: int)

func _ready() -> void:
	add_to_group("hud")

	_on_player_vida_alterada(GameManager.vidas)

	var player = get_node("../Player")
	player.vida_alterada.connect(_on_player_vida_alterada)

	atualizar_chaves()
	
func atualizar_chaves() -> void:
	for i in range(chaves.get_child_count()):
		var key = chaves.get_child(i)

		if i < GameManager.keys_collected:
			key.texture = key_texture
			key.visible = true
		else:
			key.visible = false

	
func _process(delta: float) -> void:
	if invencivel_active:
		invencivel_timer -= delta

		if invencivel_timer > 0:
			invencivel_label.text = "INVENCIVEL"
		else:
			invencivel_active = false
			invencivel_label.visible = false

# função conectada ao sinal vida_alterada() do Player) # inicializa com o valor atual
# função conectada ao sinal vida_alterada() do Player
func _on_player_vida_alterada(vida_atual: int) -> void:
	for i in range(coracoes.get_child_count()):
		var coracao = coracoes.get_child(i)
		if i < vida_atual:
			coracao.texture = texture_cheio
		else:
			coracao.texture = texture_vazio
			
func mostrar_invencivel(valor: bool) -> void:
	invencivel_active = valor

	if valor:
		invencivel_timer = 5.0
		invencivel_label.visible = true
	else:
		invencivel_label.visible = false
		
		
		
