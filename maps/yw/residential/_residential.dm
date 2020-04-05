// -- Shuttle -- //

/datum/shuttle/autodock/ferry/residential
	name = "Residential Shuttle"
	location = FERRY_LOCATION_OFFSITE
	docking_controller_tag = "residential_shuttle"
	landmark_offsite = "residential_residential"
	landmark_station = "residential_station"
	landmark_transition = "residential_transit"
	warmup_time = 3 SECONDS
	move_time = 27 SECONDS

/obj/effect/shuttle_landmark/premade/residential/residences
	name = "NCS Serenity Residential"
	landmark_tag = "residential_residential"
	docking_controller = "residential_shuttle_offsite"
	base_turf = /turf/space
	base_area = /area/space

/obj/effect/shuttle_landmark/premade/residential/transit
	name = "Space"
	landmark_tag = "residential_transit"

/obj/effect/shuttle_landmark/premade/residential/station
	name = "NSB Cryogaia"
	landmark_tag = "residential_station"
	docking_controller = "residential_shuttle_station"

	
// -- Objs -- //

/obj/machinery/computer/shuttle_control/residential_shuttle
	name = "residential ferry control console"
	shuttle_tag = "Residential Shuttle 1"


// -- Areas -- //

/area/shuttle/residential
	name = "\improper Residential Shuttle 1"
	base_turf = /turf/simulated/floor/outdoors/snow/plating/cryogaia

/area/residential
	icon = 'icons/turf/areas_yw.dmi'
	flags = RAD_SHIELDED

/area/residential/docking_lobby
	name = "\improper Residential - Docking Lobby"
	icon_state = "docking_lobby"

/area/residential/corridors
	name = "\improper Residential - Corridors"
	icon_state = "corridors"

/area/residential/ship_bay
	name = "\improper Residential - Ship Bay"

/area/residential/powerroom
	name = "\improper Residential - Power Room"

/area/residential/lobby
	name = "\improper Residential - Residential Lobby"

/area/residential/medbay
	name = "\improper Residential - Residential Medbay"

/area/residential/room1
	name = "\improper Residential - Room 1"
	icon_state = "room1"

/area/residential/room2
	name = "\improper Residential - Room 2"
	icon_state = "room2"

/area/residential/room3
	name = "\improper Residential - Room 3"
	icon_state = "room3"

/area/residential/room4
	name = "\improper Residential - Room 4"
	icon_state = "room4"

/area/residential/room5
	name = "\improper Residential - Room 5"
	icon_state = "room5"

/area/residential/room6
	name = "\improper Residential - Room 6"
	icon_state = "room6"

/area/residential/mansion
	name = "\improper Residential -  Mansion"
	icon_state = "mansion"