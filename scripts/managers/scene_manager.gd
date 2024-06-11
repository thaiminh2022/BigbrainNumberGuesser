extends Node

@export var scenes: Array[PackedScene];

enum Scenes {
    MainMenu,
    Game,
}

func load_scene(scene: Scenes):
    var scene_index := int(scene);
    get_tree().change_scene_to_packed(scenes[scene_index]);

    if scene == Scenes.MainMenu:
        GameManager.instance.reset_static();
        GuessingBoard.instance.reset_static();

func restart_scene():
    get_tree().reload_current_scene();
