extends CharacterBody2D

const SPEED = 300.0
# 플레이어 움직임 속도

func _ready() -> void:
	set_visibility_layer_bit(0, false)
	set_visibility_layer_bit(2, true)
	# 미니맵에서 플레이어를 보이지 않게 하기 위해서 설정(플레이어 아이콘만 보여게 하려 함)
	# 기본 값음 0 bit(Layer 1)는 끄고, 2 bit를 켬(Layer 3)

func _physics_process(delta: float) -> void:
	
	var input_horizontal = Input.get_axis("ui_left", "ui_right")
	# 플레이어 수평 이동 입력 값
	if input_horizontal:
	# 플레이어 수평 이동 입력 값이 있다면
		velocity.x = input_horizontal * SPEED
		# 수평 이동
	else:
	# 플레이어 수평 이동 입력 값이 없다면
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# 정지
	
	var input_vertical = Input.get_axis("ui_up", "ui_down")
	# 플레이어 수직 이동 입력 값
	if input_vertical:
	# 플레이어 수직 이동 입력 값이 있다면
		velocity.y = input_vertical * SPEED
		# 수직 이동
	else:
	# 플레이어 수직 이동 입력 값이 없다면
		velocity.y = move_toward(velocity.x, 0, SPEED)
		# 정지

	move_and_slide()
	# 물리 적용

'''

'''
