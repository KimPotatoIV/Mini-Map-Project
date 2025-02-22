extends CanvasLayer

##################################################
@export var player_scene: Node2D
# 플레이어 씬 입력 창 생성

var sub_viewport_node: SubViewport
# SubViewport 노드
var camera_node: Camera2D
# Camera2D 노드

##################################################
func _ready() -> void:
	sub_viewport_node = $TextureRect/SubViewportContainer/SubViewport
	# SubViewport 노드 설정
	sub_viewport_node.world_2d = get_tree().root.world_2d
	# world_2d = SubViewport가 표시 할 2D 월드
	# get_tree().root.world_2d = 현재 게임의 모든 노드에서 최상위 노드의 world_2d를 가져옴
	# sub_viewport_node에 표시할 world_2d를 최상위 노드의 world_2d로 설정
	sub_viewport_node.set_canvas_cull_mask_bit(2, false)
	# 미니맵 내에서 PlayerDot 스프라이트를 제외한 실제 플레이어 이미지가 안 보이도록 설정
	# Player 씬에서 Visiblility Layer가 2 bit(Layer 3)만 켜져 있기 때문에 이것을 끔
	
	
	camera_node = $TextureRect/SubViewportContainer/SubViewport/Camera2D
	# Camera2D 노드 설정

##################################################
func _process(delta: float) -> void:
	camera_node.position = player_scene.position
	# camera_node 좌표에 player_scene 좌표 설정
	# 미니맵이 플레이어를 중심으로 따라다니게 됨
