extends Sprite2D

@onready var damage_component: DamageComponent = $DamageComponent
@onready var damage_tracker_component: DamageTrackerComponent = $DamageTrackerComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	damage_component.damage.connect(on_damage)
	damage_tracker_component.max_damage_reached.connect(on_max_damage_reached)

func on_damage(hit_damage: int) -> void:
	print("1 damage done")
	damage_tracker_component.apply_damage(hit_damage)
	await get_tree().create_timer(0.4).timeout
	material.set_shader_parameter("shake_intensity", 1.5)
	await get_tree().create_timer(0.5).timeout
	material.set_shader_parameter("shake_intensity", 0.0)

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene")
	print("max damage reached")
	queue_free()
	
func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)
