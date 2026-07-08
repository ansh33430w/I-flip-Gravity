extends Node

var highscore = 0
func _ready() -> void:
	pass
	
	
	

func savehighscore():
	var file = FileAccess.open("user://highscore.save",FileAccess.WRITE)
	file.store_var(highscore)
	file.close()
	


func loadhighscore() :
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save",FileAccess.READ)
		highscore= file.get_var()
		file.close()
		
		
		
		
func updatescore(newscore):
	if newscore> highscore:
		highscore = newscore
		savehighscore()
