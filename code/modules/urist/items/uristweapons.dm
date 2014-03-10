/*										*****New space to put all UristMcStation Weapons*****

Please keep it tidy, by which I mean put comments describing the item before the entry. Icons go to 'icons/urist/uristweapons.dmi' -Glloyd */


//Welder machete, icons by ShoesandHats, object by Cozarctan

/obj/item/weapon/machete
	urist_only = 1
	name = "machete"
	desc = "a large blade beloved by sugar farmers and mass murderers"
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "machete"
	item_state = "machete"
	flags = FPRINT | TABLEPASS | CONDUCT
	slot_flags = SLOT_BELT
	force = 20
	throwforce = 10
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("cleaved", "slashed", "sliced", "torn", "ripped", "diced", "cut")

	suicide_act(mob/user)
		viewers(user) << "<span class='suicide'>[user] is slitting \his stomach open with the [src.name]! It looks like \he's trying to commit suicide.</b>"
		return(BRUTELOSS)

/obj/item/weapon/machete/IsShield()
		return 1

//Energy pistol, Energy gun with less shots. Can be put in player's pockets.

/obj/item/weapon/gun/energy/gun/pistol
	urist_only = 1
	name = "energy pistol"
	desc = "An energy pistol with a wooden handle."
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "senergy"
	item_state = null
	w_class = 1
	ammo_type = list(/obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)
	origin_tech = "combat=2;magnets=2"
	modifystate = 2

	attack_self(mob/living/user as mob)
		select_fire(user)
		update_icon()

	suicide_act(mob/user)
		viewers(user) << "<span class='suicide'>[user] is unloading the [src.name] into their head!</b>"
		return(BRUTELOSS)

/*plasma pistol. does toxic damage. I want to add this to research soonish. icons by Susan from BS12, editing and projectile by Glloyd
--Okay, they implemented this on BS12, and I dislike how they did it. The top is green, and shoots a green pulse. It also has different values then the one I coded.
The point is that theirs is closer to the X-COM plasma pistol, despite the fact that all depictions of plasma in SS13 are purple, thus my choice to edit
the sprite and make my own projectile -Glloyd*/

/obj/item/weapon/gun/energy/plasmapistol
	urist_only = 1
	name = "plasma pistol"
	desc = "An experimental weapon that works by ionizing plasma and firing it in a particular direction, poisoning someone."
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "plasmapistol"
	item_state = "gun"
	w_class = 1
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	origin_tech = "combat=4;magnets=2;materials=4;plasmatech=3"
	modifystate = 0
	cell_type = "/obj/item/weapon/cell/crap"

	suicide_act(mob/user)
		viewers(user) << "<span class='suicide'>[user] is unloading the [src.name] into their head! Their skin turns purple and starts to melt!</b>"
		return(BRUTELOSS|TOXLOSS)

/obj/item/projectile/energy/plasma
	urist_only = 1
	name = "ionized plasma"
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "plasma"
	damage = 20
	damage_type = TOX
	irradiate = 20

/obj/item/ammo_casing/energy/plasma
	projectile_type = /obj/item/projectile/energy/plasma
	e_cost = 100
	select_name = "plasma"
	fire_sound = 'sound/weapons/Genhit.ogg'

//Sniper rifle, from BS12. Those guys used spaces instead of tabs. What the actual fuck.

/obj/item/weapon/gun/energy/laser/sniperrifle
	urist_only = 1
	name = "L.W.A.P. Sniper Rifle"
	desc = "A rifle constructed of lightweight materials, fitted with a SMART aiming-system scope."
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "sniper"
	origin_tech = "combat=6;materials=5;powerstorage=4"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/sniper)
	slot_flags = SLOT_BACK
	w_class = 4.0

	var/zoom = 0

/obj/item/weapon/gun/energy/laser/sniperrifle/dropped(mob/user)
	user.client.view = world.view
	zoom = 0

