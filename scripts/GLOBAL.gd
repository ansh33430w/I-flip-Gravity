extends Node

var highscore = 0
var playercolor = Color(0.649, 0.709, 0.266, 1.0)
func _ready() -> void:
	loadhighscore()
	
	
	
	

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
		
		
		
		
func savesettings():
	var file = FileAccess.open("user://settings.save",FileAccess.WRITE)
	file.store_var(playercolor)
	file.close()



func loadsettings():
	if FileAccess.file_exists("user://settings.save"):

		var file = FileAccess.open("user://settings.save",FileAccess.READ)
		playercolor = file.get_var()
		file.close()
