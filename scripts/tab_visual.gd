extends TabContainer

const MENU_INDEX: int = 1;

@export var tab_btns: Array[Button] = [];

func _ready() -> void:
    var children := get_children();
    for i in range(len(children)):
        var index := i;
        
        tab_btns[index].text = children[i].name;
        tab_btns[index].pressed.connect(func(): tab_btns_pressed(index))

    tab_btns_pressed(0);
    GameManager.instance.finalize_state.on_game_eneded.connect(on_game_ended)

func on_game_ended():
    tab_btns_pressed(MENU_INDEX)

func tab_btns_pressed(index: int) -> void:
    current_tab = index;

    for i in range(len(tab_btns)):
        if i == index:
            tab_btns[i].set_pressed_no_signal(true);
        else:
            tab_btns[i].set_pressed_no_signal(false);

func _input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("pause_game"):
        tab_btns_pressed(MENU_INDEX);