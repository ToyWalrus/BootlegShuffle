extends SpawnConfig
class_name MonsterSpawnConfig

const BOOTLEG_CHANCE = 0.001
const LEVEL_BOOST = 0
const LEVEL_BOOST_FRAC = - 0.1
const LEVEL_BOOST_RANDOMNESS = 1.0
const NIGHT_LEVEL_BOOST_FRAC = 0.1

const BlankMonster = preload("res://data/characters/blank_monster.tres")

export (Array, Resource) var monster_forms: Array = []
export (PackedScene) var world_monster: PackedScene
export (Character.CharacterKind) var character_kind: int = Character.CharacterKind.MONSTER
export (bool) var disable_fleeing: bool = false
export (String, "", "monster", "monster_dlc") var level_scale_override_key: String = ""

func spawn() -> Node:
	assert (world_monster != null)
	var node = world_monster.instance()
	return _configure_world_mon(node)

func spawn_async() -> Node:
	assert (world_monster != null)
	var node = yield(InstanceQueue.instance_async(world_monster), "completed")
	return _configure_world_mon(node)

func _configure_world_mon(node: Node) -> Node:
	var encounter = EncounterConfig.new()
	encounter.name = "EncounterConfig"
	node.add_child(encounter)
	
	var first = true
	
	for mon in monster_forms:
		var c = CharacterConfig.new()
		c.base_character = BlankMonster
		c.pronouns = randi() % 3
		c.character_kind = character_kind
		
		c.level_boost = LEVEL_BOOST
		c.level_boost_frac = LEVEL_BOOST_FRAC
		c.level_boost_randomness = LEVEL_BOOST_RANDOMNESS
		c.night_level_boost_frac = NIGHT_LEVEL_BOOST_FRAC
		
		c.level_scale_override_key = level_scale_override_key
		
		encounter.add_child(c)
		encounter.move_child(c, randi() % encounter.get_child_count())
		var tape = TapeConfig.new()
		tape.form = mon
		if character_kind == Character.CharacterKind.MONSTER and randf() < BOOTLEG_CHANCE:
			tape.type_override = [BattleSetupUtil.random_type(Random.new())]
		# PATCH: ADD LINES HERE
		
		# Bootleg Shuffle -- override the bootleg chance (unless tape was already bootlegged)
		if (
			tape.type_override.size() == 0 and 
			character_kind == Character.CharacterKind.MONSTER and 
			randf() < DLC.mods_by_id["bootleg_shuffle"].bootleg_shuffle_rate
		):
			bootleg_shuffle_override(tape)
		# PATCH: STOP
		c.add_child(tape)
		
		if first and node.has_node(@"MonsterPalette"):
			
			var palette = node.get_node(@"MonsterPalette")
			palette.tape_path = palette.get_path_to(tape)
			assert ( not palette.tape_path.is_empty())
			first = false
	
	encounter.can_flee = not disable_fleeing
	
	return node

# PATCH: ADD FUNC
func bootleg_shuffle_override(tape: TapeConfig):
	var rand = Random.new()
	var types = Datatables.load("res://data/elemental_types").table
	var valid_types = types.values()
	if not SaveState.species_collection.has_seen_species(MonsterForms.basic_forms["glaistain"]):
		valid_types = valid_types.duplicate()
		valid_types.erase(types["glass"])
	
	var mod_info: ContentInfo = DLC.mods_by_id["bootleg_shuffle"]
	var weighted_choices = []
	var total_weight := 0.0
	for type in valid_types:
		var weight = mod_info.get(str(type) + "_rate")
		total_weight += weight
		weighted_choices.append({ "type": type, "weight": weight })
		
	if total_weight <= 0.0:
		return
		
	var choice = rand.weighted_choice(weighted_choices)
	tape.type_override = [choice["type"]]
# PATCH: STOP