/obj/item/weapon/gun/energy/laser/sniperrifle/verb/zoom()
	set category = "Special Verbs"
	set name = "Zoom"
	set popup_menu = 0
	if(usr.stat || !(istype(usr,/mob/living/carbon/human)))
		usr << "No."
	return

	src.zoom = !src.zoom
	usr << ("<font color='[src.zoom?"blue":"red"]'>Zoom mode [zoom?"en":"dis"]abled.</font>")
	if(zoom)
		usr.client.view = 12
		usr << sound('sound/mecha/imag_enh.ogg',volume=50)
	else
		usr.client.view = world.view//world.view - default mob view size
	return

/obj/item/projectile/energy/laser/sniper
	name = "sniper beam"
	icon_state = "xray"
	damage = 60
	stun = 5
	weaken = 5
	stutter = 5

/obj/item/ammo_casing/energy/laser/sniper
	projectile_type = /obj/item/projectile/energy/laser/sniper
	e_cost = 250
	select_name = "sniper"
	fire_sound = 'sound/weapons/marauder.ogg'

//S-COM projectiles. Eat your heart out Corai

/obj/item/ammo_casing/energy/laser/sniper/SCOM
	projectile_type = /obj/item/projectile/energy/laser/sniper
	e_cost = 10
	select_name = "sniper"
	fire_sound = 'sound/weapons/marauder.ogg'

/obj/item/ammo_casing/energy/xray/SCOM
	projectile_type = /obj/item/projectile/beam/xray
	e_cost = 5
	fire_sound = 'sound/weapons/laser3.ogg'

obj/item/ammo_casing/energy/laser/heavy/SCOM
	e_cost = 10

//Alien guns and projectiles for S-COM. I refuse to call these plasma guns. PLASMA IS PURPLE.

obj/item/weapon/gun/energy/laser/alien
	urist_only = 1
	icon = 'icons/urist/uristweapons.dmi'

/obj/item/weapon/gun/energy/laser/alien/pistol
	name = "alien pistol"
	desc = "A strange alien pistol that fires green bolts... There are engravings on the side that mean nothing to you."
	icon_state = "alienpistol"
	item_state = "gun"
	w_class = 1
	ammo_type = list(/obj/item/ammo_casing/energy/alien/alien1)

/obj/item/weapon/gun/energy/laser/alien/lightrifle
	name = "light alien rifle"
	desc = "A strange alien light rifle that fires green bolts... There are engravings on the side that mean nothing to you."
	icon_state = "lightalienrifle"
	item_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/alien/alien2)

/obj/item/weapon/gun/energy/laser/alien/rifle
	name = "alien rifle"
	desc = "A strange alien rifle that fires green bolts... There are engravings on the side that mean nothing to you."
	icon_state = "alienrifle"
	item_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/alien/alien3)

/obj/item/projectile/energy/laser/alien
	urist_only = 1
	name = "alien beam"
	icon = 'icons/urist/uristweapons.dmi'
	icon_state = "alienprojectile"

/obj/item/projectile/energy/laser/alien/alien1
	damage = 15

/obj/item/projectile/energy/laser/alien/alien2
	damage = 25

/obj/item/projectile/energy/laser/alien/alien3
	damage = 30
	stun = 5
	weaken = 5
	stutter = 5

/obj/item/ammo_casing/energy/alien
	e_cost = 0
	fire_sound = 'sound/weapons/marauder.ogg'

/obj/item/ammo_casing/energy/alien/alien1
	projectile_type = /obj/item/projectile/energy/laser/alien/alien1

/obj/item/ammo_casing/energy/alien/alien2
	projectile_type = /obj/item/projectile/energy/laser/alien/alien2

/obj/item/ammo_casing/energy/alien/alien3
	projectile_type = /obj/item/projectile/energy/laser/alien/alien3

//More special S-COM projectiles

/obj/item/ammo_casing/a12mm/SCOM
	desc = "A 12mm bullet casing."
	caliber = "12mm"
	projectile_type = /obj/item/projectile/bullet/midbullet2

/obj/item/ammo_box/magazine/m12mm/SCOM
	ammo_type = /obj/item/ammo_casing/a12mm/SCOM