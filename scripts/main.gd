extends Node2D


const SPIKE= preload("res://scenes/spike.tscn")

var spaentimer = 0
var spawnwait = 1.8
var gamespeed = 5
var steak = 0
var score = 0
var last_ceiling = true
var gameend = false
var shakeamt = 0.0

func _ready() -> void:
	add_to_group("game"
	
	)
	
	$CanvasLayer/Label.visible = true
	$CanvasLayer/Label2.visible =false
	$CanvasLayer/Label3.text = "Best Score : " + str(Global.highscore)
	
func _process(delta: float) -> void:
	if gameend == true:
		if Input.is_action_just_pressed("enter"):
			set_physics_process(true)
			get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
		return
	if shakeamt> 0:
		shakeamt = max(shakeamt -delta *5 ,0)
		$Camera2D2.offset =Vector2(randf_range(-1,1),randf_range(-1,1)*shakeamt)
		
	score += delta * 10
	$CanvasLayer/Label.text = "SCORE : " +str(int(score))
	gamespeed = 400 + int(score) /4
	var spd_ratio = clamp((gamespeed-400)/400.0,0,1)
	$ColorRect3.color = Color(0.1,0.1,0.15).lerp(Color(0.3,0.05,0.05),spd_ratio)
	
	spaentimer  += delta
	if spaentimer >= spawnwait:
		spawnwait = randf_range(1.5,2.2)
		spaentimer = 0 
		spikespawn()
		
		
		
	
		
		
func spikespawn() :
	var Spike = SPIKE.instantiate()
	print("spikespawwned")
	Spike.speed = gamespeed
	
	var choice = randi() %2 ==0
	if steak >= 2:
		choice = not last_ceiling
	
	if choice == last_ceiling:
		steak +=1
	else:
		steak = 1
	
	last_ceiling=choice
	
	
	Spike.on_ceiling = choice
	Spike.position = Vector2(1300,30 if choice else 610)
	add_child(Spike)
	
	
	
func gameover():
	set_physics_process(false)
	shakeamt =  20 
	$CanvasLayer/ColorRect.visible = true
	$CanvasLayer/Label.visible =false
	$CanvasLayer/Label2.visible = true
	Global.updatescore(int(score))
	
	
	$CanvasLayer/Label2.text = "GAMEOVER \nPRESS ENTER TO GO TO MENU  " + " \nBest Score" + str(Global.highscore)
	gameend = true
	
	
