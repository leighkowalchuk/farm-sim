extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_hoe: Button = $MarginContainer/HBoxContainer/ToolHoe
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn_seeds: Button = $MarginContainer/HBoxContainer/ToolCornSeeds
@onready var tool_tomato_seeds: Button = $MarginContainer/HBoxContainer/ToolTomatoSeeds

func _process(_delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()

	ToolManager.is_mouse_over_ui = get_global_rect().has_point(mouse_pos) 
	
func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.AxeWood)

func _on_tool_hoe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround)
	
func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)

func _on_tool_corn_seeds_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)

func _on_tool_tomato_seeds_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_hoe.release_focus()
		tool_watering_can.release_focus()
		tool_corn_seeds.release_focus()
		tool_tomato_seeds.release_focus()
		
		
