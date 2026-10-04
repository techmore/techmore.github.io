# Encounter and advancement loop

This pass targets deliberate single-contact fights in an offline MMO-style prototype.
It takes the user's preference for long, cautious fights as the design direction; it does
not attempt to reproduce World of Warcraft's formulas or balance.

## Fight, recover, advance

1. Select one contact and check the surroundings before opening fire. Proximity pulls
   require line of sight. Nearby creatures can engage independently: pulling a second
   contact creates overlapping lunge warnings rather than doubling an abstract stat.
2. Fire measured shots. The rifle holds eight rounds, fires every 0.9 seconds, consumes
   four stamina per shot, and reloads in 2.2 seconds. R reloads; Square reloads away from
   a nearby interactable. Holding fire on an empty magazine starts a reload automatically.
3. Watch the orange ring and the target's windup countdown. The enemy commits to your
   position, winds up for 0.8 seconds (Emberclaw: 1.0), then lunges for 0.28 seconds.
   Move out of that position before impact. Successful evasions earn Defense XP; taking
   the strike also earns Defense XP, with the same capped encounter budget.
4. Choose when to shoot, reposition, sprint, or patch. Firing while moving deals 80%
   damage; sprinting blocks fire. Combat stamina regenerates at 3/s rather than 10/s.
   The field patch costs 20 stamina, restores 35 health, and has an 18-second cooldown.
   Reload/fire animations use an upper-body layer so the legs keep moving.
5. Break contact and return to the station. Active threats and a six-second combat
   grace period prevent healing by stepping over the outpost boundary. Safe station
   rest restores health at 6/s. Servicing the power unit costs two salvage and requires
   leaving combat. Leashed enemies recover health and return home, so boundary camping
   does not gradually chip them down.
6. Spend salvage on alternating rifle/armor upgrades. A rifle tier adds two damage;
   an armor tier adds eight percentage points of mitigation, with a 40% overall cap.
   The wreck supplies three recoveries of two salvage, separated by 30 seconds.
7. Report to Command when the field XP, skill, and mission requirements are all met.
   Each circle grants three attribute points and two separate talent points.

## Two progression measurements

**Skill ranks** measure practice. The next rank costs `12 + 6 × current rank` XP.
Rifle/melee XP comes from effective damage, proportional to the creature's maximum
health, with a shared 18-XP budget per creature life. Overkill, dry fire, dead targets,
and repeated partial pulls do not add unlimited training. Defense has an 18-XP budget
per creature life and grants up to three XP per resolved strike, whether hit or evaded.
Victories grant eight Survival XP; frontier movement grants one Survival XP per three
seconds. Engineering comes from the first power repair (12), wreck recoveries (5 each),
and installed upgrades (8 each). Repeat servicing restores resources without awarding
repair XP again.

**Field XP** measures completed encounters. Each perimeter intruder awards 24. Field
Exterior baselines are Frostling 32, Voltskitter 40, Emberclaw 52, and Murkstrain 48. Health rolls from 90–115% of baseline; strike damage scales by sqrt(roll) and XP is rounded from baseline × roll. Thus live XP bands are 29–37 / 36–46 / 47–60 / 43–55 respectively. This is cumulative
XP: reaching Circle 2 does not spend it. Respawned field contacts are legitimate new
encounters. Perimeter intruders stay cleared.

| Promotion | Cumulative field XP | Skill ranks | Mission requirement | Reward |
| --- | ---: | --- | --- | --- |
| Circle 2 | 80 | Rifles 2, Defense 1, Survival 1, Engineering 1 | Both intruders cleared, power restored | 3 attribute + 2 talent points |
| Circle 3 | 240 | Rifles 4, Defense 3, Survival 3, Engineering 2 | Existing clearance retained | 3 attribute + 2 talent points |

The HUD shows recommended threat circles; these are encounter recommendations, not entry locks.

