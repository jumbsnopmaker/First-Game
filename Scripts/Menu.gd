extends Control

#Sinais dos botões
func SettingsButton_pressed():
	get_tree().change_scene("res://Scenes/GUIs/Settings.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Scenes/Phases/Inicio.tscn")
