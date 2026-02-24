# ConsumablesList

A World of Warcraft addon that displays a text list of consumables you're running low on, shown automatically when you're in a city or restocking.

## What It Does

ConsumablesList monitors your bags and shows a compact on-screen list of any consumable groups that fall below a configurable threshold. Each group displays its count on the left and a label on the right, colored for quick scanning. The list hides itself in combat, while mounted, while dead, and in instances — so it stays out of the way during actual gameplay.

**Default tracked groups include:**
- Weapon Enhancements (oils, whetstones)
- Combat Potions, Mana Potions, Health Potions, Invisibility Potions
- Flasks
- Feasts and Food (regular and hearty variants)
- Augment Runes
- Jumper Cables
- Auto Hammers
- Pausing Pylons

## Visibility Rules

The list shows when:
- You are resting (in a city or inn)
- You are mounted on an Auction House mount (Brutosaur)
- The "Show Outside of Cities" setting is enabled

The list hides when:
- You enter combat
- You mount up (except AH mounts, if that setting is on)
- You are in an instance (except neighborhoods, with the setting enabled)
- You are dead
- The addon is disabled

## Slash Commands

All commands use `/cl`:

| Command | Shorthand | Description |
|---|---|---|
| `/cl options` | `/cl o` | Open the item group editor |
| `/cl settings` | `/cl s` | Open the WoW Settings panel |
| `/cl full` | `/cl f` | Toggle full item names vs. group nicknames |
| `/cl toggle` | `/cl t` | Enable or disable the addon |
| `/cl debug` | `/cl d` | Toggle verbose debug messages |
| `/cl` | | Print available commands |

## Options Panel (`/cl o`)

A full item group editor with two panels:

**Left panel — Item Groups:**
- Lists all tracked groups; click to select one for editing
- Drag the handle icon to reorder groups (controls display order)
- Click the trash icon to delete a group (with confirmation)
- "Add New Group" button creates an empty group

**Right panel — Editor (top):**
- Set the group's display name, count threshold, and color
- Color can be entered as a hex code or picked with the color picker
- View and remove items already in the group

**Right panel — Inventory (bottom):**
- Shows items currently in your bags as icons
- Click an item to add it to the selected group
- Click an item already in a group to remove it (with confirmation if it belongs to a different group)
- Filter buttons in the top-right corner filter by item class (Consumable, Tradeskill, Weapon, etc.)

## Settings Panel (`/cl s`)

Accessible via the WoW Settings menu under **"Consumables List"**:

| Setting | Default | Description |
|---|---|---|
| Enable Addon | On | Show or hide the HUD |
| Always Use Full Names | Off | Show full item names instead of group nicknames |
| Font | PTSansNarrow-Bold | Font for the HUD text (supports LibSharedMedia fonts) |
| Font Size | 30 | Size of the HUD text |
| Line Height | 29 | Row height for the HUD text |
| Show Outside of Cities | Off | Show the list when not in a city |
| Show in Neighborhood | On | Show the list inside neighborhood instances |
| Show on AH Mount | On | Show the list when mounted on a Brutosaur AH mount |

## Frame Positioning

The frame integrates with WoW's **Edit Mode**. Enter Edit Mode (/editmode) to drag the Consumables List frame to your preferred position. Positions are saved per Edit Mode layout.

## Libraries

- **LibEditMode** — Edit Mode frame positioning integration
- **LibSharedMedia-3.0** — Font selection support
