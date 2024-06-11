extends TabContainer

@export var tab_btns: Array[Button] = [];

func _ready() -> void:
    var children := get_children();
    for i in range(0, len(children)):
        var index := i;
        
        tab_btns[index].text = children[i].name;
        tab_btns[index].pressed.connect(func(): tab_btns_pressed(index))
        

func tab_btns_pressed(index: int) -> void:
    current_tab = index;
        
