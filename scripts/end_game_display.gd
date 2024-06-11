extends Control

@export var restart_btn: Button
@export var main_menu_btn: Button

@export var number_guess_amount: Label
@export var position_guess_amount: Label
@export var total_guess_amount: Label

func _ready() -> void:
    hide();
    GameManager.instance.finalize_state.on_game_eneded.connect(on_game_ended)
    restart_btn.pressed.connect(on_restart)
    main_menu_btn.pressed.connect(on_main_menu)

func on_game_ended():
    show();
    var game_data := GameManager.instance.game_data;

    number_guess_amount.text = str(game_data.number_guess_count);
    position_guess_amount.text = str(game_data.position_guess_count)
    total_guess_amount.text = str(game_data.get_total_guess())

func on_restart():
    get_tree().reload_current_scene()

func on_main_menu():
    pass