| Contact | Threat circle | HP | Strike damage | Field XP | Salvage |
| --- | ---: | ---: | ---: | ---: | ---: |
| Perimeter Frostling | 1 | 200 | 10 | 24 | 2 |
| Field Frostling | 1 | 200 | 10 | 32 | 2 |
| Voltskitter | 2 | 240 | 12 | 40 | 3 |
| Emberclaw | 3 | 340 | 17 | 52 | 4 |
| Murkstrain | 3 | 300 | 14 | 48 | 4 |

Circle 2 is intended to follow the two perimeter fights, station recovery, and one or two
field encounters depending on their rolls. Its Defense requirement can be earned entirely through evasions.
Circle 3 pushes another hunting trip, stronger encounters, and equipment work.
This remains a three-circle slice, not a complete endgame or multiplayer progression system.

## Measured baseline and limits

`tools/combat_balance.gd` measures the real firing, reload, stamina, and damage methods
against a stationary 200-HP Frostling, with incoming damage and movement disabled.
The baseline is **28.25 seconds, 25 shots, three reloads**. See `combat-benchmark.json`.
This is a cadence benchmark, not proof that live fights always take that time or that
all players find the difficulty enjoyable. Moving, missing lunge opportunities, pulling
extra contacts, ranks, points, and equipment all change encounter duration and risk.

The new rifle is an original Blender asset (`tools/build_rifle.py`), attached to the
animated weapon bone. Muzzle flash, barrel light, casings, impact debris, and recoil
are runtime Godot effects. The rifle uses five runtime material groups; its Blender source
retains 90 individually editable pieces. Ammunition is replenished by reload rather than a finite
inventory reserve in this slice. Enemy damage occurs after the telegraphed lunge;
player rifle/melee damage is immediate. The reload gesture does not yet detach and
replace the physical magazine. Terrain-adaptive creature foot IK remains future work.

## Saves and verification

Play uses `frontier-profile.json`; test scenes explicitly use `frontier-test-profile.json`,
and renderer captures use a separate capture profile. Profile writes retain a `.bak`
copy of the previous file before atomic replacement. Schema 2 saves field XP and wreck
recoveries. Schema 1 saves retain earned circles and infer field XP as `kills × 32`.
Tests must never instantiate a writing game against the play profile.


## Energy barrier and arrival chronology

The Wayfarer wreck is fresh; the town was abandoned before we arrived. The north
entrance starts fully open, with the energy field offline. Servicing auxiliary power
for two salvage enables the field. The player capsule can cross it; enemy capsules
and attack line of sight cannot. No sliding door or artificial coordinate leash seals
the entrance. Creatures still return home after their ordinary distance leash.

## Implemented talent paths

Following WoW's design emphasis on meaningful choices and prerequisite paths
([official talent preview](https://news.blizzard.com/en-us/article/23797209/world-of-warcraft-dragonflight-talent-preview)), this first slice gives two talent points per promotion, separate from attributes.
Each node costs one; second nodes require Circle 3 and their parent. First nodes
require Circle 2. Promotions still use our skill ranks and mission requirements.

| Path | Circle 2 node | Circle 3 node |
| --- | --- | --- |
| Rifle | Steady aim: stationary rifle damage +15% | Armor piercer: rifle damage vs C3 threats +20%; stacks multiplicatively |
| Survival | Conditioning: +15 max HP | Field medic: patch restores 50 HP with 14-second cooldown |
| Engineering | Field loader: reload 1.8 seconds, animation synchronized | Reclaimer: +1 salvage from each exterior victory |

Spend points in the Service Record; use D-pad Right from Return to field to enter
its talent column. Free retraining is available while out of combat at Command or
auxiliary power. Old saves receive the earned point budget automatically. Invalid
prerequisites, unknown nodes and excess choices are discarded on load.

At Circle 2, choose two starter paths. At Circle 3, deepen both, or trade one deeper
node for the third starter path. The survival investment buys recovery; engineering
buys faster reload openings and equipment supply; rifle investment shortens exposure.
Baseline untrained rifle cadence remains 28.25 seconds / 25 shots / 3 reloads against
200 HP. Talents change that measured baseline; live combat needs player playtesting.

Rolls remain constant across pulls and respawns within a session. World spawn state
is not saved; a new session generates new contacts. Affix attacks, active secondary
talents and circles beyond 3 remain proposed future content.
