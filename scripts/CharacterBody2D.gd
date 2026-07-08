extends CharacterBody2D

@onready var color_rect: ColorRect = $ColorRect
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D




var gravity_direction = 1


const Gravity = 1500
const max_fall_speed = 700



func _ready() -> void:
	color_rect.color = Color(0.97, 0.652, 0.337, 1.0)
	
	
func _physics_process(delta: float) -> void:
	velocity.y += Gravity * delta *gravity_direction
	velocity.y = clamp(velocity.y, -max_fall_speed,max_fall_speed)
	move_and_slide()
	
	
	if Input.is_action_just_pressed("ui_accept"):
		gravityflip()
		
		
		
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		gravityflip()
		
	if event is InputEventMouseButton and event.pressed:
		gravityflip()
		
		
		
		
		
func gravityflip() :
	
	gravity_direction *= -1
	color_rect.color = Color(1,.5,.2) if gravity_direction == -1 else Color(.2,.8,1)
	
		
		
		
		
