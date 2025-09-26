extends ContentInfo

var bootleg_shuffle_rate := 0.001
var air_rate := 1.0
var astral_rate := 1.0
var beast_rate := 1.0
var earth_rate := 1.0
var fire_rate := 1.0
var glass_rate := 1.0
var glitter_rate := 1.0
var ice_rate := 1.0
var lightning_rate := 1.0
var metal_rate := 1.0
var plant_rate := 1.0
var plastic_rate := 1.0
var poison_rate := 1.0
var water_rate := 1.0

var elemental_rates_label = "Elemental rates"

const MODUTILS: Dictionary = {
	"cheat_mod": true,
	"class_patch": [
		{
			"patch": "res://mods/bootleg_shuffle/CustomMonsterSpawnConfig.gd",
			"target": "res://data/spawn_config_scripts/MonsterSpawnConfig.gd"
		},
		{
			"patch": "res://mods/bootleg_shuffle/ArrowSlider_PercentWithDecimal.gd",
			"target": "res://nodes/menus/ArrowSlider_Percent.gd"
		}
	],
	"settings": [
		{
			"property": "bootleg_shuffle_rate",
			"type": "percent_slider",
			"label": "Bootleg rate",
			"step": 0.001,
		},
		{
			"property": "elemental_rates_label",
			"type": "label",
			"label": "Elemental rates"
		},
		{
			"property": "air_rate",
			"type": "slider",
			"label": "Air",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "astral_rate",
			"type": "slider",
			"label": "Astral",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "beast_rate",
			"type": "slider",
			"label": "Beast",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "earth_rate",
			"type": "slider",
			"label": "Earth",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "fire_rate",
			"type": "slider",
			"label": "Fire",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "glass_rate",
			"type": "slider",
			"label": "Glass",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "glitter_rate",
			"type": "slider",
			"label": "Glitter",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "ice_rate",
			"type": "slider",
			"label": "Ice",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "lightning_rate",
			"type": "slider",
			"label": "Lightning",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "metal_rate",
			"type": "slider",
			"label": "Metal",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "plant_rate",
			"type": "slider",
			"label": "Plant",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "plastic_rate",
			"type": "slider",
			"label": "Plastic",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "poison_rate",
			"type": "slider",
			"label": "Poison",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
		{
			"property": "water_rate",
			"type": "slider",
			"label": "Water",
			"step": 0.1,
			"min_value": 0.0,
			"max_value": 2.0,
		},
	]
}

func init_content() -> void:
	assert (DLC.has_mod("cat_modutils", 0))
