# Public asset credits

Selected Poly Haven assets, downloaded as local game resources. All listed assets
are CC0 1.0: https://polyhaven.com/license

- Snow 02: https://polyhaven.com/a/snow_02
- Rock 01: https://polyhaven.com/a/rock_01
- Blue Metal Plate: https://polyhaven.com/a/blue_metal_plate
- Metal Plate: https://polyhaven.com/a/metal_plate
- Rusty Painted Metal: https://polyhaven.com/a/rusty_painted_metal
- Rock 09 scanned model: https://polyhaven.com/a/rock_09
- Snowy Park 01 HDRI: https://polyhaven.com/a/snowy_park_01

Texture sets include albedo, OpenGL normal, and packed ambient occlusion / roughness /
metalness maps at 4K. Rock 09 uses its authored UVs and 1K maps. The lighting HDRI is 1K.
Files are unmodified downloads. `manifest.json` records source URLs, sizes, and SHA-256
checksums; `tools/import_public_assets.py` verifies the provider's MD5 at download.

Kenney Input Prompts (selected PlayStation glyphs), CC0 1.0:
https://kenney.nl/assets/input-prompts. Original license and a file manifest are in
`kenney_input_prompts/`.

Other libraries reviewed for future assets: ambientCG (https://ambientcg.com).
No ambientCG assets are included yet.

## Imported and adapted 3D geometry

- Human base mesh and UV PBR maps: **John Maksym / Moviemake**, “Low poly Sci fi Soldier”,
  CC BY 3.0: https://opengameart.org/content/low-poly-sci-fi-soldier
  License: https://creativecommons.org/licenses/by/3.0/
  Modified: normalized coordinates, subdivided anatomical base, weighted humanoid rig,
  idle/run clips, equipment, protective plates, rifle, material tint and glTF conversion.
- Challenger hull: **Quaternius**, Ultimate Spaceships Pack, CC0:
  https://quaternius.com/packs/ultimatespaceships.html
  Modified: scaling, bevels, cargo breach, surface panels, ribs, cables and PBR material changes.
- Creature, habitat, generator and terminal meshes: authored for this prototype using
  `tools/build_realism_assets.py` and `tools/build_terminal.py`. Concept artwork was generated
  with the built-in imagegen tool; the 3D models are separate native geometry.

## Terrain data

Terrain Tiles hosted on AWS / Mapzen: https://registry.opendata.aws/terrain-tiles/
United States 3DEP and global GMTED2010/SRTM terrain data courtesy of the U.S. Geological Survey.
Attribution/source details: https://github.com/tilezen/joerd/blob/master/docs/attribution.md
The Mount Rainier elevation tile is decoded, normalized, scaled and rotated into a
fictional background range. It is not a geographic depiction or a USGS-endorsed product.
See `terrain/SOURCE.md` and `terrain/manifest.json`.

### Character animation pass

`frontier_marine.glb` and its editable Blender source derive from John Maksym / Moviemake's
[Low poly sci-fi soldier](https://opengameart.org/content/low-poly-sci-fi-soldier), licensed
[CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). The mesh is subdivided and
reshaped into a rifle-ready pose, with a new weighted skeleton, eight authored actions,
armor panels, life-support pack, oxygen cylinders, hoses, boots, gauntlets and rifle.
Original UV textures are embedded in the export and packed in the Blender source.
The four strain meshes and rigs are authored for this prototype; their animation uses
baked two-bone leg IK, jaw, scythe and tail articulation. No StarCraft game assets are used.


### Rifle and firing effects

`frontier_rifle.glb` and `source/frontier_rifle.blend` are original hard-surface geometry,
authored with `tools/build_rifle.py`. Its muzzle and ejection markers attach to the ranger's
weapon bone. Runtime flash/light, casing and impact geometry are authored in
`scripts/rifle_effects.gd`; no third-party muzzle-flash sprites or weapon meshes are used.
The ranger now includes a ninth action, Reload, in addition to the previous eight.
