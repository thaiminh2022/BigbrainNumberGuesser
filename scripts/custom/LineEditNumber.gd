class_name LineEditNumber extends LineEdit

@export var min_value: int = -99999999999999999;
@export var max_value: int = 99999999999999999;

func _ready() -> void:
    text_changed.connect(_on_text_changed)
    
func _on_text_changed(new_text:String) -> void:
    if new_text.strip_edges().is_empty():
        return;
    
    if !new_text.is_valid_int():
        var last_caret_position := caret_column;
        text = str(int(text))
        caret_column = last_caret_position -1 
    
    _clamp_value();


func _clamp_value():
    var value := get_value();
    var last_caret_position := caret_column;
    if value < min_value:
        value = min_value;
        
    if  value > max_value:
        value = max_value 
        
    text = str(value)
    caret_column = last_caret_position
    
func get_value() -> int:
    return int(text)

