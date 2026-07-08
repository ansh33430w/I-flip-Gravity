extends Node2D


const SPIKE= preload("res://scenes/spike.tscn")

var spaentimer = 0
var spawnwait = .5
var gamespeed = 400


func _ready() -> void:
	add_to_group("game"
	
	)
	
func _process(delta: float) -> void:
	spaentimer  += delta
	if spaentimer >= spawnwait:
		spaentimer = 0 
		spikespawn()
		
		
		
		
		
		
func spikespawn() :
	var Spike = SPIKE.instantiate()
	Spike.speed = gamespeed
	Spike.on_ceiling = randi() % 2 == 0
	Spike.position= Vector2(1300,610 if not Spike.on_ceiling else 30)
	
	add_child(Spike)
	
	
	
func gameover():
	get_tree().paused = true
	
