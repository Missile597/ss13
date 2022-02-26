/obj/item/clothing/gloves/weddingring
	name = "golden wedding ring"
	desc = "For showing your devotion to another person. It has a golden glimmer to it."
	icon = 'icons/inventory/hands/item_vr.dmi'
	icon_state = "wedring_g"
	item_state = "wedring_g"
	var/partnername = ""
	body_parts_covered = null

/obj/item/clothing/gloves/weddingring/attack_self(mob/user)
	partnername = copytext(sanitize(input(user, "Would you like to change the holoengraving on the ring?", "Name your betrothed", "Bae") as null|text),1,MAX_NAME_LEN)
	name = "[initial(name)] - [partnername]"

/obj/item/clothing/gloves/weddingring/silver
	name = "silver wedding ring"
	icon_state = "wedring_s"
	item_state = "wedring_s"

/obj/item/clothing/gloves/color
	desc = "A pair of gloves, they don't look special in any way."
	item_state_slots = list(slot_r_hand_str = "white", slot_l_hand_str = "white")
	icon_state = "latex"

// Armor Versions Here
/obj/item/clothing/gloves/combat/knight
	desc = "ye olde armored gauntlets"
	name = "knight gauntlets"
	icon_state = "black"
	item_state = "black"
	siemens_coefficient = 2
	permeability_coefficient = 0.05
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE
	armor = list(melee = 80, bullet = 50, laser = 10, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/combat/knight/brown
	desc = "ye olde armored gauntlets"
	name = "knight gauntlets"
	icon_state = "brown"
	item_state = "brown"

// Costume Versions Here
/obj/item/clothing/gloves/combat/knight_costume
	desc = "ye olde armored gauntlets"
	name = "knight gauntlets"
	icon_state = "black"
	item_state = "black"
	siemens_coefficient = 2
	permeability_coefficient = 0.05
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/combat/knight_costume/brown
	desc = "ye olde armored gauntlets"
	name = "knight gauntlets"
	icon_state = "brown"
	item_state = "brown"

/obj/item/clothing/gloves/heavy_engineer
	desc = "Elbow-length insulated gloves, with added reinforcement. They'll keep your fingers and forearms just that little bit safer from things that might try to melt, mangle, or burn them. A tag on the inside of each glove reads \'PROPERTY OF ENGINEERING, RETURN IF FOUND\'."
	name = "heavy-duty engineering gloves"
	icon_state = "heavy_engi"
	item_state = "heavy_engi"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	flags = THICKMATERIAL
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 5, bomb = 0, bio = 30, rad = 30)
	icon = 'icons/inventory/hands/item_vr.dmi'
	default_worn_icon = 'icons/inventory/hands/mob_vr.dmi'
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/inventory/hands/mob_vr_teshari.dmi',
		SPECIES_VOX = 'icons/inventory/hands/mob_vr_vox.dmi',
		SPECIES_WEREBEAST = 'icons/inventory/hands/mob_vr_werebeast.dmi')

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE
<<<<<<< HEAD
=======

/obj/item/clothing/gloves/black/bloodletter
	desc = "A pair of ordinary looking black gloves. On closer examination, they seem somewhat well-made, with an almost metallic sheen to them."
	description_fluff = "A prohibited concealed weapon, the Melee Grip Reinforcement system is the product of the military applications of nanotechnology. The striking face of the glove hardens in response to impact, producing monofilament blades from the knuckles to greatly enhance the wearer's close-combat lethality."
	special_attack_type = /datum/unarmed_attack/hardclaws
>>>>>>> 0a41e6fed8f... Merge pull request #12330 from Screemonster/YoushouldtryfightingforwhatyoubelieveinsometimeJack
