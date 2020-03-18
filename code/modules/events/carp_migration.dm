/datum/event/carp_migration
	startWhen		= 0		// Start immediately
	announceWhen	= 45	// Adjusted by setup
	endWhen			= 75	// Adjusted by setup
	var/carp_cap	= 10
	var/list/spawned_carp = list()

/datum/event/carp_migration/setup()
	announceWhen = rand(30, 60) // 1 to 2 minutes
	endWhen += severity * 25
	carp_cap = 2 + 3 ** severity // No more than this many at once regardless of waves. (5, 11, 29)

/datum/event/carp_migration/announce()
	var/announcement = ""
	if(severity == EVENT_LEVEL_MAJOR)
		announcement = "Massive migration of unknown biological entities has been detected near [location_name()], please stand-by."
	else
		announcement = "Unknown biological [spawned_carp.len == 1 ? "entity has" : "entities have"] been detected near [location_name()], please stand-by."
	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/carp_migration/tick()
	if(activeFor % 4 != 0)
		return // Only process every 8 seconds.
	if(count_spawned_carps() < carp_cap && living_observers_present(affecting_z))
		spawn_fish(rand(1, severity * 2) - 1, severity, severity * 2)

/datum/event/carp_migration/proc/spawn_fish(var/num_groups, var/group_size_min, var/group_size_max, var/dir)
	if(isnull(dir))
		dir = (victim && prob(80)) ? victim.fore_dir : pick(GLOB.cardinal)

	var/i = 1
	while (i <= num_groups)
		var/Z = pick(affecting_z)
		var/group_size = rand(group_size_min, group_size_max)
		var/turf/map_center = locate(round(world.maxx/2), round(world.maxy/2), Z)
		var/turf/group_center = pick_random_edge_turf(dir, Z, TRANSITIONEDGE + 2)
		var/list/turfs = getcircle(group_center, 2)
		for (var/j = 0, j < group_size, j++)
			var/mob/living/simple_mob/animal/M = new /mob/living/simple_mob/animal/space/carp/event(turfs[(i % turfs.len) + 1])
			GLOB.destroyed_event.register(M, src, .proc/on_carp_destruction)
			spawned_carp.Add(M)
			M.ai_holder?.give_destination(map_center) // Ask carp to swim towards the middle of the map
			// TODO - Our throwing systems don't support callbacks. If it ever does, we can throw first to simulate ship speed.
		i++

// Counts living carp spawned by this event.
/datum/event/carp_migration/proc/count_spawned_carps()
	. = 0
	for(var/I in spawned_carp)
		var/mob/living/simple_mob/animal/M = I
		if(!QDELETED(M) && M.stat != DEAD)
			. += 1

// If carp is bomphed, remove it from the list.
/datum/event/carp_migration/proc/on_carp_destruction(var/mob/M)
	spawned_carp -= M
	GLOB.destroyed_event.unregister(M, src, .proc/on_carp_destruction)

/datum/event/carp_migration/end()
	. = ..()
	// Clean up carp that died in space for some reason.
	spawn(0)
		for(var/mob/living/simple_mob/SM in spawned_carp)
			if(SM.stat == DEAD)
				var/turf/T = get_turf(SM)
				if(istype(T, /turf/space))
					if(prob(75))
						qdel(SM)
			CHECK_TICK

//
// Overmap version of the event!
//
/datum/event/carp_migration/overmap
	announceWhen = 1 // Announce much faster!
