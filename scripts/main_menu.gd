extends CanvasLayer

@export var start_btn: Button;

func _ready() -> void:
    start_btn.pressed.connect(to_main_game)

func to_main_game():
    SceneManager.load_scene(SceneManager.Scenes.Game)
