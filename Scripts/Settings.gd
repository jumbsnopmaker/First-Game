extends Control

func _ready():
	#Marca a opção correspondente ao idioma atual

	if TranslationServer.get_locale() == "pt_BR":
		$OptionsButtons/LanguageButton.select(1)

	else:
		$OptionsButtons/LanguageButton.select(0)

func _on_LanguageButton_item_selected(index):
	#Tradução
	match index:
		0:
			TranslationServer.set_locale("en")
		1:
			TranslationServer.set_locale("pt_BR")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/GUIs/Menu.tscn")
