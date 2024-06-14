class_name LineEditHook extends Node

@export var hide_keyboard_btn: Button
@export var line_edit: LineEdit;

@export var keyboard: Control;
@export var on_screen_keyboard: OnScreenKeyboard;

var use_os: Array[String] = [
    "Android",
    "iOS",
    "Web"
];

func _ready() -> void:
    var os_name := OS.get_name();

    if os_name not in use_os:
        keyboard.hide();
        return

    line_edit.focus_entered.connect(line_edit_focused);
    
    if on_screen_keyboard.autoShow:
        return
    hide_keyboard_btn.pressed.connect(keyboard.hide)
        

func line_edit_focused():
    keyboard.show();
