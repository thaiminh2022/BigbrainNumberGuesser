extends Control

@export var restart_btn: Button;
@export var main_menu_btn: Button;

func _ready() -> void:
    restart_btn.pressed.connect(on_restart)
    main_menu_btn.pressed.connect(on_main_menu)

func on_restart():
    SceneManager.restart_scene();

func on_main_menu():
    SceneManager.load_scene(SceneManager.Scenes.MainMenu)
