extends "res://nodes/menus/ArrowSlider.gd"

func format_value_label(value: float) -> String:
	value = (value - min_value) / (max_value - min_value) * 100.0
	# PATCH: REPLACE TEXT str(value) #INTO# str(stepify(value, 0.1))
	return str(value) + "%"
