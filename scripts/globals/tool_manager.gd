extends Node

var selected_tool: DataTypes.Tools = DataTypes.Tools.None
var is_mouse_over_ui: bool = false

signal tool_selected(tool: DataTypes.Tools)

func select_tool(tool:DataTypes.Tools) -> void:
	tool_selected.emit(tool)
	selected_tool = tool 
