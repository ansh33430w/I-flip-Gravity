extends Area2D




var speed = 400
var on_ceiling = false


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	queue_redraw()



func _physics_process(delta: float) -> void:
	position.x -=speed*delta
	if position.x < -50:
		queue_free()
		
		
		
func generate():
	var color = Color(1,.2,.2)
	if on_ceiling :
		draw_polygon(PackedVector2Array([Vector2(-15,-30), Vector2(15,-30),Vector2(0,0)]),PackedColorArray([color]))
		
		
		
		
		
	else:
		draw_polygon(PackedVector2Array([Vector2(-15,-30), Vector2(15,30),Vector2(0,0)]),PackedColorArray([color]))
		
		




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_group("game","gameover")
