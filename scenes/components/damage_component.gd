class_name DamageComponent
extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.None

signal damage(hit_damage: int)

func _on_area_entered(area: Area2D) -> void:

	var hit_component := area as HitComponent
	if hit_component == null:
		return

	if tool == hit_component.current_tool:
		damage.emit(hit_component.hit_damage)
