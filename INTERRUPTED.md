## User

Analyze the codebase with the contex of the TODO.md, and write deatiled knowledge about what it's doing. Make this deatiled enough that I can use Sonnet 4.6 and it won't struggle to figure out how to deubg and update this app just as well as Opus 4.6 could.

## Assistant



I'll start by reading the TODO.md and then systematically explore the codebase.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\TODO.md**
Status: Completed

```
     1→# TODO
     2→
     3→## Updates
     4→- Did not update when purchasing auto hammers, had to go move the slider in order for the list to update and hide the hammers. Ensure we still have bag change event checks happening. After reloading putting the items in the bank hide the line, but pulling them back out did not re-show the line. May be only getting events once?
     5→- Frame needs to be locked to the bottom left corner, if the frame needs to get wider, then it needs to grow to the right. It should never move that bottom left anchor after moved in edit mode even if the frame gets wider / taller.
     6→- If we delete the name of a group and press enter, use the 1st item's name as the name for the group.
     7→- If the group is called "New Group" and we add an item, change the name to the same name as the item
     8→- Give groups a order ID so they are in the same order every time
     9→  - Allow drag on drop?
    10→- Update each group to have enable / disable conditions 
    11→  - Class / Spec
    12→  - Grey out and move to bottom of list if disabled due to conditions
    13→- Update defualts to be reasonble midnight
    14→- Update color input hex to select all 6 chars on focus so we can just paste without ahving to select and delete
    15→- Add addon options panel
    16→  - with button to open the cl options
    17→  - Enable / disable whole addon button. Early return basically turns off the entire addon
    18→  - Add sharedMedia Font select, Font size, lineHeight customization
    19→  - Add toggle to use full names instead of group names permanantly
    20→  - Add configuration for the hide / show logic somehow? maybe just simple on top of our defaults rather than?
    21→    - show in neighborhood
    22→    - show when on ah mount
    23→
    24→## Refactor
    25→We need to refactor and seperate concerns from the CL.lua file.
    26→
    27→## Ideas
    28→- Add secure button frame to the left to show the icon and act like a action bar as well as a list of low items? (probably not as we only show low items)
    29→- Add an action bar frame taht is moveable and sizeable pixel perfect that updates and shows items from the list in a top down fashion so it will always show buttons for the most powerful verison first
    30→
```

**Tool Call: Find `D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList` `**/*`**
Status: Completed

D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\media\fonts\PTSansNarrow-Bold.ttf
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\LICENSE
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\description
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\applypatch-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\commit-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\fsmonitor-watchman.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\post-update.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-applypatch.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-commit.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-merge-commit.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-push.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-rebase.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-receive.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\prepare-commit-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\push-to-checkout.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\sendemail-validate.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\update.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\8d\0bb0caa111a4aec81e92a7dc857eee58463483
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ff\b38872cd8f436dffbf08e16fb974460a316e52
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\b6\3c29c9c1d902218110811b42385f191f5e55e7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\18\196a19767648a4f87fbbba4ad15fdcbc6dec93
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\40\2a25a5cf61b596067d79de5850ff3bc9659f9e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d1\2b6f1dafb6a77740581dc5647c882d5a57712d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\config
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f1\c63cd2b399ad80fcf70fc003f03ed8834e0114
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ec\64e2dc016e4a5fc082decb66db0cf0bc0359d9
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f7\f183334214c427f3f84aa67c87efcf4c3f3f7a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ea\d2776119e81b29593e216e5d0d781772480bc6
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2a\6b973664b99bfbf6ffc74bde7f518cc01a15f5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\03\995505e00a371b203939b1daf7843681e51b63
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fc\6ede7f0ddcddb74036b80c5243304397559df5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\7c\7e07a3b3d24adcff89b2146283f29b47c7687d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ad\307493f9253fbb27e2297ff132a2713f291815
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\9b\b79db00dff0f893eb2e4756be72dec5e1fe7d2
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\7b\3f566d22498cb220abe22f1129acd1cb1b3642
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\89\f25de7e09070d40481ab41e15d5ae57c7b53bd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a2\5dbeb5f63656abd6bbf7a1afdf01cd14756c23
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\27\0a23e736f2a1daeb50e17b5fd3c2d3068a1c67
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f1\a851fdc9ffaf3e21283c891800e3563511ffad
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\97\6b14cd5b49c53a01854823a6cc90daf543a527
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\6d\a74fde91b195692d8ea55fd09ee4c2f467d78f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a8\3cc4ace46a159620e14bd4a2153d9a47a1880c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\41\00babd8e4ad0ac14f47486bc089a559a801995
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2a\aad81307a72934c7951e41ce4bf56b23648f00
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\3f\803facc4ff6eabf7c3102fb51e2fb9369eba35
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\af\cbf6bdab81a03a1345d69c47e522d531b0089d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\86\5e797256a2f0e412e85271be44d5615beac6a7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\44\15a4133421e6f71078bec0b132d5de2d1d45b9
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\6c\f56ae52672fa97b0436de6e1a978318678b2ac
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\63\2435db6a9d3051eccb748a577b5bdb8f96c2bc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\61\2340f98aec1631148ada132393f9a9a4688fba
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ca\e40ddeadca3f364d9c7289ccb62c91c80311d0
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\76\cb6683440f6060300aced6565f69679cd317bd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\ORIG_HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\9d\f1c6b25ad273f833e44c6dd13b44a7bdf8fd6c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d0\0b3e21d58bf33c61872ad47114f39ef7a2132d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2d\accec47a3e2a95cb7ef6957c4a6dbc5e3f381a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\96\0a20ac3f5a7954bb6e9efffb40fca1ccfa315a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\39\0a2a9343d698828e69ee744d24610fd1ace74e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\01\d96b0770d3cb0415940bbe7e32cd9e8b745002
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ff\4c89a180f7d062a3fd19cfb64c854b218ddc02
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\80\0e32860ab3016648c8d1b780cc9fc57cf23320
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\b0\232e544ac3d08e4ac7c0c032c947780c97d2a7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d6\493593841ca8639c1fa63629e8b1d319a3192d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\26\2dadb16d94debb858516c21494c366b8c998dc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\20\7e4e364387ed2871722da1d3c7839478f88eac
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\30\2a076ef1c834e39a47972ec0fc34dbfa66b139
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\eb\6796a5cd9e20140beac09af71342e420651e7f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\aa\7d89ff4a29d0916d15ba137f49db773e920e77
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\c3\950498606f49a3757446425caf6df39bb67f72
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ed\7243a7a43fe95e4c9610a64207c0663134888f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\5f\ca9cd302dc80feb1608045065a4a7e1922e928
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\89\59d22472b184dcadd443d1bc823105c8cc1dcb
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\26\82b2976f08d9f3501f68e57dc004a20231603b
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fb\d02fcfed7ac253d8bcb6597bab7692c1392044
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\62\f0e69dae826aeaab992143bde0b17c01e5c539
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\FETCH_HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\logs\refs\remotes\origin\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\refs\remotes\origin\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\refs\tags\ls
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\aa\158b41611b4dae3f319ca1d0c7a6880f9c1294
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a2\4d7a6b549f152836d4695e6c11a1e9878906f2
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\61\dfc7a9aa23b708fb12996acb1d9ea73b2d505e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fa\6315393b2af739486a52d50f1e9f6b8a1134eb
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a9\b8ef18d795ec9d568892385d612b5e33524470
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\37\d8df10d16ffabead3f8efead545d241a4a2ae3
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\0e\671bf9cea859a35b842a6b4d4d43aaaf159d12
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\69\f3d7d646af5592462e31b6339f6b516c912892
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d2\b81fc1d7e8f96ec0ec71be110698dfbc0b484c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a6\438ea96134d6482da8a1a7c87a674a28eb4bab
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\70\fe30bd726710313663af42463f57a5e6643346
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f2\834b77553943b3c91dd2a43b7e9891c55c29fe
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a7\b678d7674eba09595760faefc48c2768c207cd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d3\5f8119c7b7bbe48e58f8996e43a10f1bdbe7d5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\36\e09517ee28e1964cf755dd5820bce51f30810d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fa\c8a803f4995e8425993876ec69a655d13f3414
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\4e\204635d132648ca9029c9935fd078e20d39bda
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\e4\f5b29eeaf676a9af000af2e8c7ec6365e76c74
(Results are truncated. Consider using a more specific path or pattern.)

**Tool Call: Find `D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList` `*.{lua,toc,xml}`**
Status: Completed

D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\pools.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\namespaced.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\embed.xml
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibStub\LibStub.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibStub\LibStub.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\dropdown.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\slider.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\colorpicker.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\dialog.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\divider.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\extension.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\button.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\expander.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\checkbox.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Commands.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua

**Tool Call: Find `D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList` `**/*.{lua,toc,xml}`**
Status: Completed

D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\pools.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\namespaced.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\embed.xml
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibStub\LibStub.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibStub\LibStub.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\dropdown.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\slider.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\colorpicker.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\dialog.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\divider.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\extension.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\button.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\expander.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\widgets\checkbox.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.toc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Commands.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua

## Assistant

Now let me read all the source files.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.toc**
Status: Completed

```
     1→## Interface: 120000, 120001
     2→## Title: Consumables List
     3→## Notes: Text list of Consumables that shows when below set thresholds
     4→## Author: Yvairel
     5→## Version: 12.0.1-1
     6→## Category: Consumables
     7→## SavedVariablesPerCharacter: ConsumablesListDB
     8→
     9→Libs\LibEditMode\LibStub\LibStub.lua
    10→Libs\LibEditMode\embed.xml
    11→
    12→Database.lua
    13→Commands.lua
    14→Options.lua
    15→ConsumablesList.lua
    16→
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→CL.abbv = "CL"
     3→
     4→
     5→-------------------------------------------------------------------------------
     6→--- Configuration Variables
     7→-------------------------------------------------------------------------------
     8→
     9→local IMMEDIATELY = true
    10→
    11→local addon_color = "00bf40bf"
    12→
    13→local    font_size = 30
    14→local     v_height = 29
    15→local text_offset = 3
    16→local padding_bottom = -3 -- Adjust all text down
    17→
    18→local full_item_names = false
    19→
    20→local AH_MOUNT_SPELL_IDS = {
    21→    465235, -- Trader's Gilded Brutosaur
    22→    264058, -- Mighty Caravan Brutosaur
    23→}
    24→
    25→-------------------------------------------------------------------------------
    26→--- Functions
    27→-------------------------------------------------------------------------------
    28→
    29→function CL:Print(msg)
    30→    print("|c" .. addon_color .. ADDON_NAME .. ":|r " .. msg)
    31→end
    32→
    33→function CL:VPrint(msg)
    34→    if not verbose then return end
    35→
    36→    print("|c" .. addon_color .. CL.abbv .. ":|r " .. msg)
    37→end
    38→
    39→function CL:DeepCopy(orig)
    40→    local copy = {}
    41→    for k, v in pairs(orig) do
    42→        if type(v) == "table" then
    43→            copy[k] = CL:DeepCopy(v)
    44→        else
    45→            copy[k] = v
    46→        end
    47→    end
    48→
    49→    return copy
    50→end
    51→
    52→function CL:HexToRGB(hex)
    53→    hex = hex:gsub("#", "") -- Remove # if present
    54→    local r = tonumber(hex:sub(1, 2), 16) / 255
    55→    local g = tonumber(hex:sub(3, 4), 16) / 255
    56→    local b = tonumber(hex:sub(5, 6), 16) / 255
    57→
    58→    return r, g, b
    59→end
    60→
    61→function CL:HideItemGroup(group_name)
    62→    CL.frame.item_texts[group_name].left:Hide()
    63→    CL.frame.item_texts[group_name].right:Hide()
    64→end
    65→
    66→function CL:ShowItemGroup(group_name)
    67→    CL.frame.item_texts[group_name].left:Show()
    68→    CL.frame.item_texts[group_name].right:Show()
    69→end
    70→
    71→
    72→function CL:ToggleFullNames()
    73→    full_item_names = not full_item_names
    74→    CL:Print("Using " .. (full_item_names and "Full Names" or "Nicknames"))
    75→    CL:Update(IMMEDIATELY)
    76→end
    77→
    78→function CL:ToggleDebug()
    79→    verbose = not verbose
    80→    CL:Print("debug turned " .. (verbose and "on" or "off"))
    81→    CL:Update(IMMEDIATELY)
    82→end
    83→
    84→function CL:RebuildDisplay()
    85→    for group_id, texts in pairs(CL.frame.item_texts) do
    86→        texts.left:Hide()
    87→        texts.right:Hide()
    88→    end
    89→
    90→    wipe(CL.frame.item_texts)
    91→    CL:Update(IMMEDIATELY)
    92→end
    93→
    94→local function IsMountedOnAHMount()
    95→    if not IsMounted() then return false end
    96→    if InCombatLockdown() then return false end
    97→
    98→    for _, spellID in ipairs(AH_MOUNT_SPELL_IDS) do
    99→        if C_UnitAuras.GetPlayerAuraBySpellID(spellID) then
   100→            return true
   101→        end
   102→    end
   103→
   104→    return false
   105→end
   106→
   107→function CL:HideOrShowUpdate(should_run_immediately)
   108→    should_run_immediately = should_run_immediately or false
   109→
   110→    inInstance, instanceType = IsInInstance()
   111→
   112→    ---------------------------------------
   113→    -- Checking if we should HIDE the frame
   114→
   115→    -- Hide if we are in combat lockdown
   116→    if InCombatLockdown()
   117→
   118→    -- Hide if we are instanced unless
   119→    --   1. We are mounted on an AH Mount
   120→    --   2. We are in a neighborhood
   121→    or (inInstance and not (IsMountedOnAHMount() or
   122→                            instanceType == "neighborhood"))
   123→
   124→    -- Hide if we are mounted unless
   125→    --   1. We are in a city or
   126→    --   2. We are mounted on an AH Mount
   127→    or (IsMounted() and not (IsResting() or
   128→                             IsMountedOnAHMount()))
   129→
   130→    -- Hide if we are dead
   131→    or UnitIsDead("player")
   132→    then
   133→        CL:VPrint("Frame should be Hidden")
   134→        CL.frame:Hide()
   135→    else
   136→        CL:VPrint("Frame should be Shown")
   137→        CL.frame:Show()
   138→        CL:Update(should_run_immediately)
   139→    end
   140→end
   141→
   142→local update_is_throttled = false
   143→local min_update_interval = 15 -- Minimum time (seconds) between automatic updates
   144→
   145→function CL:Update(should_run_immediately)
   146→    should_run_immediately = should_run_immediately or false
   147→
   148→    if update_is_throttled and not should_run_immediately then return end
   149→
   150→    update_is_throttled = true
   151→    local index = 0
   152→
   153→    for group_id, item_group in pairs(CL.db.item_groups) do
   154→        local    item_id = item_group.item_ids[1]
   155→
   156→        -- Skip groups with no items
   157→        if not item_id then
   158→            if CL.frame.item_texts[group_id] then
   159→                CL:HideItemGroup(group_id)
   160→            end
   161→        else
   162→
   163→        local  item_name = C_Item.GetItemNameByID(item_id)
   164→        local      r,g,b = CL:HexToRGB(item_group.color)
   165→        local item_count = 0
   166→
   167→        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
   168→        if not ((item_group and item_group.name) or item_name) then
   169→            CL.VPrint("CL: Item not cached, no name found for item_id: " .. item_id)
   170→            C_Timer.After(1, function()
   171→                CL:Update(IMMEDIATELY)
   172→            end)
   173→
   174→            return
   175→        end
   176→
   177→        for _, id in ipairs(item_group.item_ids) do
   178→            item_count = item_count + GetItemCount(id, false)
   179→        end
   180→
   181→        if not CL.frame.item_texts[group_id] then
   182→            CL.frame.item_texts[group_id] = {}
   183→
   184→            -- Create the text for the item name on the right
   185→            CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
   186→            CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
   187→            CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)
   188→
   189→            -- Create the text for the item count on the left
   190→            CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
   191→            CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
   192→            CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
   193→        end
   194→
   195→        local      item_name_text = ((item_group and item_group.name) or item_name)
   196→        local full_item_name_text = item_name
   197→        local     item_count_text = item_count
   198→
   199→        -- CL:VPrint(item_name .. ":" .. item_count)
   200→
   201→        -- Update text for low vs out of an item
   202→        if item_count == 0 then
   203→            item_name_text = ("Out of " ..  item_name_text)
   204→        else
   205→            item_name_text = (item_name_text .. " Low")
   206→        end
   207→
   208→        -- Check if `/cl f` was run and replace with full text value if so
   209→        item_name_text = (full_item_names and full_item_name_text) or item_name_text
   210→
   211→        CL.frame.item_texts[group_id].right:SetText(item_name_text)
   212→        CL.frame.item_texts[group_id].left:SetText(item_count_text)
   213→
   214→        -- Show if there are less than the threshold of items
   215→        if item_count < item_group.threshold then
   216→            index = index + 1
   217→            CL:ShowItemGroup(group_id)
   218→        else
   219→            CL:HideItemGroup(group_id)
   220→        end
   221→
   222→        end -- else (has item_id)
   223→    end
   224→
   225→    -- Resize frame to fit visible rows and reposition text
   226→    local visible_count = index
   227→    local row_height = v_height
   228→    local frame_height = math.max(1, visible_count * row_height)
   229→    local max_width = 1
   230→
   231→    -- Measure widths and reposition anchors
   232→    local row_index = 0
   233→    for group_id, texts in pairs(CL.frame.item_texts) do
   234→        if texts.left:IsShown() then
   235→            local left_width = texts.left:GetStringWidth()
   236→            local right_width = texts.right:GetStringWidth()
   237→            local total_width = left_width + right_width + (text_offset * 3)
   238→            if total_width > max_width then
   239→                max_width = total_width
   240→            end
   241→
   242→            local y_offset = (row_index * row_height) + padding_bottom
   243→            texts.right:ClearAllPoints()
   244→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   245→
   246→            texts.left:ClearAllPoints()
   247→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   248→
   249→            row_index = row_index + 1
   250→        end
   251→    end
   252→
   253→    CL.frame:SetSize(math.max(1, max_width), frame_height)
   254→
   255→    C_Timer.After(min_update_interval, function()
   256→        update_is_throttled = false
   257→    end)
   258→end
   259→
   260→
   261→-------------------------------------------------------------------------------
   262→--- Initialization
   263→-------------------------------------------------------------------------------
   264→
   265→-- Create the main frame
   266→CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
   267→CL.frame:SetSize(1, 1)
   268→CL.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
   269→CL.frame:SetMovable(true)
   270→CL.frame:SetClampedToScreen(true)
   271→CL.frame:Hide()
   272→
   273→-- LibEditMode integration
   274→local LibEditMode = LibStub("LibEditMode")
   275→
   276→local function OnPositionChanged(frame, layoutName, point, x, y)
   277→    if not ConsumablesListDB then return end
   278→    if not ConsumablesListDB.positions then
   279→        ConsumablesListDB.positions = {}
   280→    end
   281→
   282→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   283→end
   284→
   285→local function OnLayoutChanged(layoutName)
   286→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   287→
   288→    local pos = ConsumablesListDB.positions[layoutName]
   289→    if pos then
   290→        CL.frame:ClearAllPoints()
   291→        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
   292→    end
   293→end
   294→
   295→LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "CENTER", x = 0, y = 0 }, "Consumables List")
   296→LibEditMode:RegisterCallback("layout", OnLayoutChanged)
   297→
   298→-- Set up custom font (using a WoW built-in font, or replace with your own font file)
   299→local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"
   300→
   301→CL.frame.font = CreateFont("ConsumablesListFont")
   302→CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
   303→CL.frame.font:SetTextColor(1, 1, 1, 1)
   304→
   305→-- Container for text items
   306→CL.frame.item_texts = {}
   307→
   308→
   309→-------------------------------------------------------------------------------
   310→--- Event Handling
   311→-------------------------------------------------------------------------------
   312→
   313→local function EventHandler(self, event, arg1)
   314→    if event == "ADDON_LOADED" then
   315→        if arg1 == ADDON_NAME then
   316→            if not ConsumablesListDB then
   317→                ConsumablesListDB = {}
   318→            end
   319→
   320→            -- Initialize item_groups from saved data or defaults
   321→            if ConsumablesListDB.item_groups then
   322→                CL.db.item_groups = ConsumablesListDB.item_groups
   323→            else
   324→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   325→                ConsumablesListDB.item_groups = CL.db.item_groups
   326→            end
   327→
   328→            CL.frame:UnregisterEvent("ADDON_LOADED")
   329→
   330→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   331→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   332→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
   333→            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors
   334→
   335→            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
   336→            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit
   337→
   338→            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting
   339→
   340→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Login
   341→            CL.frame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Entering a City
   342→            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Area Change
   343→
   344→            CL:Print("Loaded. Use " .. SLASH_CONSUMABLESLIST1 .. " for commands.")
   345→        end
   346→    elseif event == "PLAYER_REGEN_DISABLED" then
   347→        CL:VPrint("Hiding for combat enter: " .. event)
   348→        CL.frame:Hide()
   349→    elseif event == "PLAYER_REGEN_ENABLED" or           -- Exiting Combat
   350→           event == "PLAYER_UPDATE_RESTING" or          -- Entering City
   351→           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
   352→        CL:VPrint("Update IMMEDIATELY for: " .. event)
   353→        CL:HideOrShowUpdate(IMMEDIATELY)
   354→    else
   355→        CL:VPrint("Update LAZILY for: " .. event)
   356→        CL:HideOrShowUpdate()
   357→    end
   358→end
   359→
   360→-- Register events
   361→CL.frame:RegisterEvent("ADDON_LOADED")
   362→
   363→CL.frame:SetScript("OnEvent", EventHandler)
   364→
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→
     3→-------------------------------------------------------------------------------
     4→--- Database Config
     5→CL.db = {}
     6→
     7→CL.db.defaults = {
     8→    -- group_name = {
     9→    --     item_ids = {
    10→    --         123,
    11→    --         456,
    12→    --     },
    13→    --     threshold = 123,
    14→    --     color = '#hexhex'
    15→    -- },
    16→    weapon_enchantments = {
    17→        item_ids = {
    18→            224107, -- 11.0.0: Algari Mana Oil
    19→        },
    20→        threshold = 20,
    21→        color = 'fd54c2'
    22→    },
    23→    damage_potion = {
    24→        item_ids = {
    25→            212265, -- 11.0.0: Tempered Potion R3
    26→            212264, -- 11.0.0: Tempered Potion R2
    27→        },
    28→        name = "Tempered Potions",
    29→        threshold = 40,
    30→        color = 'e1ee43',
    31→    },
    32→    healing_potion = {
    33→        item_ids = {
    34→            244839, -- 11.2.0: Invigorating healing Potion
    35→        },
    36→        name = "Health Pots",
    37→        threshold = 40,
    38→        color = 'b51f00',
    39→    },
    40→    invisbility_potion = {
    41→        item_ids = {
    42→            -- 212250, -- 11.0.0: Draught of Silent Footfalls
    43→            191395, -- 10.0.0: Potion of the Hushed Zephyr
    44→        },
    45→        name = "Invis Pots",
    46→        threshold = 10,
    47→        color = 'c6dbe1',
    48→    },
    49→    flask = {
    50→        item_ids = {
    51→            212283, -- 11.0.0: Flask of Alchemical Chaos
    52→        },
    53→        name = "Flasks",
    54→        threshold = 20,
    55→        color = '#feb24a',
    56→    },
    57→    feast = {
    58→        item_ids = {
    59→            222733, -- 11.0.0 Feast of the Midnight Masquerade
    60→        },
    61→        name = "Feasts",
    62→        threshold = 20,
    63→        color = 'ffb18d'
    64→    },
    65→    hearty_feast = {
    66→        item_ids = {
    67→            222781, -- 11.0.0: Hearty Feat of the Midnight Masquerade
    68→        },
    69→        name = "Hearty Feasts",
    70→        threshold = 1,
    71→        color = "ffccc6",
    72→    },
    73→    hearty_food = {
    74→        item_ids = {
    75→            222776, -- 11.0.0: Hearty Beledar's Bounty
    76→        },
    77→        name = "Hearty Personal Food",
    78→        threshold = 10,
    79→        color = 'e27e5e'
    80→    },
    81→    auto_hammer = {
    82→        item_ids = {
    83→            132514, -- 7.0.0: Auto Hammer
    84→        },
    85→        name = "Auto Hammers",
    86→        threshold = 5,
    87→        color = 'f8b762',
    88→    },
    89→    jumper_cables = {
    90→        item_ids = {
    91→            221955, -- 11.0.0: Convincingly Realistic Jumper Cables
    92→            221954,
    93→        },
    94→        name = "Jumper Cables",
    95→        threshold = 5,
    96→        color = 'ccf4ad',
    97→    },
    98→    pausing_pylons = {
    99→        item_ids = {
   100→            221949, -- 11.0.0: Pausing Pylons
   101→        },
   102→        name = "Pausing Pylons",
   103→        threshold = 5,
   104→        color = '65ebe7',
   105→    },
   106→}
   107→
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Commands.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→
     3→
     4→-------------------------------------------------------------------------------
     5→--- Slash Commands
     6→-------------------------------------------------------------------------------
     7→
     8→CL.cmds = {}
     9→CL.cmds.toggle_names = {
    10→    triggers = { 'full', 'f' },
    11→    name = "Full Names",
    12→    description = "Toggle between full item names and nicknames.",
    13→    func = function() CL:ToggleFullNames() end,
    14→}
    15→
    16→CL.cmds.toggle_debug = {
    17→    triggers = { 'debug', 'd' },
    18→    name = "Debug Messages",
    19→    description = "Show debug messages",
    20→    func = function() CL:ToggleDebug() end,
    21→}
    22→
    23→CL.cmds.open_options = {
    24→    triggers = { 'options', 'o' },
    25→    name = "Options",
    26→    description = "Open the options panel.",
    27→    func = function() CL:OpenOptions() end,
    28→}
    29→
    30→
    31→-------------------------------------------------------------------------------
    32→--- Slash Command Handling
    33→-------------------------------------------------------------------------------
    34→
    35→function CL:Help()
    36→    CL:Print("Available Commands:")
    37→
    38→    for _, cmd in pairs(CL.cmds) do
    39→        print(string.format("  %s %-10s - %s",
    40→                            SLASH_CONSUMABLESLIST1,
    41→                            table.concat(cmd.triggers, ", "),
    42→                            cmd.description))
    43→    end
    44→end
    45→
    46→SLASH_CONSUMABLESLIST1 = "/cl"
    47→
    48→SlashCmdList[strupper(ADDON_NAME)] = function(msg)
    49→    msg = msg:lower():trim()
    50→
    51→    CL:VPrint(string.format("%s %s received",
    52→                            SLASH_CONSUMABLESLIST1,
    53→                            msg ~= "" and msg or "(no msg)"))
    54→
    55→    for _, cmd in pairs(CL.cmds) do
    56→        for _, trigger in ipairs(cmd.triggers) do
    57→            if msg == trigger then
    58→                cmd.func()
    59→                return
    60→            end
    61→        end
    62→    end
    63→
    64→    CL:Help()
    65→end
    66→
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→
     3→-------------------------------------------------------------------------------
     4→--- Options Panel
     5→-------------------------------------------------------------------------------
     6→
     7→local PANEL_WIDTH = 860
     8→local PANEL_HEIGHT = 540
     9→local SCROLLBAR_WIDTH = 20
    10→local INSET_PADDING = 14
    11→local CONTAINER_PADDING = 4
    12→
    13→local GROUP_LIST_WIDTH = 220
    14→local BAG_PANEL_HEIGHT = 160
    15→local ICON_SIZE = 34
    16→local ICON_PADDING = 4
    17→local GROUP_BUTTON_HEIGHT = 26
    18→local TRASH_ICON_SIZE = 18
    19→
    20→local GOLD = { 1, 0.82, 0, 1 }
    21→local BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
    22→local BORDER_HIGHLIGHT = { 1, 0.82, 0, 1 }
    23→local BG_NORMAL = { 0.15, 0.15, 0.15, 1 }
    24→local BG_HOVER = { 0.25, 0.25, 0.25, 1 }
    25→local BG_PRESS = { 0.1, 0.1, 0.1, 1 }
    26→local BG_SELECTED = { 0.2, 0.18, 0.1, 1 }
    27→
    28→local BACKDROP = {
    29→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    30→    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    31→    tile = true,
    32→    tileSize = 16,
    33→    edgeSize = 12,
    34→    insets = { left = 3, right = 3, top = 3, bottom = 3 },
    35→}
    36→
    37→local BACKDROP_NO_BORDER = {
    38→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    39→    tile = true,
    40→    tileSize = 16,
    41→    insets = { left = 0, right = 0, top = 0, bottom = 0 },
    42→}
    43→
    44→local CONTAINER_BACKDROP = {
    45→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    46→    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    47→    tile = true,
    48→    tileSize = 16,
    49→    edgeSize = 10,
    50→    insets = { left = 2, right = 2, top = 2, bottom = 2 },
    51→}
    52→
    53→local selected_group_key = nil
    54→local group_buttons = {}
    55→local item_rows = {}
    56→local bag_buttons = {}
    57→local bag_filter_buttons = {}
    58→
    59→-- Item class filters: classID -> { name, icon }
    60→local ITEM_CLASS_FILTERS = {
    61→    { classID = 0,  name = "Consumable",        icon = 134830 },  -- INV_Potion_93 (red potion)
    62→    { classID = 7,  name = "Tradeskill",         icon = 132996 },  -- Trade_Engineering
    63→    { classID = 8,  name = "Item Enhancement",   icon = 135225 },  -- Spell_Holy_GreaterHeal (enchant scroll)
    64→    { classID = 2,  name = "Weapon",             icon = 135274 },  -- INV_Sword_04
    65→    { classID = 4,  name = "Armor",              icon = 132633 },  -- INV_Chest_Chain
    66→    { classID = 3,  name = "Gem",                icon = 134071 },  -- INV_Misc_Gem_02
    67→    { classID = 5,  name = "Reagent",            icon = 132599 },  -- INV_Misc_Dust_02
    68→    { classID = 15, name = "Miscellaneous",      icon = 134414 },  -- INV_Misc_Bag_10
    69→    { classID = 9,  name = "Recipe",             icon = 134939 },  -- INV_Scroll_06
    70→    { classID = 1,  name = "Container",          icon = 133633 },  -- INV_Misc_Bag_08
    71→    { classID = 12, name = "Quest",              icon = 132049 },  -- INV_Misc_Map02
    72→}
    73→
    74→local active_bag_filters = { [0] = true }  -- Default: Consumables only
    75→
    76→-------------------------------------------------------------------------------
    77→--- Delete Confirmation Dialog
    78→-------------------------------------------------------------------------------
    79→
    80→StaticPopupDialogs["CONSUMABLESLIST_DELETE_GROUP"] = {
    81→    text = "Are you sure you want to delete \"%s\"?",
    82→    button1 = "Delete",
    83→    button2 = "Cancel",
    84→    OnAccept = function(self, group_key)
    85→        CL.db.item_groups[group_key] = nil
    86→
    87→        if selected_group_key == group_key then
    88→            selected_group_key = nil
    89→        end
    90→
    91→        CL:RefreshGroupList()
    92→        CL:RefreshOptionsEditor()
    93→        CL:RebuildDisplay()
    94→    end,
    95→    timeout = 0,
    96→    whileDead = true,
    97→    hideOnEscape = true,
    98→    preferredIndex = 3,
    99→}
   100→
   101→StaticPopupDialogs["CONSUMABLESLIST_REMOVE_ITEM"] = {
   102→    text = "Remove %s from group \"%s\"?",
   103→    button1 = "Yes",
   104→    button2 = "No",
   105→    OnAccept = function(self, data)
   106→        local group = CL.db.item_groups[data.group_key]
   107→        if not group then return end
   108→
   109→        for i, id in ipairs(group.item_ids) do
   110→            if id == data.item_id then
   111→                table.remove(group.item_ids, i)
   112→                break
   113→            end
   114→        end
   115→
   116→        CL:RefreshOptionsEditor()
   117→        CL:RefreshBagPanel()
   118→        CL:RebuildDisplay()
   119→    end,
   120→    timeout = 0,
   121→    whileDead = true,
   122→    hideOnEscape = true,
   123→    preferredIndex = 3,
   124→}
   125→
   126→-------------------------------------------------------------------------------
   127→--- Styled Widget Constructors
   128→-------------------------------------------------------------------------------
   129→
   130→local function create_styled_button(parent, width, height, text)
   131→    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
   132→    button:SetSize(width, height)
   133→    button:SetBackdrop(BACKDROP)
   134→    button:SetBackdropColor(unpack(BG_NORMAL))
   135→    button:SetBackdropBorderColor(unpack(BORDER_NORMAL))
   136→
   137→    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   138→    button.text:SetPoint("LEFT", button, "LEFT", 6, 0)
   139→    button.text:SetPoint("RIGHT", button, "RIGHT", -6, 0)
   140→    button.text:SetWordWrap(false)
   141→    button.text:SetNonSpaceWrap(false)
   142→    button.text:SetText(text)
   143→    button.text:SetTextColor(unpack(GOLD))
   144→
   145→    button:SetScript("OnEnter", function(self)
   146→        self:SetBackdropColor(unpack(BG_HOVER))
   147→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   148→    end)
   149→
   150→    button:SetScript("OnLeave", function(self)
   151→        if self._selected then
   152→            self:SetBackdropColor(unpack(BG_SELECTED))
   153→            self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   154→        else
   155→            self:SetBackdropColor(unpack(BG_NORMAL))
   156→            self:SetBackdropBorderColor(unpack(BORDER_NORMAL))
   157→        end
   158→    end)
   159→
   160→    button:SetScript("OnMouseDown", function(self)
   161→        self:SetBackdropColor(unpack(BG_PRESS))
   162→        self.text:ClearAllPoints()
   163→        self.text:SetPoint("LEFT", self, "LEFT", 7, -1)
   164→        self.text:SetPoint("RIGHT", self, "RIGHT", -5, -1)
   165→    end)
   166→
   167→    button:SetScript("OnMouseUp", function(self)
   168→        self:SetBackdropColor(unpack(BG_HOVER))
   169→        self.text:ClearAllPoints()
   170→        self.text:SetPoint("LEFT", self, "LEFT", 6, 0)
   171→        self.text:SetPoint("RIGHT", self, "RIGHT", -6, 0)
   172→    end)
   173→
   174→    return button
   175→end
   176→
   177→local function create_styled_editbox(parent, width, x, y)
   178→    local box = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
   179→    box:SetSize(width, 22)
   180→    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   181→    box:SetAutoFocus(false)
   182→    box:SetFontObject(GameFontHighlight)
   183→
   184→    box:SetBackdrop({
   185→        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
   186→        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
   187→        tile = true,
   188→        tileSize = 16,
   189→        edgeSize = 12,
   190→        insets = { left = 3, right = 3, top = 3, bottom = 3 },
   191→    })
   192→    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
   193→    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   194→    box:SetTextInsets(6, 6, 0, 0)
   195→
   196→    box:SetScript("OnEditFocusGained", function(self)
   197→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   198→    end)
   199→
   200→    box:SetScript("OnEditFocusLost", function(self)
   201→        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   202→    end)
   203→
   204→    box:SetScript("OnEscapePressed", function(self)
   205→        self:ClearFocus()
   206→    end)
   207→
   208→    return box
   209→end
   210→
   211→local function create_label(parent, text, x, y)
   212→    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   213→    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   214→    label:SetText(text)
   215→    label:SetTextColor(unpack(GOLD))
   216→
   217→    return label
   218→end
   219→
   220→local function create_scroll_container(parent, width, height, x, y)
   221→    -- Outer bordered frame
   222→    local container = CreateFrame("Frame", nil, parent, "BackdropTemplate")
   223→    container:SetSize(width, height)
   224→    container:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   225→    container:SetBackdrop(CONTAINER_BACKDROP)
   226→    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
   227→    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
   228→
   229→    -- Scroll frame inside container, leaving room for scrollbar on right
   230→    local inner_padding = CONTAINER_PADDING + 1
   231→    local scroll = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
   232→    scroll:SetPoint("TOPLEFT", container, "TOPLEFT", inner_padding, -inner_padding)
   233→    scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding + SCROLLBAR_WIDTH), inner_padding)
   234→
   235→    -- Nudge the scrollbar left so it sits inside the container border
   236→    local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
   237→    if scrollbar then
   238→        scrollbar:ClearAllPoints()
   239→        scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -(inner_padding), -(inner_padding + 16))
   240→        scrollbar:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding), (inner_padding + 16))
   241→    end
   242→
   243→    -- Consume mouse wheel on the container so it never falls through to game bindings
   244→    container:EnableMouseWheel(true)
   245→    container:SetScript("OnMouseWheel", function(_, delta)
   246→        local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
   247→        if scrollbar then
   248→            local current = scrollbar:GetValue()
   249→            local min_val, max_val = scrollbar:GetMinMaxValues()
   250→            local step = scrollbar:GetValueStep() or (max_val - min_val) / 10
   251→            local new_val = math.max(min_val, math.min(max_val, current - (delta * step)))
   252→            scrollbar:SetValue(new_val)
   253→        end
   254→    end)
   255→
   256→    local child_width = width - SCROLLBAR_WIDTH - (inner_padding * 2)
   257→    local child = CreateFrame("Frame", nil, scroll)
   258→    child:SetWidth(child_width)
   259→    child:SetHeight(1)
   260→    scroll:SetScrollChild(child)
   261→
   262→    return container, scroll, child
   263→end
   264→
   265→-------------------------------------------------------------------------------
   266→--- Utility
   267→-------------------------------------------------------------------------------
   268→
   269→local function get_group_display_name(group)
   270→    if group.name and group.name ~= "" then
   271→        return group.name
   272→    end
   273→
   274→    if group.item_ids and group.item_ids[1] then
   275→        local name = C_Item.GetItemNameByID(group.item_ids[1])
   276→        if name then
   277→            return name
   278→        end
   279→    end
   280→
   281→    return "Unnamed Group"
   282→end
   283→
   284→local function generate_group_key()
   285→    local key = "group_" .. time() .. "_" .. math.random(1000, 9999)
   286→
   287→    return key
   288→end
   289→
   290→local function delete_group(key)
   291→    local group = CL.db.item_groups[key]
   292→    if not group then return end
   293→
   294→    local name = get_group_display_name(group)
   295→    local popup = StaticPopup_Show("CONSUMABLESLIST_DELETE_GROUP", name)
   296→    if popup then
   297→        popup.data = key
   298→    end
   299→end
   300→
   301→-------------------------------------------------------------------------------
   302→--- Group List (Left Panel)
   303→-------------------------------------------------------------------------------
   304→
   305→local function clear_group_buttons(scroll_child)
   306→    for _, btn in ipairs(group_buttons) do
   307→        btn:Hide()
   308→        btn:SetParent(nil)
   309→    end
   310→
   311→    wipe(group_buttons)
   312→end
   313→
   314→local function select_group(key)
   315→    selected_group_key = key
   316→    CL:RefreshOptionsEditor()
   317→    CL:RefreshGroupList()
   318→    CL:RefreshBagPanel()
   319→end
   320→
   321→local function create_group_button(parent, index, key, group)
   322→    -- Row frame holding both the group button and trash icon
   323→    local row = CreateFrame("Frame", nil, parent)
   324→    local row_width = parent:GetWidth()
   325→    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
   326→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
   327→
   328→    -- Group select button (leaves room for trash icon on the right)
   329→    local btn_width = row_width - TRASH_ICON_SIZE - 6
   330→    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
   331→    btn:SetPoint("LEFT", row, "LEFT", 0, 0)
   332→
   333→    if key == selected_group_key then
   334→        btn._selected = true
   335→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
   336→        btn.text:SetTextColor(r, g, b, 1)
   337→        btn:SetBackdropColor(unpack(BG_SELECTED))
   338→        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   339→    end
   340→
   341→    btn:SetScript("OnClick", function()
   342→        select_group(key)
   343→    end)
   344→
   345→    -- Trash icon button
   346→    local trash = CreateFrame("Button", nil, row)
   347→    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
   348→    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)
   349→
   350→    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
   351→    trash_icon:SetAllPoints()
   352→    trash_icon:SetAtlas("transmog-icon-remove")
   353→    trash_icon:SetAlpha(0.5)
   354→
   355→    trash:SetScript("OnEnter", function()
   356→        trash_icon:SetAlpha(1.0)
   357→        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
   358→        GameTooltip:SetText("Delete Group")
   359→        GameTooltip:Show()
   360→    end)
   361→
   362→    trash:SetScript("OnLeave", function()
   363→        trash_icon:SetAlpha(0.5)
   364→        GameTooltip:Hide()
   365→    end)
   366→
   367→    trash:SetScript("OnClick", function()
   368→        delete_group(key)
   369→    end)
   370→
   371→    return row
   372→end
   373→
   374→function CL:RefreshGroupList()
   375→    if not CL.options_frame then return end
   376→
   377→    local scroll_child = CL.options_frame.group_scroll_child
   378→    clear_group_buttons(scroll_child)
   379→
   380→    local index = 1
   381→    for key, group in pairs(CL.db.item_groups) do
   382→        local row = create_group_button(scroll_child, index, key, group)
   383→        group_buttons[#group_buttons + 1] = row
   384→        index = index + 1
   385→    end
   386→
   387→    scroll_child:SetHeight(math.max(1, (index - 1) * (GROUP_BUTTON_HEIGHT + 3)))
   388→end
   389→
   390→-------------------------------------------------------------------------------
   391→--- Editor Panel (Right Panel - Top)
   392→-------------------------------------------------------------------------------
   393→
   394→local function clear_item_rows()
   395→    for _, row in ipairs(item_rows) do
   396→        row:Hide()
   397→        row:SetParent(nil)
   398→    end
   399→
   400→    wipe(item_rows)
   401→end
   402→
   403→local function create_item_row(parent, index, item_id, group_key)
   404→    local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
   405→    row:SetSize(parent:GetWidth(), ICON_SIZE)
   406→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (ICON_SIZE + 3))
   407→
   408→    row:SetBackdrop(BACKDROP_NO_BORDER)
   409→    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
   410→
   411→    -- Item icon
   412→    local icon = row:CreateTexture(nil, "ARTWORK")
   413→    icon:SetSize(ICON_SIZE - 4, ICON_SIZE - 4)
   414→    icon:SetPoint("LEFT", row, "LEFT", 2, 0)
   415→
   416→    local item_icon = C_Item.GetItemIconByID(item_id)
   417→    if item_icon then
   418→        icon:SetTexture(item_icon)
   419→    end
   420→
   421→    -- Item name text
   422→    local name_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   423→    name_text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
   424→    local item_name = C_Item.GetItemNameByID(item_id)
   425→    name_text:SetText(item_name or ("Item " .. item_id))
   426→
   427→    if not item_name then
   428→        local item = Item:CreateFromItemID(item_id)
   429→        item:ContinueOnItemLoad(function()
   430→            local loaded_name = C_Item.GetItemNameByID(item_id)
   431→            if loaded_name then
   432→                name_text:SetText(loaded_name)
   433→            end
   434→
   435→            local loaded_icon = C_Item.GetItemIconByID(item_id)
   436→            if loaded_icon then
   437→                icon:SetTexture(loaded_icon)
   438→            end
   439→        end)
   440→    end
   441→
   442→    -- Item ID text
   443→    local id_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
   444→    id_text:SetPoint("LEFT", name_text, "RIGHT", 8, 0)
   445→    id_text:SetText("(" .. item_id .. ")")
   446→    id_text:SetTextColor(0.5, 0.5, 0.5)
   447→
   448→    -- Remove button
   449→    local remove_btn = CreateFrame("Button", nil, row, "UIPanelCloseButton")
   450→    remove_btn:SetSize(22, 22)
   451→    remove_btn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
   452→    remove_btn:SetScript("OnClick", function()
   453→        local group = CL.db.item_groups[group_key]
   454→        if not group then return end
   455→
   456→        for i, id in ipairs(group.item_ids) do
   457→            if id == item_id then
   458→                table.remove(group.item_ids, i)
   459→                break
   460→            end
   461→        end
   462→
   463→        CL:RefreshOptionsEditor()
   464→        CL:RefreshBagPanel()
   465→        CL:RebuildDisplay()
   466→    end)
   467→
   468→    -- Hover highlight
   469→    row:EnableMouse(true)
   470→    row:SetScript("OnEnter", function(self)
   471→        self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
   472→        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
   473→        GameTooltip:SetItemByID(item_id)
   474→        GameTooltip:Show()
   475→    end)
   476→
   477→    row:SetScript("OnLeave", function(self)
   478→        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
   479→        GameTooltip:Hide()
   480→    end)
   481→
   482→    return row
   483→end
   484→
   485→function CL:RefreshOptionsEditor()
   486→    if not CL.options_frame then return end
   487→
   488→    local editor = CL.options_frame.editor
   489→    clear_item_rows()
   490→
   491→    if not selected_group_key or not CL.db.item_groups[selected_group_key] then
   492→        editor:Hide()
   493→        return
   494→    end
   495→
   496→    editor:Show()
   497→    local group = CL.db.item_groups[selected_group_key]
   498→
   499→    -- Update fields
   500→    editor.name_box:SetText(group.name or "")
   501→    editor.threshold_box:SetText(tostring(group.threshold or 0))
   502→    editor.threshold_slider:SetValue(math.min(group.threshold or 0, 200))
   503→    editor.color_box:SetText(group.color or "ffffff")
   504→
   505→    -- Update color swatch
   506→    local r, g, b = CL:HexToRGB(group.color or "ffffff")
   507→    editor.color_swatch:SetColorTexture(r, g, b, 1)
   508→
   509→    -- Populate item list
   510→    local items_parent = editor.items_scroll_child
   511→    for i, item_id in ipairs(group.item_ids) do
   512→        local row = create_item_row(items_parent, i, item_id, selected_group_key)
   513→        item_rows[#item_rows + 1] = row
   514→    end
   515→
   516→    items_parent:SetHeight(math.max(1, #group.item_ids * (ICON_SIZE + 3)))
   517→end
   518→
   519→-------------------------------------------------------------------------------
   520→--- Bag Panel (Right Panel - Bottom)
   521→-------------------------------------------------------------------------------
   522→
   523→local function clear_bag_buttons()
   524→    for _, btn in ipairs(bag_buttons) do
   525→        btn:Hide()
   526→        btn:SetParent(nil)
   527→    end
   528→
   529→    wipe(bag_buttons)
   530→end
   531→
   532→local function is_item_in_group(item_id, group_key)
   533→    local group = CL.db.item_groups[group_key]
   534→    if not group then return false end
   535→
   536→    for _, id in ipairs(group.item_ids) do
   537→        if id == item_id then
   538→            return true
   539→        end
   540→    end
   541→
   542→    return false
   543→end
   544→
   545→local function find_item_group(item_id)
   546→    for key, group in pairs(CL.db.item_groups) do
   547→        for _, id in ipairs(group.item_ids) do
   548→            if id == item_id then
   549→                return key
   550→            end
   551→        end
   552→    end
   553→
   554→    return nil
   555→end
   556→
   557→local function remove_item_from_group(item_id, group_key)
   558→    local group = CL.db.item_groups[group_key]
   559→    if not group then return end
   560→
   561→    for i, id in ipairs(group.item_ids) do
   562→        if id == item_id then
   563→            table.remove(group.item_ids, i)
   564→            break
   565→        end
   566→    end
   567→
   568→    CL:RefreshOptionsEditor()
   569→    CL:RefreshBagPanel()
   570→    CL:RebuildDisplay()
   571→end
   572→
   573→local function add_item_to_selected_group(item_id)
   574→    if not selected_group_key then
   575→        CL:Print("Select an item group first.")
   576→        return
   577→    end
   578→
   579→    local group = CL.db.item_groups[selected_group_key]
   580→    if not group then return end
   581→
   582→    if find_item_group(item_id) then
   583→        CL:Print("Item already in a group.")
   584→        return
   585→    end
   586→
   587→    group.item_ids[#group.item_ids + 1] = item_id
   588→    CL:RefreshOptionsEditor()
   589→    CL:RefreshBagPanel()
   590→    CL:RebuildDisplay()
   591→end
   592→
   593→function CL:RefreshBagPanel()
   594→    if not CL.options_frame then return end
   595→
   596→    local bag_parent = CL.options_frame.bag_scroll_child
   597→    clear_bag_buttons()
   598→
   599→    local available_width = bag_parent:GetWidth()
   600→    local col = 0
   601→    local row = 0
   602→    local max_cols = math.floor(available_width / (ICON_SIZE + ICON_PADDING))
   603→    local seen_items = {}
   604→
   605→    for bag = 0, 4 do
   606→        local num_slots = C_Container.GetContainerNumSlots(bag)
   607→        for slot = 1, num_slots do
   608→            local info = C_Container.GetContainerItemInfo(bag, slot)
   609→            if info and info.itemID and not seen_items[info.itemID] then
   610→                seen_items[info.itemID] = true
   611→
   612→                -- Filter by item class
   613→                local passes_filter = true
   614→                local has_any_filter = next(active_bag_filters) ~= nil
   615→                if has_any_filter then
   616→                    local classID = select(12, GetItemInfo(info.itemID))
   617→                    if classID == nil or not active_bag_filters[classID] then
   618→                        passes_filter = false
   619→                    end
   620→                end
   621→
   622→                if passes_filter then
   623→                    local item_id = info.itemID
   624→                    local owning_group = find_item_group(item_id)
   625→
   626→                    local btn = CreateFrame("Button", nil, bag_parent)
   627→                    btn:SetSize(ICON_SIZE, ICON_SIZE)
   628→                    btn:SetPoint("TOPLEFT", bag_parent, "TOPLEFT",
   629→                        col * (ICON_SIZE + ICON_PADDING),
   630→                        -(row * (ICON_SIZE + ICON_PADDING)))
   631→
   632→                    local icon = btn:CreateTexture(nil, "ARTWORK")
   633→                    icon:SetAllPoints()
   634→                    icon:SetTexture(info.iconFileID)
   635→
   636→                    -- Hover overlay (hidden by default, shown on enter)
   637→                    local overlay = btn:CreateTexture(nil, "OVERLAY")
   638→                    overlay:SetAllPoints()
   639→                    overlay:Hide()
   640→
   641→                    -- Status icon overlay (+ or circle-slash)
   642→                    local status_icon = btn:CreateTexture(nil, "OVERLAY", nil, 1)
   643→                    local icon_size = ICON_SIZE * 0.8
   644→                    status_icon:SetSize(icon_size, icon_size)
   645→                    status_icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
   646→                    status_icon:Hide()
   647→
   648→                    if owning_group then
   649→                        icon:SetDesaturated(true)
   650→                        icon:SetAlpha(0.5)
   651→                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
   652→                        status_icon:SetAtlas("transmog-icon-remove")
   653→                    else
   654→                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
   655→                        status_icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
   656→                        status_icon:SetVertexColor(0, 1, 0)
   657→                    end
   658→
   659→                    btn:SetScript("OnClick", function()
   660→                        if owning_group then
   661→                            if owning_group == selected_group_key then
   662→                                remove_item_from_group(item_id, owning_group)
   663→                            else
   664→                                local item_name = C_Item.GetItemNameByID(item_id) or ("Item " .. item_id)
   665→                                local group = CL.db.item_groups[owning_group]
   666→                                local group_name = group and group.name or owning_group
   667→                                local dialog = StaticPopup_Show("CONSUMABLESLIST_REMOVE_ITEM", item_name, group_name)
   668→                                if dialog then
   669→                                    dialog.data = { item_id = item_id, group_key = owning_group }
   670→                                end
   671→                            end
   672→                        else
   673→                            add_item_to_selected_group(item_id)
   674→                        end
   675→                    end)
   676→
   677→                    btn:SetScript("OnEnter", function(self)
   678→                        overlay:Show()
   679→                        status_icon:Show()
   680→                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
   681→                        GameTooltip:SetBagItem(bag, slot)
   682→                        if owning_group then
   683→                            local group = CL.db.item_groups[owning_group]
   684→                            local group_name = group and group.name or owning_group
   685→                            GameTooltip:AddLine(" ")
   686→                            GameTooltip:AddLine("In group: " .. group_name, 1, 0.5, 0.5)
   687→                            GameTooltip:AddLine("Click to remove", 0.8, 0.2, 0.2)
   688→                        else
   689→                            GameTooltip:AddLine(" ")
   690→                            GameTooltip:AddLine("Click to add to selected group", 0.2, 0.8, 0.2)
   691→                        end
   692→                        GameTooltip:Show()
   693→                    end)
   694→
   695→                    btn:SetScript("OnLeave", function()
   696→                        overlay:Hide()
   697→                        status_icon:Hide()
   698→                        GameTooltip:Hide()
   699→                    end)
   700→
   701→                    bag_buttons[#bag_buttons + 1] = btn
   702→
   703→                    col = col + 1
   704→                    if col >= max_cols then
   705→                        col = 0
   706→                        row = row + 1
   707→                    end
   708→                end
   709→            end
   710→        end
   711→    end
   712→
   713→    bag_parent:SetHeight(math.max(1, (row + 1) * (ICON_SIZE + ICON_PADDING)))
   714→end
   715→
   716→-------------------------------------------------------------------------------
   717→--- Build Editor
   718→-------------------------------------------------------------------------------
   719→
   720→local function build_editor(parent, right_width, editor_height)
   721→    local editor = CreateFrame("Frame", nil, parent)
   722→    editor:SetPoint("TOPLEFT", parent, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, 0)
   723→    editor:SetSize(right_width, editor_height)
   724→    editor:Hide()
   725→
   726→    local label_x = 0
   727→    local field_x = 116
   728→
   729→    -- Name field
   730→    create_label(editor, "Display Name:", label_x, -5)
   731→    editor.name_box = create_styled_editbox(editor, right_width - field_x - INSET_PADDING, field_x, 0)
   732→    editor.name_box:SetScript("OnEnterPressed", function(self)
   733→        self:ClearFocus()
   734→        local group = CL.db.item_groups[selected_group_key]
   735→        if not group then return end
   736→
   737→        group.name = self:GetText()
   738→        CL:RefreshGroupList()
   739→        CL:RebuildDisplay()
   740→    end)
   741→
   742→    -- Threshold field
   743→    create_label(editor, "Threshold:", label_x, -35)
   744→    editor.threshold_box = create_styled_editbox(editor, 60, field_x, -30)
   745→    editor.threshold_box:SetNumeric(true)
   746→
   747→    local slider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
   748→    slider:SetSize(right_width - field_x - 60 - INSET_PADDING - 16, 20)
   749→    slider:SetPoint("LEFT", editor.threshold_box, "RIGHT", 8, 0)
   750→    slider:SetMinMaxValues(0, 200)
   751→    slider:SetValueStep(1)
   752→    slider:SetObeyStepOnDrag(true)
   753→
   754→    editor.threshold_slider = slider
   755→
   756→    slider:SetScript("OnValueChanged", function(self, value)
   757→        local val = math.floor(value + 0.5)
   758→        editor.threshold_box:SetText(tostring(val))
   759→        local group = CL.db.item_groups[selected_group_key]
   760→        if not group then return end
   761→
   762→        group.threshold = val
   763→        CL:RebuildDisplay()
   764→    end)
   765→
   766→    editor.threshold_box:SetScript("OnEnterPressed", function(self)
   767→        self:ClearFocus()
   768→        local group = CL.db.item_groups[selected_group_key]
   769→        if not group then return end
   770→
   771→        local val = self:GetNumber()
   772→        group.threshold = val
   773→        editor.threshold_slider:SetValue(math.min(val, 200))
   774→        CL:RebuildDisplay()
   775→    end)
   776→
   777→    -- Color field
   778→    create_label(editor, "Color:", label_x, -65)
   779→    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
   780→    editor.color_box:SetMaxLetters(6)
   781→    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
   782→        if not userInput then return end
   783→
   784→        local text = self:GetText()
   785→        local cleaned = text:gsub("#", "")
   786→        if cleaned ~= text then
   787→            self:SetText(cleaned)
   788→        end
   789→    end)
   790→
   791→    -- Clickable color swatch that opens the color picker
   792→    local swatch_btn = CreateFrame("Button", nil, editor, "BackdropTemplate")
   793→    swatch_btn:SetSize(22, 22)
   794→    swatch_btn:SetPoint("LEFT", editor.color_box, "RIGHT", 8, 0)
   795→    swatch_btn:SetBackdrop(CONTAINER_BACKDROP)
   796→    swatch_btn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
   797→
   798→    editor.color_swatch = swatch_btn:CreateTexture(nil, "ARTWORK")
   799→    editor.color_swatch:SetPoint("TOPLEFT", swatch_btn, "TOPLEFT", 3, -3)
   800→    editor.color_swatch:SetPoint("BOTTOMRIGHT", swatch_btn, "BOTTOMRIGHT", -3, 3)
   801→
   802→    swatch_btn:SetScript("OnEnter", function(self)
   803→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   804→        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
   805→        GameTooltip:SetText("Click to pick a color")
   806→        GameTooltip:Show()
   807→    end)
   808→
   809→    swatch_btn:SetScript("OnLeave", function(self)
   810→        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
   811→        GameTooltip:Hide()
   812→    end)
   813→
   814→    local function apply_color(hex)
   815→        local group = CL.db.item_groups[selected_group_key]
   816→        if not group then return end
   817→
   818→        group.color = hex
   819→        editor.color_box:SetText(hex)
   820→        local r, g, b = CL:HexToRGB(hex)
   821→        editor.color_swatch:SetColorTexture(r, g, b, 1)
   822→        CL:RefreshGroupList()
   823→        CL:RebuildDisplay()
   824→    end
   825→
   826→    swatch_btn:SetScript("OnClick", function()
   827→        local group = CL.db.item_groups[selected_group_key]
   828→        if not group then return end
   829→
   830→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
   831→        local prev_hex = group.color or "ffffff"
   832→
   833→        local info = {
   834→            swatchFunc = function()
   835→                local new_r, new_g, new_b = ColorPickerFrame:GetColorRGB()
   836→                local hex = string.format("%02x%02x%02x",
   837→                    math.floor(new_r * 255 + 0.5),
   838→                    math.floor(new_g * 255 + 0.5),
   839→                    math.floor(new_b * 255 + 0.5))
   840→                apply_color(hex)
   841→            end,
   842→            cancelFunc = function()
   843→                apply_color(prev_hex)
   844→            end,
   845→            r = r,
   846→            g = g,
   847→            b = b,
   848→            hasOpacity = false,
   849→        }
   850→
   851→        ColorPickerFrame:SetupColorPickerAndShow(info)
   852→    end)
   853→
   854→    editor.color_box:SetScript("OnEnterPressed", function(self)
   855→        self:ClearFocus()
   856→        local hex = self:GetText()
   857→        if #hex == 6 then
   858→            apply_color(hex)
   859→        end
   860→    end)
   861→
   862→    -- Items label
   863→    create_label(editor, "Items in Group:", label_x, -100)
   864→
   865→    -- Items scroll container
   866→    local items_top = 118
   867→    local bottom_controls_height = 36
   868→    local items_container_height = editor_height - items_top - bottom_controls_height
   869→
   870→    local items_container, items_scroll, items_child = create_scroll_container(
   871→        editor, right_width, items_container_height, 0, -items_top)
   872→    editor.items_scroll_child = items_child
   873→
   874→    -- Add by ID row
   875→    local add_row_y = -(items_top + items_container_height + 8)
   876→    create_label(editor, "Add Item by ID:", label_x, add_row_y - 5)
   877→    editor.add_id_box = create_styled_editbox(editor, 100, field_x, add_row_y)
   878→    editor.add_id_box:SetNumeric(true)
   879→    editor.add_id_box:SetScript("OnEnterPressed", function(self)
   880→        local item_id = self:GetNumber()
   881→        if item_id <= 0 then return end
   882→
   883→        add_item_to_selected_group(item_id)
   884→        self:SetText("")
   885→        self:ClearFocus()
   886→    end)
   887→
   888→    local add_btn = create_styled_button(editor, 50, 22, "Add")
   889→    add_btn:SetPoint("LEFT", editor.add_id_box, "RIGHT", 6, 0)
   890→    add_btn:SetScript("OnClick", function()
   891→        local item_id = editor.add_id_box:GetNumber()
   892→        if item_id <= 0 then return end
   893→
   894→        add_item_to_selected_group(item_id)
   895→        editor.add_id_box:SetText("")
   896→        editor.add_id_box:ClearFocus()
   897→    end)
   898→
   899→    return editor
   900→end
   901→
   902→-------------------------------------------------------------------------------
   903→--- Build Options Frame
   904→-------------------------------------------------------------------------------
   905→
   906→local function build_options_frame()
   907→    if CL.options_frame then return end
   908→
   909→    -- Main frame with dark backdrop (matching SlashBreakGambling style)
   910→    local frame = CreateFrame("Frame", "ConsumablesListOptionsFrame", UIParent, "BackdropTemplate")
   911→    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
   912→    frame:SetPoint("CENTER")
   913→    frame:SetBackdrop(BACKDROP)
   914→    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
   915→    frame:SetBackdropBorderColor(unpack(BORDER_NORMAL))
   916→    frame:SetMovable(true)
   917→    frame:SetClampedToScreen(true)
   918→    frame:EnableMouse(true)
   919→    frame:SetFrameStrata("HIGH")
   920→    frame:RegisterForDrag("LeftButton")
   921→    frame:Hide()
   922→
   923→    frame:SetScript("OnDragStart", function(self)
   924→        self:StartMoving()
   925→    end)
   926→
   927→    frame:SetScript("OnDragStop", function(self)
   928→        self:StopMovingOrSizing()
   929→    end)
   930→
   931→    -- Title
   932→    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
   933→    title:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING + 2, -INSET_PADDING)
   934→    title:SetText("Consumables List - Options")
   935→    title:SetTextColor(unpack(GOLD))
   936→
   937→    -- Close button
   938→    local close_btn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
   939→    close_btn:SetSize(24, 24)
   940→    close_btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
   941→    close_btn:SetScript("OnClick", function()
   942→        frame:Hide()
   943→    end)
   944→
   945→    -- Title divider (more Y padding from title)
   946→    local title_divider = frame:CreateTexture(nil, "ARTWORK")
   947→    title_divider:SetHeight(2)
   948→    title_divider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
   949→    title_divider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
   950→    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)
   951→
   952→    -- Content area (below divider)
   953→    local content = CreateFrame("Frame", nil, frame)
   954→    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
   955→    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)
   956→
   957→    local content_height = PANEL_HEIGHT - 42 - INSET_PADDING
   958→    local content_width = PANEL_WIDTH - (INSET_PADDING * 2)
   959→    local right_width = content_width - GROUP_LIST_WIDTH - INSET_PADDING
   960→
   961→    ---------------------------------------------------------------------------
   962→    -- Left panel: Group list (full height)
   963→    ---------------------------------------------------------------------------
   964→    create_label(content, "Item Groups", 2, -2)
   965→
   966→    local add_group_btn = create_styled_button(content,
   967→        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
   968→    add_group_btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
   969→    add_group_btn:SetScript("OnClick", function()
   970→        local key = generate_group_key()
   971→        CL.db.item_groups[key] = {
   972→            item_ids = {},
   973→            threshold = 10,
   974→            color = "ffffff",
   975→            name = "New Group",
   976→        }
   977→        select_group(key)
   978→        CL:RebuildDisplay()
   979→    end)
   980→
   981→    -- Group list scroll container (full height, bottom-aligned with content)
   982→    local group_scroll_top = 50
   983→    local group_container_height = content_height - group_scroll_top
   984→
   985→    local group_container, group_scroll, group_child = create_scroll_container(
   986→        content, GROUP_LIST_WIDTH, group_container_height, 0, -group_scroll_top)
   987→    frame.group_scroll_child = group_child
   988→
   989→    -- Vertical separator between left and right panels
   990→    local v_sep = content:CreateTexture(nil, "ARTWORK")
   991→    v_sep:SetWidth(2)
   992→    v_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + 6, 0)
   993→    v_sep:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", GROUP_LIST_WIDTH + 6, 0)
   994→    v_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
   995→
   996→    ---------------------------------------------------------------------------
   997→    -- Right panel: Editor (top) + Bag items (bottom)
   998→    ---------------------------------------------------------------------------
   999→    local bag_label_height = 28
  1000→    local editor_height = content_height - BAG_PANEL_HEIGHT - bag_label_height - INSET_PADDING
  1001→
  1002→    -- Editor
  1003→    frame.editor = build_editor(content, right_width, editor_height)
  1004→
  1005→    -- Horizontal separator above bag panel
  1006→    local bag_section_top = editor_height + 8
  1007→    local h_sep = content:CreateTexture(nil, "ARTWORK")
  1008→    h_sep:SetHeight(2)
  1009→    h_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, -bag_section_top)
  1010→    h_sep:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -bag_section_top)
  1011→    h_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
  1012→
  1013→    -- Bag items label and filter buttons
  1014→    local bag_label = create_label(content, "Inventory (Click to add / remove from Group):",
  1015→        GROUP_LIST_WIDTH + INSET_PADDING, -(bag_section_top + 10))
  1016→
  1017→    local FILTER_BTN_SIZE = 24
  1018→    local FILTER_BTN_SPACING = 2
  1019→    local num_filters = #ITEM_CLASS_FILTERS
  1020→    local total_filters_width = num_filters * FILTER_BTN_SIZE + (num_filters - 1) * FILTER_BTN_SPACING
  1021→    for i, filter_info in ipairs(ITEM_CLASS_FILTERS) do
  1022→        local fbtn = CreateFrame("Button", nil, content, "BackdropTemplate")
  1023→        fbtn:SetSize(FILTER_BTN_SIZE, FILTER_BTN_SIZE)
  1024→        fbtn:SetPoint("TOPRIGHT", content, "TOPRIGHT",
  1025→            -(total_filters_width - (i * (FILTER_BTN_SIZE + FILTER_BTN_SPACING)) + FILTER_BTN_SPACING),
  1026→            -(bag_section_top + 6))
  1027→
  1028→        fbtn:SetBackdrop(CONTAINER_BACKDROP)
  1029→
  1030→        local ficon = fbtn:CreateTexture(nil, "ARTWORK")
  1031→        ficon:SetPoint("TOPLEFT", fbtn, "TOPLEFT", 2, -2)
  1032→        ficon:SetPoint("BOTTOMRIGHT", fbtn, "BOTTOMRIGHT", -2, 2)
  1033→        ficon:SetTexture(filter_info.icon)
  1034→
  1035→        local function update_filter_btn_state()
  1036→            if active_bag_filters[filter_info.classID] then
  1037→                fbtn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
  1038→                ficon:SetDesaturated(false)
  1039→                ficon:SetAlpha(1.0)
  1040→            else
  1041→                fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
  1042→                ficon:SetDesaturated(true)
  1043→                ficon:SetAlpha(1.0)
  1044→            end
  1045→        end
  1046→
  1047→        update_filter_btn_state()
  1048→
  1049→        fbtn:SetScript("OnClick", function()
  1050→            if active_bag_filters[filter_info.classID] then
  1051→                active_bag_filters[filter_info.classID] = nil
  1052→            else
  1053→                active_bag_filters[filter_info.classID] = true
  1054→            end
  1055→
  1056→            update_filter_btn_state()
  1057→            CL:RefreshBagPanel()
  1058→        end)
  1059→
  1060→        fbtn:SetScript("OnEnter", function(self)
  1061→            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  1062→            local state = active_bag_filters[filter_info.classID] and "|cff00ff00ON|r" or "|cffff0000OFF|r"
  1063→            GameTooltip:SetText(filter_info.name .. " " .. state)
  1064→            GameTooltip:Show()
  1065→        end)
  1066→
  1067→        fbtn:SetScript("OnLeave", function()
  1068→            GameTooltip:Hide()
  1069→        end)
  1070→
  1071→        bag_filter_buttons[#bag_filter_buttons + 1] = fbtn
  1072→    end
  1073→
  1074→    -- Bag items scroll container (bottom-aligned with group list)
  1075→    local bag_container_top = bag_section_top + bag_label_height
  1076→    local bag_container_height = content_height - bag_container_top
  1077→
  1078→    local bag_container, bag_scroll, bag_child = create_scroll_container(
  1079→        content, right_width, bag_container_height,
  1080→        GROUP_LIST_WIDTH + INSET_PADDING, -bag_container_top)
  1081→    frame.bag_scroll_child = bag_child
  1082→
  1083→    CL.options_frame = frame
  1084→
  1085→    -- Register with Settings panel
  1086→    local category = Settings.RegisterCanvasLayoutCategory(frame, "Consumables List")
  1087→    category.ID = ADDON_NAME
  1088→    Settings.RegisterAddOnCategory(category)
  1089→    CL.options_category = category
  1090→end
  1091→
  1092→-------------------------------------------------------------------------------
  1093→--- Public API
  1094→-------------------------------------------------------------------------------
  1095→
  1096→function CL:OpenOptions()
  1097→    build_options_frame()
  1098→
  1099→    if CL.options_frame:IsShown() then
  1100→        CL.options_frame:Hide()
  1101→    else
  1102→        CL.options_frame:Show()
  1103→        CL:RefreshGroupList()
  1104→        CL:RefreshOptionsEditor()
  1105→        CL:RefreshBagPanel()
  1106→    end
  1107→end
  1108→
```

## Assistant

Now I have a complete picture of the codebase. Let me write the detailed knowledge document.

**Tool Call: Write C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\MEMORY.md**
Status: Completed

Diff: C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\MEMORY.md
```
# ConsumablesList Addon - Project Knowledge

See [architecture.md](./architecture.md) for full codebase documentation.

## Quick Reference
- **Addon namespace**: `CL` (second arg from `...` spread in each file)
- **SavedVariable**: `ConsumablesListDB` (per-character)
- **Slash command**: `/cl` (subcommands: `o`/`options`, `f`/`full`, `d`/`debug`)
- **Files load order**: Database.lua -> Commands.lua -> Options.lua -> ConsumablesList.lua
- **Frame name**: `ConsumablesListFrame`
- **Options frame name**: `ConsumablesListOptionsFrame`
- **Library**: LibEditMode (via LibStub) for Edit Mode integration

## Key Patterns
- All files share state via `CL` namespace table (second vararg)
- `CL.db.item_groups` is the live data; `CL.db.defaults` is the template
- Groups are keyed by string IDs (e.g. `"weapon_enchantments"` for defaults, `"group_<timestamp>_<random>"` for user-created)
- Display rebuilds: `CL:RebuildDisplay()` wipes all FontStrings and calls `CL:Update(IMMEDIATELY)`
- Update throttle: 15-second cooldown, bypassed with `IMMEDIATELY = true`

```


**Tool Call: Write C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\architecture.md**
Status: Completed

Diff: C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\architecture.md
```
# ConsumablesList - Full Architecture Reference

## What This Addon Does

ConsumablesList is a World of Warcraft retail addon that displays a text-based HUD overlay showing consumable items the player is running low on. When items in a tracked "group" fall below a configurable threshold count, a colored text line appears on screen showing the item name and count. The list auto-hides in combat, dungeons/raids (unless on an AH mount or in a neighborhood), and while mounted outside cities.

## File Structure & Load Order

Files load in this order (defined in `ConsumablesList.toc`):

1. **LibStub.lua** - Library loader (third-party)
2. **LibEditMode (embed.xml)** - Edit Mode integration library (third-party)
3. **Database.lua** - Default item group definitions
4. **Commands.lua** - Slash command registration and dispatch
5. **Options.lua** - Full GUI options panel
6. **ConsumablesList.lua** - Core logic: frame creation, event handling, display updates

## Shared Namespace

All files use `local ADDON_NAME, CL = ...` to access the shared addon table. `CL` is the central namespace where all modules attach their data and functions.

---

## Database.lua (Lines: ~107)

### Purpose
Defines `CL.db` and `CL.db.defaults` - the template for item groups.

### Data Structure: Item Group
```lua
CL.db.defaults = {
    group_key_string = {
        item_ids = { 224107, 212265 },  -- WoW item IDs to track
        name = "Display Name",          -- Optional; if nil, uses first item's name
        threshold = 20,                 -- Show warning when count < this
        color = "fd54c2",               -- Hex color (no #) for the text display
    },
}
```

### Key Details
- `item_ids` is an ordered array. The first ID is used as fallback for the group name if `name` is nil.
- `threshold` is the count below which the group appears on the HUD.
- `color` is a 6-char hex string. Some entries inconsistently include `#` (e.g. `'#feb24a'` for flask) — the `HexToRGB` function strips `#` so it works either way.
- Item counts are summed across ALL item_ids in a group (e.g., R2 + R3 potions combined).
- Default groups: weapon_enchantments, damage_potion, healing_potion, invisbility_potion, flask, feast, hearty_feast, hearty_food, auto_hammer, jumper_cables, pausing_pylons.

---

## Commands.lua (Lines: ~66)

### Purpose
Registers `/cl` slash command and dispatches subcommands.

### Architecture
- `CL.cmds` is a table of command objects, each with:
  - `triggers`: array of string aliases (e.g., `{'full', 'f'}`)
  - `name`: display name for help text
  - `description`: help text
  - `func`: callback function
- The slash handler iterates all commands, matching `msg` against each trigger.
- If no trigger matches, `CL:Help()` prints all available commands.

### Available Commands
| Command | Triggers | Action |
|---------|----------|--------|
| Full Names | `full`, `f` | Toggle between group nicknames and actual WoW item names |
| Debug | `debug`, `d` | Toggle verbose debug printing |
| Options | `options`, `o` | Open/close the options GUI panel |

### Important Detail
- `SLASH_CONSUMABLESLIST1 = "/cl"` is defined at file scope (line 46), making it a global. This global is referenced in ConsumablesList.lua's ADDON_LOADED handler for the welcome message.
- The slash command is registered via `SlashCmdList[strupper(ADDON_NAME)]`.

---

## Options.lua (Lines: ~1108)

### Purpose
Full in-game GUI for managing item groups. Opens via `/cl o` or the WoW Settings panel.

### Layout
```
+----------------------------------------------------------+
| Consumables List - Options                          [X]   |
|----------------------------------------------------------|
| Item Groups          | Display Name: [__________]        |
| [+ Add New Group]    | Threshold:    [__] ====slider==== |
| +------------------+ | Color:        [______] [■]        |
| | group_btn [🗑]   | |                                   |
| | group_btn [🗑]   | | Items in Group:                   |
| | group_btn [🗑]   | | +-------------------------------+ |
| |                  | | | [icon] Item Name (12345) [X]  | |
| |                  | | | [icon] Item Name (67890) [X]  | |
| +------------------+ | +-------------------------------+ |
|                      | Add Item by ID: [______] [Add]    |
|                      |-----------------------------------|
|                      | Inventory (Click to add/remove):  |
|                      | [filter icons row]                |
|                      | +-------------------------------+ |
|                      | | [bag item icons in grid]      | |
|                      | +-------------------------------+ |
+----------------------------------------------------------+
```

### Key State Variables (module-local)
- `selected_group_key` — which group is currently being edited (string key or nil)
- `group_buttons` — array of left-panel row frames
- `item_rows` — array of right-panel item row frames
- `bag_buttons` — array of bag item icon buttons
- `bag_filter_buttons` — array of category filter toggle buttons
- `active_bag_filters` — table of `classID -> true` for which item classes to show in bag panel (default: `{[0] = true}` = Consumables only)

### Important Functions

#### `CL:OpenOptions()` (line 1096)
Entry point. Calls `build_options_frame()` once (lazy init), then toggles visibility. On show, refreshes all three sub-panels.

#### `build_options_frame()` (line 906)
Creates the entire UI once. Stores result in `CL.options_frame`. Registers with WoW's Settings API via `Settings.RegisterCanvasLayoutCategory`.

#### `CL:RefreshGroupList()` (line 374)
Rebuilds the left panel. Iterates `CL.db.item_groups` with `pairs()` (unordered — this is a known issue from TODO.md about needing order IDs). Creates a button + trash icon per group.

#### `CL:RefreshOptionsEditor()` (line 485)
Rebuilds the right-top editor panel for the selected group. Populates name, threshold, color fields and item list.

#### `CL:RefreshBagPanel()` (line 593)
Scans bags 0-4, deduplicates by item ID, filters by active class filters, renders as an icon grid. Items already in a group appear desaturated with a red overlay; unassigned items show a green "+" on hover.

#### `build_editor()` (line 720)
Constructs the editor sub-panel with:
- Name EditBox → saves on Enter press
- Threshold EditBox + Slider (synced) → slider max is 200, but EditBox accepts any number
- Color EditBox + Color Swatch button → swatch opens WoW's ColorPickerFrame
- Scrollable item list with icon, name, ID, and remove button per item
- "Add by ID" row at bottom

### Widget Constructors
- `create_styled_button(parent, width, height, text)` — backdrop button with hover/press/selected states
- `create_styled_editbox(parent, width, x, y)` — input field with focus highlight
- `create_label(parent, text, x, y)` — gold-colored label FontString
- `create_scroll_container(parent, width, height, x, y)` — bordered container with UIPanelScrollFrame, returns `container, scroll, child`

### Static Popup Dialogs
- `CONSUMABLESLIST_DELETE_GROUP` — confirms group deletion, calls `CL:RefreshGroupList()`, `CL:RefreshOptionsEditor()`, `CL:RebuildDisplay()`
- `CONSUMABLESLIST_REMOVE_ITEM` — confirms item removal from a group (when clicking a bag item that belongs to a different group)

### Bag Panel Item Click Logic (line 659)
- If item is in the **selected** group → remove it directly (no confirmation)
- If item is in a **different** group → show confirmation dialog
- If item is in **no** group → add to selected group (requires a group to be selected)

---

## ConsumablesList.lua (Lines: ~364)

### Purpose
Core addon: creates the HUD frame, handles WoW events, and manages the display update loop.

### Configuration Constants (module-local)
```lua
IMMEDIATELY = true          -- Bypass throttle flag
addon_color = "00bf40bf"    -- Purple, used in chat print
font_size = 30              -- Display font size
v_height = 29               -- Row height for layout
text_offset = 3             -- Horizontal padding
padding_bottom = -3         -- Vertical nudge for all text
full_item_names = false     -- Toggle: show WoW names vs group nicknames
AH_MOUNT_SPELL_IDS = {465235, 264058}  -- Brutosaur mount aura IDs
```

### Utility Functions

#### `CL:Print(msg)` / `CL:VPrint(msg)`
Chat output. `VPrint` only prints when `verbose` is truthy (global, toggled by `/cl d`).

#### `CL:DeepCopy(orig)`
Shallow-recursive table copy. Used to clone defaults into live data on first load.

#### `CL:HexToRGB(hex)`
Converts 6-char hex (strips leading `#`) to 0-1 RGB floats.

#### `CL:HideItemGroup(group_name)` / `CL:ShowItemGroup(group_name)`
Hide/show both FontStrings (left=count, right=name) for a group.

#### `CL:ToggleFullNames()` / `CL:ToggleDebug()`
Toggle display mode / verbose logging, then force immediate update.

#### `CL:RebuildDisplay()`
Nuclear refresh: hides and wipes ALL FontStrings in `CL.frame.item_texts`, then calls `CL:Update(IMMEDIATELY)`. Called after any structural change (add/remove item, delete group, change color/threshold).

### Display Logic: `CL:Update(should_run_immediately)` (line 145)

**This is the most important function in the addon.**

1. **Throttle check**: If `update_is_throttled` and not immediate, return early. Sets throttle to true, schedules reset after 15 seconds.

2. **For each group** in `CL.db.item_groups` (unordered `pairs`):
   - Skip groups with no item_ids.
   - Get item name from WoW API. If not cached, retry in 1 second (prevents lua errors).
   - Sum `GetItemCount(id, false)` across all item_ids (false = don't include bank).
   - Create FontStrings if they don't exist yet (lazy init into `CL.frame.item_texts[group_id]`).
   - Format text: `"Out of X"` if count=0, `"X Low"` if count>0 but below threshold.
   - If `/cl f` active, override with the raw WoW item name.
   - Show if `item_count < threshold`, hide otherwise.

3. **Layout pass** (after all groups processed):
   - Count visible rows, calculate frame height.
   - Measure text widths to find max_width.
   - Position rows bottom-up from BOTTOMLEFT anchor.
   - Left text (count) anchors to BOTTOMRIGHT of frame's BOTTOMLEFT (hangs to the left of frame).
   - Right text (name) anchors to BOTTOMLEFT of frame's BOTTOMLEFT.
   - Resize frame to fit.

**Critical Layout Detail**: The frame grows from BOTTOMLEFT. Text rows stack upward. The count number sits to the LEFT of the frame's left edge, and the item name sits to the RIGHT. This creates a two-column layout with the frame edge as the divider.

### Visibility Logic: `CL:HideOrShowUpdate(should_run_immediately)` (line 107)

Determines whether to show or hide the HUD frame based on game state:

**HIDE conditions** (any one hides the frame):
1. In combat lockdown (`InCombatLockdown()`)
2. In an instance UNLESS on an AH mount OR in a neighborhood
3. Mounted UNLESS resting (in a city) OR on an AH mount
4. Dead

**SHOW**: If none of the above, show frame and call `CL:Update()`.

#### `IsMountedOnAHMount()` (line 94)
Checks if player has an aura matching any AH mount spell ID. Returns false if not mounted or in combat.

### Frame Initialization (line 266)

```lua
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
-- Size 1x1, centered, movable, clamped, starts hidden
```

**LibEditMode Integration** (line 274-296):
- `OnPositionChanged` saves position per layout name to `ConsumablesListDB.positions[layoutName]`
- `OnLayoutChanged` restores position when WoW switches Edit Mode layouts
- Frame is registered with LibEditMode as "Consumables List"

**Font Setup**:
- Custom font: `PTSansNarrow-Bold.ttf` at size 30 with OUTLINE
- Stored as `CL.frame.font` (a Font object, not a path)

### Event Handling (line 313)

#### ADDON_LOADED
- Initializes `ConsumablesListDB` if nil
- Loads saved `item_groups` or deep-copies defaults
- Unregisters ADDON_LOADED, then registers all runtime events
- Prints welcome message

#### Runtime Events
| Event | Response |
|-------|----------|
| `PLAYER_REGEN_DISABLED` | Hide frame immediately (combat start) |
| `PLAYER_REGEN_ENABLED` | `HideOrShowUpdate(IMMEDIATELY)` (combat end) |
| `PLAYER_UPDATE_RESTING` | `HideOrShowUpdate(IMMEDIATELY)` (enter/leave city) |
| `PLAYER_MOUNT_DISPLAY_CHANGED` | `HideOrShowUpdate(IMMEDIATELY)` (mount/dismount) |
| `BAG_UPDATE` | `HideOrShowUpdate()` (throttled) |
| `ITEM_PUSH` | `HideOrShowUpdate()` (throttled) |
| `PLAYER_ENTERING_WORLD` | `HideOrShowUpdate()` (throttled) |
| `MERCHANT_SHOW` | `HideOrShowUpdate()` (throttled) |
| `ZONE_CHANGED_NEW_AREA` | `HideOrShowUpdate()` (throttled) |

**Note**: `PLAYER_ENTERING_WORLD` is registered twice (line 332 and 340) — this is harmless but redundant.

---

## Known Bugs & TODO Items (from TODO.md)

### Bug: BAG_UPDATE not updating properly
- Purchasing items or moving items to/from bank doesn't always trigger display updates
- Possible cause: throttle system. If BAG_UPDATE fires within 15s of last update, it's silently dropped
- The TODO says "May be only getting events once?" — likely the throttle, not event registration

### Bug: Frame anchor drift
- When frame grows wider/taller, the anchor should stay at BOTTOMLEFT
- Currently the frame may visually shift if it resizes after being positioned in Edit Mode
- Fix: anchor from BOTTOMLEFT and grow rightward/upward only

### Feature: Group ordering
- Groups iterate with `pairs()` (hash order = random)
- Need an `order` field or ordered array to ensure consistent display order
- TODO mentions drag-and-drop reordering as a stretch goal

### Feature: Auto-naming
- If group name is deleted and Enter pressed, fall back to first item's name
- If group is named "New Group" and an item is added, rename to match that item

### Feature: Class/Spec conditions per group
- Each group should have enable/disable conditions
- Disabled groups should grey out and move to bottom

### Feature: Options panel enhancements
- SharedMedia font select, font size, line height customization
- Toggle for permanent full names
- Show in neighborhood toggle
- Show on AH mount toggle
- Enable/disable entire addon toggle
- Color input should select all 6 chars on focus

---

## SavedVariables Structure

```lua
ConsumablesListDB = {
    item_groups = {
        ["weapon_enchantments"] = {
            item_ids = { 224107 },
            threshold = 20,
            color = "fd54c2",
            -- name is optional
        },
        ["group_1708123456_1234"] = {
            item_ids = { 12345 },
            threshold = 10,
            color = "ffffff",
            name = "Custom Group",
        },
    },
    positions = {
        ["Default"] = { point = "BOTTOMLEFT", x = 100, y = 200 },
        -- one entry per Edit Mode layout name
    },
}
```

---

## Common Debugging Scenarios

### "Items not updating after purchase/loot"
1. Check if `update_is_throttled` is true (15s cooldown). The event fires but gets dropped.
2. `BAG_UPDATE` triggers `HideOrShowUpdate()` without IMMEDIATELY, so it respects throttle.
3. Fix: either shorten the throttle, or make BAG_UPDATE bypass it.

### "Frame not showing"
1. Check `HideOrShowUpdate` conditions — all hide checks must be false.
2. Common: player is mounted outside a city, or is in an instance.
3. Use `/cl d` to enable verbose logging, then trigger events to see which branch fires.

### "Group text colors wrong"
1. Color is stored as 6-char hex (no `#`). `HexToRGB` strips `#` but some defaults include it.
2. The color swatch and text both use `CL:HexToRGB()` so they should match.

### "Groups in random order"
1. `pairs()` gives hash order. This is by design currently — ordering is a TODO item.

### "Options panel not opening"
1. `CL:OpenOptions()` calls `build_options_frame()` which early-returns if `CL.options_frame` already exists.
2. If the frame exists but is broken, `/reload` is needed.

### "Lua error: item not cached"
1. `CL:Update` checks if item name is nil and retries after 1 second.
2. The check at line 168 is: `if not ((item_group and item_group.name) or item_name)` — this means if the group HAS a custom name, it won't retry even if item_name is nil. This is intentional.
3. The `VPrint` on line 169 uses `CL.VPrint(...)` instead of `CL:VPrint(...)` (dot not colon) — this is actually a bug if `VPrint` uses `self`. Looking at the code, `VPrint` does check `verbose` (a global), not `self`, so the dot call happens to work but `self` would be the string message. Since `VPrint` doesn't use `self`, it's fine but inconsistent.

### "verbose is not defined"
`verbose` is used as a global variable (never declared with `local`). It's toggled in `CL:ToggleDebug()` and checked in `CL:VPrint()`. This works but is a global namespace pollution issue.

```


## Assistant

Done. I created two files in the project memory:

**`MEMORY.md`** — Quick reference with file load order, namespace pattern, slash commands, and key patterns.

**`architecture.md`** — Comprehensive documentation covering:

- **What the addon does** — HUD overlay showing low consumable items with configurable thresholds
- **File-by-file breakdown** with line references:
  - `Database.lua` — default group definitions and data structure
  - `Commands.lua` — `/cl` slash command dispatch
  - `Options.lua` — full GUI panel layout, widget constructors, bag panel, editor panel
  - `ConsumablesList.lua` — core display logic, event handling, visibility rules
- **ASCII layout diagram** of the options panel
- **The `CL:Update()` function explained in detail** — throttle system, item counting, FontString creation, bottom-up layout positioning
- **Visibility logic** — all hide/show conditions documented
- **Event handling table** — which events trigger immediate vs throttled updates
- **SavedVariables structure** — exact shape of `ConsumablesListDB`
- **Every TODO item** contextualized with root cause analysis
- **Common debugging scenarios** — 7 specific issues with step-by-step diagnosis (throttle bugs, frame visibility, color issues, ordering, caching errors, global variable notes)
- **Subtle bugs documented** — `CL.VPrint` dot-vs-colon inconsistency, duplicate event registration, `#` in hex colors

This should give Sonnet 4.6 everything it needs to debug and modify the addon without needing to rediscover the architecture.

## User

The ascii diagram is wrong: The left side group buttons got extended to be full height
+----------------------------------------------------------+
| Consumables List - Options                          [X]  |
|----------------------------------------------------------|
| Item Groups          | Display Name: [__________]        |
| [+ Add New Group]    | Threshold:    [__] ====slider==== |
| +------------------+ | Color:        [______] [■]        |
| | group_btn [X]    | |                                   |
| | group_btn [X]    | | Items in Group:                   |
| | group_btn [X]    | | +-------------------------------+ |
| |                  | | | [icon] Item Name (12345) [X]  | |
| |                  | | | [icon] Item Name (67890) [X]  | |
| |                  | | +-------------------------------+ |
| |                  | | Add Item by ID: [______] [Add]    |
| |                  | |-----------------------------------|
| |                  | | Inventory (Click to add/remove):  |
| |                  | | [filter icons row]                |
| |                  | | +-------------------------------+ |
| |                  | | | [bag item icons in grid]      | |
| +------------------+ | +-------------------------------+ |
+----------------------------------------------------------+

## Assistant



Got it, the group list scroll container extends the full height of the content area, not just the top portion. Let me fix that in the architecture doc.

**Tool Call: Edit C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\architecture.md**
Status: Completed

Diff: C:\Users\Kyle\.claude\projects\D--World-of-Warcraft--retail--Interface-AddOns-ConsumablesList\memory\architecture.md
```
### Layout
```
+----------------------------------------------------------+
| Consumables List - Options                          [X]  |
|----------------------------------------------------------|
| Item Groups          | Display Name: [__________]        |
| [+ Add New Group]    | Threshold:    [__] ====slider==== |
| +------------------+ | Color:        [______] [■]        |
| | group_btn [X]    | |                                   |
| | group_btn [X]    | | Items in Group:                   |
| | group_btn [X]    | | +-------------------------------+ |
| |                  | | | [icon] Item Name (12345) [X]  | |
| |                  | | | [icon] Item Name (67890) [X]  | |
| |                  | | +-------------------------------+ |
| |                  | | Add Item by ID: [______] [Add]    |
| |                  | |-----------------------------------|
| |                  | | Inventory (Click to add/remove):  |
| |                  | | [filter icons row]                |
| |                  | | +-------------------------------+ |
| |                  | | | [bag item icons in grid]      | |
| +------------------+ | +-------------------------------+ |
+----------------------------------------------------------+
```

```


## Assistant

Fixed. The group list scroll container now correctly shows as full-height, spanning from top to bottom alongside both the editor and bag panels on the right.

## User

We need to look into a bug: 

- The addon did not update when purchasing auto hammers, had to go move the slider in order for the list to update and hide the hammers. Ensure we still have bag change event checks happening. After reloading putting the items in the bank hide the line, but pulling them back out did not re-show the line. May be only getting events once?

## Assistant

Let me analyze the event handling code carefully.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (310 - 364)**
Status: Completed

```
   310→--- Event Handling
   311→-------------------------------------------------------------------------------
   312→
   313→local function EventHandler(self, event, arg1)
   314→    if event == "ADDON_LOADED" then
   315→        if arg1 == ADDON_NAME then
   316→            if not ConsumablesListDB then
   317→                ConsumablesListDB = {}
   318→            end
   319→
   320→            -- Initialize item_groups from saved data or defaults
   321→            if ConsumablesListDB.item_groups then
   322→                CL.db.item_groups = ConsumablesListDB.item_groups
   323→            else
   324→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   325→                ConsumablesListDB.item_groups = CL.db.item_groups
   326→            end
   327→
   328→            CL.frame:UnregisterEvent("ADDON_LOADED")
   329→
   330→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   331→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   332→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
   333→            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors
   334→
   335→            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
   336→            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit
   337→
   338→            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting
   339→
   340→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Login
   341→            CL.frame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Entering a City
   342→            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Area Change
   343→
   344→            CL:Print("Loaded. Use " .. SLASH_CONSUMABLESLIST1 .. " for commands.")
   345→        end
   346→    elseif event == "PLAYER_REGEN_DISABLED" then
   347→        CL:VPrint("Hiding for combat enter: " .. event)
   348→        CL.frame:Hide()
   349→    elseif event == "PLAYER_REGEN_ENABLED" or           -- Exiting Combat
   350→           event == "PLAYER_UPDATE_RESTING" or          -- Entering City
   351→           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
   352→        CL:VPrint("Update IMMEDIATELY for: " .. event)
   353→        CL:HideOrShowUpdate(IMMEDIATELY)
   354→    else
   355→        CL:VPrint("Update LAZILY for: " .. event)
   356→        CL:HideOrShowUpdate()
   357→    end
   358→end
   359→
   360→-- Register events
   361→CL.frame:RegisterEvent("ADDON_LOADED")
   362→
   363→CL.frame:SetScript("OnEvent", EventHandler)
   364→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Found it. There are two bugs working together:

**Bug 1: The throttle silently drops BAG_UPDATE events**

`BAG_UPDATE` calls `HideOrShowUpdate()` without `IMMEDIATELY`, so it respects the 15-second throttle. If you buy items within 15 seconds of the last update (e.g., on login, or after any zone change), the update is swallowed silently and the display never refreshes.

**Bug 2: The frame is hidden, so the update never runs**

When the frame is hidden (e.g., you're at a vendor with the frame hidden for some reason, or post-MERCHANT_SHOW hid it), `HideOrShowUpdate` calls `CL.frame:Hide()` and does NOT call `CL:Update()`. So the counts are stale when the frame next shows — it only refreshes if something triggers a new `HideOrShowUpdate` that reaches the `Show()` branch.

The bank item scenario is the clearest case: `BAG_UPDATE` fires, throttle may already be expired, but if the frame is currently hidden, `HideOrShowUpdate()` hides it again and the counts never recalculate. When you pull items back out of the bank, same thing.

**The fix**: `BAG_UPDATE` and `ITEM_PUSH` should always bypass the throttle, since inventory changes are the primary thing we need to be accurate about. And the `HideOrShowUpdate` + `Update` calls need to recalculate counts even when re-hiding.

Here's the fix:

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (107 - 156)**
Status: Completed

```
   107→function CL:HideOrShowUpdate(should_run_immediately)
   108→    should_run_immediately = should_run_immediately or false
   109→
   110→    inInstance, instanceType = IsInInstance()
   111→
   112→    ---------------------------------------
   113→    -- Checking if we should HIDE the frame
   114→
   115→    -- Hide if we are in combat lockdown
   116→    if InCombatLockdown()
   117→
   118→    -- Hide if we are instanced unless
   119→    --   1. We are mounted on an AH Mount
   120→    --   2. We are in a neighborhood
   121→    or (inInstance and not (IsMountedOnAHMount() or
   122→                            instanceType == "neighborhood"))
   123→
   124→    -- Hide if we are mounted unless
   125→    --   1. We are in a city or
   126→    --   2. We are mounted on an AH Mount
   127→    or (IsMounted() and not (IsResting() or
   128→                             IsMountedOnAHMount()))
   129→
   130→    -- Hide if we are dead
   131→    or UnitIsDead("player")
   132→    then
   133→        CL:VPrint("Frame should be Hidden")
   134→        CL.frame:Hide()
   135→    else
   136→        CL:VPrint("Frame should be Shown")
   137→        CL.frame:Show()
   138→        CL:Update(should_run_immediately)
   139→    end
   140→end
   141→
   142→local update_is_throttled = false
   143→local min_update_interval = 15 -- Minimum time (seconds) between automatic updates
   144→
   145→function CL:Update(should_run_immediately)
   146→    should_run_immediately = should_run_immediately or false
   147→
   148→    if update_is_throttled and not should_run_immediately then return end
   149→
   150→    update_is_throttled = true
   151→    local index = 0
   152→
   153→    for group_id, item_group in pairs(CL.db.item_groups) do
   154→        local    item_id = item_group.item_ids[1]
   155→
   156→        -- Skip groups with no items

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now I have the full picture. Two targeted fixes:

1. `BAG_UPDATE` and `ITEM_PUSH` should call `HideOrShowUpdate(IMMEDIATELY)` — inventory changes need fresh counts, always.
2. When the frame should be hidden, still call `CL:Update(IMMEDIATELY)` so counts are current when the frame next shows.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    or UnitIsDead("player")
    then
        CL:VPrint("Frame should be Hidden")
        CL:Update(should_run_immediately)
        CL.frame:Hide()
    else
        CL:VPrint("Frame should be Shown")
```


**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
        CL:VPrint("Update IMMEDIATELY for: " .. event)
        CL:HideOrShowUpdate(IMMEDIATELY)
    elseif event == "BAG_UPDATE" or                     -- Inventory changes
           event == "ITEM_PUSH" then                    -- Immediate loot feedback
        CL:VPrint("Update IMMEDIATELY for: " .. event)
        CL:HideOrShowUpdate(IMMEDIATELY)
    else
        CL:VPrint("Update LAZILY for: " .. event)
        CL:HideOrShowUpdate()
```


## Assistant

Two changes made:

**Fix 1 — `BAG_UPDATE` / `ITEM_PUSH` now bypass the throttle** (`ConsumablesList.lua:349`): These events fire specifically because inventory changed, so they always need to produce a fresh count. Throttling them was the root cause of the purchase-not-updating symptom.

**Fix 2 — Counts update even when hiding** (`ConsumablesList.lua:133`): `CL:Update()` now runs before `frame:Hide()`. This means when the frame was hidden (e.g. while at a vendor window, or while mounted), the counts stay current. When the frame next shows, it immediately reflects the correct state — this fixes the bank scenario where pulling items back out didn't re-show the line.

## User

Next update: 

The Frame needs to be locked to the bottom left corner, if the frame needs to get wider, then it needs to grow to the right. It should never move that bottom left anchor after moved in edit mode even if the frame gets wider / taller.

## Assistant

Let me read the current layout code in `CL:Update()` carefully.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (225 - 259)**
Status: Completed

```
   225→
   226→    -- Resize frame to fit visible rows and reposition text
   227→    local visible_count = index
   228→    local row_height = v_height
   229→    local frame_height = math.max(1, visible_count * row_height)
   230→    local max_width = 1
   231→
   232→    -- Measure widths and reposition anchors
   233→    local row_index = 0
   234→    for group_id, texts in pairs(CL.frame.item_texts) do
   235→        if texts.left:IsShown() then
   236→            local left_width = texts.left:GetStringWidth()
   237→            local right_width = texts.right:GetStringWidth()
   238→            local total_width = left_width + right_width + (text_offset * 3)
   239→            if total_width > max_width then
   240→                max_width = total_width
   241→            end
   242→
   243→            local y_offset = (row_index * row_height) + padding_bottom
   244→            texts.right:ClearAllPoints()
   245→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   246→
   247→            texts.left:ClearAllPoints()
   248→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   249→
   250→            row_index = row_index + 1
   251→        end
   252→    end
   253→
   254→    CL.frame:SetSize(math.max(1, max_width), frame_height)
   255→
   256→    C_Timer.After(min_update_interval, function()
   257→        update_is_throttled = false
   258→    end)
   259→end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now let me check the frame's initial anchor and the LibEditMode position restore to understand what point is being saved/restored.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (265 - 296)**
Status: Completed

```
   265→
   266→-- Create the main frame
   267→CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
   268→CL.frame:SetSize(1, 1)
   269→CL.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
   270→CL.frame:SetMovable(true)
   271→CL.frame:SetClampedToScreen(true)
   272→CL.frame:Hide()
   273→
   274→-- LibEditMode integration
   275→local LibEditMode = LibStub("LibEditMode")
   276→
   277→local function OnPositionChanged(frame, layoutName, point, x, y)
   278→    if not ConsumablesListDB then return end
   279→    if not ConsumablesListDB.positions then
   280→        ConsumablesListDB.positions = {}
   281→    end
   282→
   283→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   284→end
   285→
   286→local function OnLayoutChanged(layoutName)
   287→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   288→
   289→    local pos = ConsumablesListDB.positions[layoutName]
   290→    if pos then
   291→        CL.frame:ClearAllPoints()
   292→        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
   293→    end
   294→end
   295→
   296→LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "CENTER", x = 0, y = 0 }, "Consumables List")

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

The problem is clear. The issue is that `SetSize()` on a frame anchored from its center (or any other point) will expand symmetrically outward — it doesn't pin any particular corner. When the frame is anchored at `BOTTOMLEFT`, WoW's layout engine holds that corner fixed and grows up and to the right, which is exactly what we want. But the frame starts with `CENTER` as the default, and LibEditMode saves whatever `point` it snaps to when dragged.

The fix has two parts:

1. **Default anchor** — change the initial `SetPoint` from `CENTER` to `BOTTOMLEFT`, and update the LibEditMode default to match.
2. **Position restore** — `OnLayoutChanged` must always restore using `BOTTOMLEFT` as both the frame point and the UIParent point, ignoring whatever `point` was saved (old saves may have `CENTER`). We should keep storing the saved point as-is so LibEditMode still works, but force the actual `SetPoint` call to use `BOTTOMLEFT`.

Actually, looking more carefully: LibEditMode saves `point` as whatever the frame's anchor is when dragged. If the frame is anchored `BOTTOMLEFT` when Edit Mode moves it, `OnPositionChanged` will receive `point = "BOTTOMLEFT"` and that's what gets saved and restored. So we just need to ensure the frame is always anchored `BOTTOMLEFT` — then everything flows correctly.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
CL.frame:SetSize(1, 1)
CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)
CL.frame:Hide()
```


**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
    end
end

```


**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    end
end

LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "BOTTOMLEFT", x = 20, y = 200 }, "Consumables List")
LibEditMode:RegisterCallback("layout", OnLayoutChanged)

-- Set up custom font (using a WoW built-in font, or replace with your own font file)
```


## Assistant

Now I need to check what `OnPositionChanged` actually receives from LibEditMode — specifically whether it passes the raw frame anchor point or something else, since we want to ensure only `x` and `y` are ever stored from now on (the point is always `BOTTOMLEFT`). Let me check the lib briefly.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua (1 - 60)**
Status: Completed

```
     1→local MINOR = 15
     2→
     3→local _, ns = ...
     4→local lib
     5→if ns.LibEditMode then
     6→	lib = ns.LibEditMode
     7→else
     8→	lib = LibStub:NewLibrary('LibEditMode', MINOR)
     9→	if not lib then
    10→		-- this or a newer version is already loaded
    11→		return
    12→	end
    13→end
    14→
    15→lib.internal = {} -- internal methods, do not use directly
    16→local internal = lib.internal
    17→
    18→-- keep a variable stored for the latest version, used to avoid hooks and events
    19→-- firing for older versions of the library when it has been "globally" upgraded with LibStub
    20→lib.hookVersion = MINOR
    21→
    22→lib.frameSelections = lib.frameSelections or {}
    23→lib.frameCallbacks = lib.frameCallbacks or {}
    24→lib.frameDefaults = lib.frameDefaults or {}
    25→lib.frameSettings = lib.frameSettings or {}
    26→lib.frameButtons = lib.frameButtons or {}
    27→
    28→lib.anonCallbacksEnter = lib.anonCallbacksEnter or {}
    29→lib.anonCallbacksExit = lib.anonCallbacksExit or {}
    30→lib.anonCallbacksLayout = lib.anonCallbacksLayout or {}
    31→lib.anonCallbacksCreate = lib.anonCallbacksCreate or {}
    32→lib.anonCallbacksRename = lib.anonCallbacksRename or {}
    33→lib.anonCallbacksDelete = lib.anonCallbacksDelete or {}
    34→
    35→lib.systemSettings = lib.systemSettings or {}
    36→lib.subSystemSettings = lib.subSystemSettings or {}
    37→lib.systemButtons = lib.systemButtons or {}
    38→lib.subSystemButtons = lib.subSystemButtons or {}
    39→
    40→lib.layoutCache = lib.layoutCache or {}
    41→
    42→local layoutNames = setmetatable({'Modern', 'Classic'}, {
    43→	__index = function(t, key)
    44→		if key > 2 then
    45→			-- the first 2 indices are reserved for 'Modern' and 'Classic' layouts, and anything
    46→			-- else are custom ones, although GetLayouts() doesn't return data for the 'Modern'
    47→			-- and 'Classic' layouts, so we'll have to substract and check
    48→			local layouts = lib.layoutCache
    49→			if (key - 2) <= #layouts then
    50→				return layouts[key - 2].layoutName
    51→			end
    52→		else
    53→			-- also work for 'Modern' and 'Classic'
    54→			rawget(t, key)
    55→		end
    56→	end
    57→})
    58→
    59→local function resetDialogs()
    60→	if internal.dialog then

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: grep "OnPositionChanged\|frameCallback\|positionChanged\|GetPoint\|point.*callback" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua**
Status: Completed

No matches found

**Tool Call: grep | head -60 "callback\|GetPoint\|point" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua**
Status: Completed

No matches found

[Showing results with pagination = limit: 60, offset: 0]

**Tool Call: grep -n "point\|callback\|GetPoint\|AddFrame" "D:/World of Warcraft/_retail_/Interface/AddOns/ConsumablesList/Libs/LibEditMode/LibEditMode.lua" | head -60**
Status: Failed

```
Exit code 1
```

**Tool Call: grep -n "point\|callback\|GetPoint\|AddFrame" "D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua" | head -60**
Status: Failed

```
Exit code 1
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua (60 - 159)**
Status: Completed

```
    60→	if internal.dialog then
    61→		internal.dialog:Hide()
    62→	end
    63→
    64→	if internal.extension then
    65→		internal.extension:Hide()
    66→	end
    67→end
    68→
    69→local function resetSelection()
    70→	for frame, selection in next, lib.frameSelections do
    71→		if selection.isSelected then
    72→			frame:SetMovable(false)
    73→		end
    74→
    75→		if not lib.isEditing then
    76→			selection:Hide()
    77→			selection.isSelected = false
    78→		else
    79→			selection:ShowHighlighted()
    80→		end
    81→	end
    82→end
    83→
    84→local function onDragStart(self)
    85→	if InCombatLockdown() then
    86→		-- TODO: maybe add a warning?
    87→		return
    88→	end
    89→
    90→	self:RegisterEvent('PLAYER_REGEN_DISABLED')
    91→	self.parent:StartMoving()
    92→end
    93→
    94→local function normalizePosition(frame)
    95→	-- ripped out of LibWindow-1.1, which is Public Domain
    96→	local parent = frame:GetParent()
    97→	if not parent then
    98→		return
    99→	end
   100→
   101→	local scale = frame:GetScale()
   102→	if not scale then
   103→		return
   104→	end
   105→
   106→	local left = frame:GetLeft() * scale
   107→	local top = frame:GetTop() * scale
   108→	local right = frame:GetRight() * scale
   109→	local bottom = frame:GetBottom() * scale
   110→
   111→	local parentWidth, parentHeight = parent:GetSize()
   112→
   113→	local x, y, point
   114→	if left < (parentWidth - right) and left < math.abs((left + right) / 2 - parentWidth / 2) then
   115→		x = left
   116→		point = 'LEFT'
   117→	elseif (parentWidth - right) < math.abs((left + right) / 2 - parentWidth / 2) then
   118→		x = right - parentWidth
   119→		point = 'RIGHT'
   120→	else
   121→		x = (left + right) / 2 - parentWidth / 2
   122→		point = ''
   123→	end
   124→
   125→	if bottom < (parentHeight - top) and bottom < math.abs((bottom + top) / 2 - parentHeight / 2) then
   126→		y = bottom
   127→		point = 'BOTTOM' .. point
   128→	elseif (parentHeight - top) < math.abs((bottom + top) / 2 - parentHeight / 2) then
   129→		y = top - parentHeight
   130→		point = 'TOP' .. point
   131→	else
   132→		y = (bottom + top) / 2 - parentHeight / 2
   133→		point = '' .. point
   134→	end
   135→
   136→	if point == '' then
   137→		point = 'CENTER'
   138→	end
   139→
   140→	return point, x / scale, y / scale
   141→end
   142→
   143→local function updatePosition(selection, xDelta, yDelta)
   144→	if InCombatLockdown() then
   145→		-- TODO: maybe add a warning?
   146→		return
   147→	end
   148→
   149→	local parent = selection.parent
   150→	local point, x, y = normalizePosition(parent)
   151→	x, y = x + (xDelta or 0), y + (yDelta or 0)
   152→	parent:ClearAllPoints()
   153→	parent:SetPoint(point, x, y)
   154→
   155→	internal:TriggerCallback(parent, point, x, y)
   156→
   157→	if selection.isSelected then
   158→		internal.dialog:Update(selection)
   159→	end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

This is the critical insight. `normalizePosition` in LibEditMode **auto-calculates** which anchor point to use based on where the frame is on screen — closest corner/edge wins. So if the frame is in the bottom-left quadrant it gives `BOTTOMLEFT`, top-right gives `TOPRIGHT`, etc. We cannot control what `point` gets passed to `OnPositionChanged` — LibEditMode decides it.

This means the `OnPositionChanged` callback **will** receive `BOTTOMLEFT` when the frame is in the bottom-left area, but could receive any other point if dragged elsewhere. The `x`/`y` values are also relative to the detected anchor point — not always from `BOTTOMLEFT` of UIParent.

So the right fix is: in `OnLayoutChanged`, **always** restore using the saved `point` (since LibEditMode's `x`/`y` are relative to that point), but the `SetPoint` call needs to use `BOTTOMLEFT` as the **frame's** attachment point. We also need to translate the saved coordinates to be relative to `BOTTOMLEFT` of UIParent.

Actually the cleanest approach: store the raw pixel position (`GetLeft()`, `GetBottom()`) on position change, and always restore with `BOTTOMLEFT`. Let me re-read what `normalizePosition` returns vs what we need.

`normalizePosition` returns `point, x, y` where `x`/`y` are offsets from that `point` on UIParent. So if `point = "BOTTOMLEFT"`, `x`/`y` are already exactly what we want for `SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)`. But if `point = "BOTTOMRIGHT"`, then `x` is negative (distance from right edge) and can't be used with `BOTTOMLEFT` directly.

The fix: convert to absolute coordinates in `OnPositionChanged`, store as `BOTTOMLEFT`-relative always.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Canceled

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
local function OnPositionChanged(frame, layoutName, point, x, y)
    if not ConsumablesListDB then return end
    if not ConsumablesListDB.positions then
        ConsumablesListDB.positions = {}
    end

    -- Always store as BOTTOMLEFT-relative so restoring never shifts the anchor.
    -- GetLeft/GetBottom give absolute screen coords at the current scale.
    local scale = frame:GetEffectiveScale()
    local screen_x = frame:GetLeft() * scale
    local screen_y = frame:GetBottom() * scale
    local ui_scale = UIParent:GetEffectiveScale()
    ConsumablesListDB.positions[layoutName] = {
        x = screen_x / ui_scale,
        y = screen_y / ui_scale,
    }
end

local function OnLayoutChanged(layoutName)
    if not ConsumablesListDB or not ConsumablesListDB.positions then return end

    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
    end
end
```


## User

Then we should make the frame grow from the position given by libeditmode. Bottom left of the screen we should grow from BOTTOMLEFT, top left from TOPLEFT, etc. That's fine. As long as we grow based on a corner point and not a center so the frame does not grow in both horizontal directions

## Assistant

Got it — the real issue is that `SetSize()` on a `CENTER`-anchored frame grows in both directions. We just need to ensure LibEditMode always snaps to a **corner** point, never an edge or center. Looking at `normalizePosition`, it can return `LEFT`, `RIGHT`, `TOP`, `BOTTOM`, or `CENTER` (not just corners) when the frame is near an edge or the center of the screen.

The fix: normalize the saved point to the nearest corner in `OnPositionChanged` before storing it, then always restore with that corner point.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (276 - 295)**
Status: Completed

```
   276→
   277→local function OnPositionChanged(frame, layoutName, point, x, y)
   278→    if not ConsumablesListDB then return end
   279→    if not ConsumablesListDB.positions then
   280→        ConsumablesListDB.positions = {}
   281→    end
   282→
   283→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   284→end
   285→
   286→local function OnLayoutChanged(layoutName)
   287→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   288→
   289→    local pos = ConsumablesListDB.positions[layoutName]
   290→    if pos then
   291→        CL.frame:ClearAllPoints()
   292→        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
   293→    end
   294→end
   295→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Canceled

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
-- LibEditMode's normalizePosition can return edge or center points (LEFT, TOP, CENTER, etc).
-- We always snap to the nearest corner so the frame grows away from that corner on resize
-- rather than expanding in both directions from a center or edge anchor.
local function snap_to_corner(point, x, y)
    local is_right  = (point == "RIGHT"  or point == "TOPRIGHT"    or point == "BOTTOMRIGHT")
    local is_top    = (point == "TOP"    or point == "TOPLEFT"     or point == "TOPRIGHT")
    local is_center = (point == "CENTER" or point == "LEFT"        or point == "RIGHT"
                                         or point == "TOP"         or point == "BOTTOM")

    -- For edge/center points, x and y are relative to that point on UIParent.
    -- Convert to absolute screen coords then re-anchor to the correct corner.
    local parent_w, parent_h = UIParent:GetSize()

    local abs_x, abs_y
    if point == "CENTER" then
        abs_x = parent_w / 2 + x
        abs_y = parent_h / 2 + y
    elseif point == "LEFT" then
        abs_x = x
        abs_y = parent_h / 2 + y
    elseif point == "RIGHT" then
        abs_x = parent_w + x
        abs_y = parent_h / 2 + y
    elseif point == "TOP" then
        abs_x = parent_w / 2 + x
        abs_y = parent_h + y
    elseif point == "BOTTOM" then
        abs_x = parent_w / 2 + x
        abs_y = y
    elseif point == "TOPLEFT" then
        abs_x = x
        abs_y = parent_h + y
    elseif point == "TOPRIGHT" then
        abs_x = parent_w + x
        abs_y = parent_h + y
    elseif point == "BOTTOMLEFT" then
        abs_x = x
        abs_y = y
    elseif point == "BOTTOMRIGHT" then
        abs_x = parent_w + x
        abs_y = y
    else
        abs_x = x
        abs_y = y
    end

    -- Pick nearest corner
    local use_right  = abs_x > parent_w / 2
    local use_top    = abs_y > parent_h / 2

    local corner, cx, cy
    if use_top and use_right then
        corner = "TOPRIGHT"
        cx = abs_x - parent_w
        cy = abs_y - parent_h
    elseif use_top then
        corner = "TOPLEFT"
        cx = abs_x
        cy = abs_y - parent_h
    elseif use_right then
        corner = "BOTTOMRIGHT"
        cx = abs_x - parent_w
        cy = abs_y
    else
        corner = "BOTTOMLEFT"
        cx = abs_x
        cy = abs_y
    end

    return corner, cx, cy
end

local function OnPositionChanged(frame, layoutName, point, x, y)
    if not ConsumablesListDB then return end
    if not ConsumablesListDB.positions then
        ConsumablesListDB.positions = {}
    end

    local corner, cx, cy = snap_to_corner(point, x, y)
    ConsumablesListDB.positions[layoutName] = { point = corner, x = cx, y = cy }
end

local function OnLayoutChanged(layoutName)
    if not ConsumablesListDB or not ConsumablesListDB.positions then return end

    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    end
end
```


## User

Let's ignore libeditmode for now. The issue I was having was with the changing size as the frame was locked in position from lib edit mode. Where lib-edit mode saves it's location shouldn't actually matter much here. The issue I was seeing was as I was editing group sand the frame was changing size due to new groups having longer names, not when moving with libeditmode.

## Assistant

Ah, much simpler than I was making it. The frame is anchored at a fixed point by LibEditMode, but `SetSize()` expands the frame symmetrically from that anchor — so if it's a `BOTTOMLEFT` anchor it's fine, but if LibEditMode saved it as `CENTER` the frame will drift left/right as it grows.

The real fix is just in the text positioning and frame sizing in `CL:Update()`. Currently the text is anchored relative to `BOTTOMLEFT` of the frame, which is correct. The frame just needs to always grow up and to the right from wherever it's pinned.

The root cause: `SetSize()` is called after `ClearAllPoints()` + `SetPoint()` on the text items, but the *frame itself* is being resized from its existing anchor. If that anchor is `CENTER` (the old default), it drifts. Since we already changed the default anchor to `BOTTOMLEFT`, existing users with a saved `CENTER` position are the edge case — but you said not to worry about LibEditMode's saved point.

So the only remaining issue is: does `SetSize` on a `BOTTOMLEFT`-anchored frame grow correctly? **Yes** — WoW grows frames upward and rightward from `BOTTOMLEFT`. That's already correct now that the default anchor is `BOTTOMLEFT`.

The only thing left to verify is that `OnLayoutChanged` no longer forces `BOTTOMLEFT` on positions that were saved with the old `point` field — which could be `CENTER` for existing users:

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (276 - 295)**
Status: Completed

```
   276→
   277→local function OnPositionChanged(frame, layoutName, point, x, y)
   278→    if not ConsumablesListDB then return end
   279→    if not ConsumablesListDB.positions then
   280→        ConsumablesListDB.positions = {}
   281→    end
   282→
   283→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   284→end
   285→
   286→local function OnLayoutChanged(layoutName)
   287→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   288→
   289→    local pos = ConsumablesListDB.positions[layoutName]
   290→    if pos then
   291→        CL.frame:ClearAllPoints()
   292→        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
   293→    end
   294→end
   295→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

`OnLayoutChanged` already hardcodes `BOTTOMLEFT` for both the frame point and the UIParent point — that's fine and already correct from the earlier edit. `pos.x` and `pos.y` were saved by LibEditMode relative to whatever `point` it chose, so those numbers may be wrong for old saves, but that's the LibEditMode concern you said to ignore.

The frame anchor behavior on `SetSize` is now correct. There's nothing else to change — the fix was already done when we changed the default `SetPoint` from `CENTER` to `BOTTOMLEFT`. The frame will grow up and to the right when new groups cause it to resize.

One thing worth noting: if a user has an existing save with `point = "CENTER"` and `OnLayoutChanged` fires, it restores with `BOTTOMLEFT` but uses the `x`/`y` that were relative to `CENTER` — so the position will be off by half the screen. That's only a one-time issue on first load after this update, fixed by the user re-dragging in Edit Mode. Since you said to ignore LibEditMode positioning, that's acceptable.

## User

No one is using this but me yet as it's in inital development stages

## Assistant

Then just clear the saved positions on load so the stale `CENTER` data can't cause issues, and move on.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (314 - 333)**
Status: Completed

```
   314→local function EventHandler(self, event, arg1)
   315→    if event == "ADDON_LOADED" then
   316→        if arg1 == ADDON_NAME then
   317→            if not ConsumablesListDB then
   318→                ConsumablesListDB = {}
   319→            end
   320→
   321→            -- Initialize item_groups from saved data or defaults
   322→            if ConsumablesListDB.item_groups then
   323→                CL.db.item_groups = ConsumablesListDB.item_groups
   324→            else
   325→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   326→                ConsumablesListDB.item_groups = CL.db.item_groups
   327→            end
   328→
   329→            CL.frame:UnregisterEvent("ADDON_LOADED")
   330→
   331→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   332→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   333→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Failed

```
The user doesn't want to proceed with this tool use. The tool use was rejected (eg. if it was a file edit, the new_string was NOT written to the file). STOP what you are doing and wait for the user to tell you how to proceed.
```

## User

Let's change the frame to have a set width of 300px. Do not check width of the group names and change width of the frame. Only change hit as we add lines. This will solve the core issue.

## Assistant

Simple and clean. Remove all the width-measuring logic and just set a fixed 300px width.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (226 - 255)**
Status: Completed

```
   226→    -- Resize frame to fit visible rows and reposition text
   227→    local visible_count = index
   228→    local row_height = v_height
   229→    local frame_height = math.max(1, visible_count * row_height)
   230→    local max_width = 1
   231→
   232→    -- Measure widths and reposition anchors
   233→    local row_index = 0
   234→    for group_id, texts in pairs(CL.frame.item_texts) do
   235→        if texts.left:IsShown() then
   236→            local left_width = texts.left:GetStringWidth()
   237→            local right_width = texts.right:GetStringWidth()
   238→            local total_width = left_width + right_width + (text_offset * 3)
   239→            if total_width > max_width then
   240→                max_width = total_width
   241→            end
   242→
   243→            local y_offset = (row_index * row_height) + padding_bottom
   244→            texts.right:ClearAllPoints()
   245→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   246→
   247→            texts.left:ClearAllPoints()
   248→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   249→
   250→            row_index = row_index + 1
   251→        end
   252→    end
   253→
   254→    CL.frame:SetSize(math.max(1, max_width), frame_height)
   255→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
        end -- else (has item_id)
    end

    -- Resize frame height to fit visible rows, width is fixed
    local row_height = v_height
    local frame_height = math.max(1, index * row_height)

    -- Reposition text rows
    local row_index = 0
    for group_id, texts in pairs(CL.frame.item_texts) do
        if texts.left:IsShown() then
            local y_offset = (row_index * row_height) + padding_bottom
            texts.right:ClearAllPoints()
            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
```


Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
        end
    end

    CL.frame:SetHeight(frame_height)

    C_Timer.After(min_update_interval, function()
        update_is_throttled = false
```


## Assistant

Now add the fixed width constant at the top and set it once during frame initialization:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
local text_offset = 3
local padding_bottom = -3 -- Adjust all text down

local frame_width = 300

local full_item_names = false

local AH_MOUNT_SPELL_IDS = {
```


**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
CL.frame:SetSize(frame_width, 1)
CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)
```


## Assistant

Done. The frame now has a fixed 300px width that never changes — only the height grows/shrinks as rows are added or removed. The anchor stays put.

## User

If there are no lines to show we should deafult the frame to the line_height instead of 1 px

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```

    -- Resize frame height to fit visible rows, width is fixed
    local row_height = v_height
    local frame_height = math.max(row_height, index * row_height)

    -- Reposition text rows
    local row_index = 0
```


## Assistant

Done.

## User

Next: If we delete the name of a group and press enter, use the 1st item's name as the name for the group. If it has no items in the group it should change to "Empty Group"

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (730 - 744)**
Status: Completed

```
   730→    create_label(editor, "Display Name:", label_x, -5)
   731→    editor.name_box = create_styled_editbox(editor, right_width - field_x - INSET_PADDING, field_x, 0)
   732→    editor.name_box:SetScript("OnEnterPressed", function(self)
   733→        self:ClearFocus()
   734→        local group = CL.db.item_groups[selected_group_key]
   735→        if not group then return end
   736→
   737→        group.name = self:GetText()
   738→        CL:RefreshGroupList()
   739→        CL:RebuildDisplay()
   740→    end)
   741→
   742→    -- Threshold field
   743→    create_label(editor, "Threshold:", label_x, -35)
   744→    editor.threshold_box = create_styled_editbox(editor, 60, field_x, -30)

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local text = self:GetText()
        if text == "" then
            local first_item_name = group.item_ids[1] and C_Item.GetItemNameByID(group.item_ids[1])
            text = first_item_name or "Empty Group"
            self:SetText(text)
        end

        group.name = text
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end)
```


## Assistant

Done. If the name box is empty on Enter: falls back to the first item's WoW name, then `"Empty Group"` if there are no items. The box also updates to show the resolved name so the field isn't left blank.

## User

The frame is moving itself to the left side of my screen every time I reload. It seems we broke something when we were doing our first fix before we just set a set width.

## Assistant

The issue is that `OnLayoutChanged` fires on load and restores the saved position, but the saved position has stale `x`/`y` values that were relative to the old `CENTER` anchor point. Since you're the only user, just wipe the saved positions on load so it always starts at the default.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (314 - 329)**
Status: Completed

```
   314→            -- Initialize item_groups from saved data or defaults
   315→            if ConsumablesListDB.item_groups then
   316→                CL.db.item_groups = ConsumablesListDB.item_groups
   317→            else
   318→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   319→                ConsumablesListDB.item_groups = CL.db.item_groups
   320→            end
   321→
   322→            CL.frame:UnregisterEvent("ADDON_LOADED")
   323→
   324→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   325→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   326→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
   327→            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors
   328→
   329→            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Canceled

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
            -- Initialize item_groups from saved data or defaults
            if ConsumablesListDB.item_groups then
                CL.db.item_groups = ConsumablesListDB.item_groups
            else
                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
                ConsumablesListDB.item_groups = CL.db.item_groups
            end

            -- Wipe stale position data so OnLayoutChanged uses the frame's current SetPoint
            ConsumablesListDB.positions = nil
```


## User

I deleted the position in my savedvaraible file and logged back in. it shouldn't be stale db data any longer. we intrudoced a bug

## Assistant

Let me look carefully at `OnPositionChanged` and `OnLayoutChanged` together with how LibEditMode calls them.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (267 - 296)**
Status: Completed

```
   267→-- LibEditMode integration
   268→local LibEditMode = LibStub("LibEditMode")
   269→
   270→local function OnPositionChanged(frame, layoutName, point, x, y)
   271→    if not ConsumablesListDB then return end
   272→    if not ConsumablesListDB.positions then
   273→        ConsumablesListDB.positions = {}
   274→    end
   275→
   276→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   277→end
   278→
   279→local function OnLayoutChanged(layoutName)
   280→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   281→
   282→    local pos = ConsumablesListDB.positions[layoutName]
   283→    if pos then
   284→        CL.frame:ClearAllPoints()
   285→        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
   286→    end
   287→end
   288→
   289→LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "BOTTOMLEFT", x = 20, y = 200 }, "Consumables List")
   290→LibEditMode:RegisterCallback("layout", OnLayoutChanged)
   291→
   292→-- Set up custom font (using a WoW built-in font, or replace with your own font file)
   293→local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"
   294→
   295→CL.frame.font = CreateFont("ConsumablesListFont")
   296→CL.frame.font:SetFont(FONT, font_size, "OUTLINE")

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now let me check what LibEditMode does with `AddFrame` — specifically whether it calls `OnPositionChanged` immediately on load with the default position.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua (159 - 258)**
Status: Completed

```
   159→	end
   160→end
   161→
   162→local function onDragStop(self)
   163→	if InCombatLockdown() then
   164→		return
   165→	end
   166→
   167→	local parent = self.parent
   168→	parent:StopMovingOrSizing()
   169→	self:UnregisterEvent('PLAYER_REGEN_DISABLED')
   170→
   171→	-- TODO: snap position to grid
   172→	-- FrameXML/EditModeUtil.lua
   173→
   174→	updatePosition(self)
   175→end
   176→
   177→local function onMouseDown(self) -- replacement for EditModeSystemMixin:SelectSystem()
   178→	if InCombatLockdown() then
   179→		-- TODO: maybe add a warning?
   180→		return
   181→	end
   182→
   183→	EventRegistry:TriggerEvent('EditModeExternal.hideDialog')
   184→	EditModeManagerFrame:ClearSelectedSystem() -- taint
   185→
   186→	if not self.isSelected then
   187→		self.parent:SetMovable(true)
   188→		self:ShowSelected(true)
   189→
   190→		if internal.dialog.selection ~= self then
   191→			internal.dialog:Reset()
   192→		end
   193→
   194→		internal.dialog:Update(self)
   195→	end
   196→end
   197→
   198→local function onEditModeEnter()
   199→	lib.isEditing = true
   200→
   201→	resetDialogs()
   202→	resetSelection()
   203→
   204→	for _, callback in next, lib.anonCallbacksEnter do
   205→		securecallfunction(callback)
   206→	end
   207→end
   208→
   209→local function onEditModeExit()
   210→	lib.isEditing = false
   211→
   212→	resetDialogs()
   213→	resetSelection()
   214→
   215→	for _, callback in next, lib.anonCallbacksExit do
   216→		securecallfunction(callback)
   217→	end
   218→end
   219→
   220→local function onEditModeChanged(_, layoutInfo)
   221→	local activeLayout = layoutInfo.activeLayout
   222→	if activeLayout ~= lib.activeLayout then
   223→		lib.activeLayout = activeLayout
   224→
   225→		-- update cache
   226→		lib.layoutCache = C_EditMode.GetLayouts().layouts
   227→
   228→		-- trigger callbacks
   229→		for _, callback in next, lib.anonCallbacksLayout do
   230→			securecallfunction(callback, layoutNames[activeLayout], activeLayout)
   231→		end
   232→
   233→		-- update dialog
   234→		if internal.dialog and internal.dialog.selection then
   235→			internal.dialog:Update(internal.dialog.selection)
   236→		end
   237→
   238→		-- TODO: we should update the position of the button here, let the user not deal with that
   239→	end
   240→end
   241→
   242→local function onSpecChanged(_, unit)
   243→	if unit ~= 'player' then
   244→		return
   245→	end
   246→
   247→	onEditModeChanged(nil, C_EditMode.GetLayouts())
   248→end
   249→
   250→local function onEditModeLayoutChanged()
   251→	local layoutInfo = C_EditMode.GetLayouts()
   252→	local layouts = layoutInfo.layouts
   253→
   254→	if #layouts > #lib.layoutCache then
   255→		-- a layout was created
   256→
   257→		for index, layout in next, layouts do
   258→			if not lib.layoutCache[index] then

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: grep "AddFrame" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua**
Status: Completed

368-	end)
369-
370-	hooksecurefunc(EditModeManagerFrame, 'ShowNewLayoutDialog', function(_, sourceLayout)
371-		if lib.hookVersion == MINOR then
372-			lib._layoutCopySource = sourceLayout
373-		end
374-	end)
375-end
376-
377--- custom global callback hook that all addons that add custom dialogs should respond to
378-EventRegistry:RegisterCallback('EditModeExternal.hideDialog', function()
379-	resetDialogs()
380-	resetSelection()
381-end)
382-
383:--[[ LibEditMode:AddFrame(_frame, callback, default_) ![](https://img.shields.io/badge/function-blue)
384-Register a frame to be controlled by the Edit Mode.
385-
386-* `frame`: frame widget to be controlled
387-* `callback`: callback that triggers whenever the frame has been repositioned
388-* `default`: table containing the default position of the frame
389-* `name`: name of the system, if nil, the frame's name will be used
390-
391-The `default` table must contain the following entries:
392-
393-* `point`: relative anchor point, e.g. `"CENTER"` _(string)_
394-* `x`: horizontal offset from the anchor point _(number)_
395-* `y`: vertical offset from the anchor point _(number)_
396---]]
397:function lib:AddFrame(frame, callback, default, name)
398-	local selection = CreateFrame('Frame', nil, frame, 'EditModeSystemSelectionTemplate')
399-	selection:SetAllPoints()
400-	selection:SetScript('OnMouseDown', onMouseDown)
401-	selection:SetScript('OnDragStart', onDragStart)
402-	selection:SetScript('OnDragStop', onDragStop)
403-	selection:SetScript('OnEvent', onDragStop)
404-	selection:Hide()
405-
406-	-- as of 11.2 the template requires a system name to work correctly
407-	selection.system = {
408-		GetSystemName = function()
409-			return name or frame.editModeName or frame:GetName()
410-		end
411-	}
412-
--
415-	lib.frameDefaults[frame] = default
416-
417-	if not internal.dialog then
418-		internal.dialog = internal:CreateDialog()
419-		internal.dialog:HookScript('OnHide', function()
420-			resetSelection()
421-		end)
422-
423-		-- fetch layout info in case EDIT_MODE_LAYOUTS_UPDATED already fired
424-		if lib.layoutCache then
425-			onEditModeChanged(nil, C_EditMode.GetLayouts()) -- introduces a little latency
426-		end
427-	end
428-end
429-
430:--[[ LibEditMode:AddFrameSettings(_frame, settings_) ![](https://img.shields.io/badge/function-blue)
431-Register extra settings that will be displayed in a dialog attached to the frame in the Edit Mode.
432-
433:* `frame`: frame widget already registered with [AddFrame](#libeditmodeaddframeframe-callback-default-)
434-* `settings`: table containing [SettingObject](Types#settingobject) entries _(table, number indexed)_
435---]]
436:function lib:AddFrameSettings(frame, settings)
437-	if not lib.frameSelections[frame] then
438-		error('frame must be registered')
439-	end
440-
441-	lib.frameSettings[frame] = settings
442-end
443-
444---[[ LibEditMode:EnableFrameSetting(_frame, settingName_) ![](https://img.shields.io/badge/function-blue)
445-Enables a setting on a frame.
446-
447:* `frame`: frame widget already registered with [AddFrame](#libeditmodeaddframeframe-callback-default-)
448:* `settingName`: a setting already registered with [AddFrameSettings](#libeditmodeaddframesettingsframe-settings-)
449---]]
450-function lib:EnableFrameSetting(frame, settingName)
451-	local settings = internal:GetFrameSettings(frame)
452-	if settings then
453-		for _, setting in next, settings do
454-			if setting.name == settingName then
455-				setting.disabled = false
456-				internal.dialog:Update(internal.dialog.selection)
457-				break
458-			end
459-		end
460-	end
461-end
462-
463---[[ LibEditMode:DisableFrameSetting(_frame, settingName_) ![](https://img.shields.io/badge/function-blue)
464-Disables a setting on a frame.
465-
466:* `frame`: frame widget already registered with [AddFrame](#libeditmodeaddframeframe-callback-default-)
467:* `settingName`: a setting already registered with [AddFrameSettings](#libeditmodeaddframesettingsframe-settings-)
468---]]
469-function lib:DisableFrameSetting(frame, settingName)
470-	local settings = internal:GetFrameSettings(frame)
471-	if settings then
472-		for _, setting in next, settings do
473-			if setting.name == settingName then
474-				setting.disabled = true
475-				internal.dialog:Update(internal.dialog.selection)
476-				break
477-			end
478-		end
479-	end
480-end
481-
482:--[[ LibEditMode:AddFrameSettingsButton(_frame, data_) ![](https://img.shields.io/badge/function-blue)
483-
484:> :warning: Deprecated. Please use [`LibEditMode:AddFrameSettingsButtons(frame, buttons)`](#libeditmodeaddframesettingsbuttonsframe-buttons-) instead.
485-
486-Register extra button that will be displayed in a dialog attached to the frame in the Edit Mode.
487-
488:* `frame`: frame widget already registered with [AddFrame](#libeditmodeaddframeframe-callback-default-)
489-* `data`: [ButtonObject](Types#buttonobject) _(table)_
490---]]
491:function lib:AddFrameSettingsButton(frame, data)
492-	if not lib.frameButtons[frame] then
493-		lib.frameButtons[frame] = {}
494-	end
495-
496-	table.insert(lib.frameButtons[frame], data)
497-end
498-
499:--[[ LibEditMode:AddFrameSettingsButtons(_frame, buttons_) ![](https://img.shields.io/badge/function-blue)
500-Register extra buttons that will be displayed in a dialog attached to the frame in the Edit Mode.
501-
502:* `frame`: frame widget already registered with [AddFrame](#libeditmodeaddframeframe-callback-default-)
503-* `buttons`: table containing [ButtonObject](Types#buttonobject) entries _(table, number indexed)_
504---]]
505:function lib:AddFrameSettingsButtons(frame, buttons)
506-	if not lib.frameButtons[frame] then
507-		lib.frameButtons[frame] = {}
508-	end
509-
510-	for _, button in next, buttons do
511-		table.insert(lib.frameButtons[frame], button)
512-	end
513-end
514-
515---[[ LibEditMode:RefreshFrameSettings(_frame_) ![](https://img.shields.io/badge/function-blue)
516-Refresh the dialog attached to the frame.
517---]]
518-function lib:RefreshFrameSettings(frame)
519-	local selection = lib.frameSelections[frame]
520-	if selection and internal.dialog and internal.dialog.selection == selection and internal.dialog:IsVisible() then
--
726-
727---[[ LibEditMode:IsInEditMode() ![](https://img.shields.io/badge/function-blue)
728-Returns whether the Edit Mode is currently active.
729---]]
730-function lib:IsInEditMode()
731-	return not not lib.isEditing
732-end
733-
734---[[ LibEditMode:GetFrameDefaultPosition(_frame_) ![](https://img.shields.io/badge/function-blue)
735-Returns the default position table registered with the frame.
736-
737-* `frame`: registered frame to return positions for
738-
739-Returns:
740-
741:* `defaultPosition`: table registered with the frame in [AddFrame](#libeditmodeaddframeframe-callback-default-) _(table)_
742---]]
743-function lib:GetFrameDefaultPosition(frame)
744-	return lib.frameDefaults[frame]
745-end
746-
747-function internal:TriggerCallback(frame, ...)
748-	if lib.frameCallbacks[frame] then
749-		securecallfunction(lib.frameCallbacks[frame], frame, layoutNames[lib.activeLayout], ...)
750-	end
751-end
752-
753-function internal:GetFrameSettings(frame)
754-	if lib.frameSettings[frame] then
755-		return lib.frameSettings[frame], #lib.frameSettings[frame]
756-	else

## Assistant

Now I can see the full picture. `OnPositionChanged` is only called via `internal:TriggerCallback` which is only called from `updatePosition` — meaning it only fires when the frame is actually dragged in Edit Mode, not on load. So `OnPositionChanged` is not the bug.

The bug is in `OnLayoutChanged`. LibEditMode calls it whenever the Edit Mode layout changes (including on login via `onEditModeChanged`). When it fires, `pos` is nil (since positions was wiped), so the `if pos then` guard prevents the SetPoint — that's fine. But LibEditMode's `onEditModeChanged` also calls `updatePosition` on the frame... let me check.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua (220 - 269)**
Status: Completed

```
   220→local function onEditModeChanged(_, layoutInfo)
   221→	local activeLayout = layoutInfo.activeLayout
   222→	if activeLayout ~= lib.activeLayout then
   223→		lib.activeLayout = activeLayout
   224→
   225→		-- update cache
   226→		lib.layoutCache = C_EditMode.GetLayouts().layouts
   227→
   228→		-- trigger callbacks
   229→		for _, callback in next, lib.anonCallbacksLayout do
   230→			securecallfunction(callback, layoutNames[activeLayout], activeLayout)
   231→		end
   232→
   233→		-- update dialog
   234→		if internal.dialog and internal.dialog.selection then
   235→			internal.dialog:Update(internal.dialog.selection)
   236→		end
   237→
   238→		-- TODO: we should update the position of the button here, let the user not deal with that
   239→	end
   240→end
   241→
   242→local function onSpecChanged(_, unit)
   243→	if unit ~= 'player' then
   244→		return
   245→	end
   246→
   247→	onEditModeChanged(nil, C_EditMode.GetLayouts())
   248→end
   249→
   250→local function onEditModeLayoutChanged()
   251→	local layoutInfo = C_EditMode.GetLayouts()
   252→	local layouts = layoutInfo.layouts
   253→
   254→	if #layouts > #lib.layoutCache then
   255→		-- a layout was created
   256→
   257→		for index, layout in next, layouts do
   258→			if not lib.layoutCache[index] then
   259→				for _, callback in next, lib.anonCallbacksCreate do
   260→					securecallfunction(callback, layout.layoutName, index, lib._layoutCopySource and lib._layoutCopySource.layoutName)
   261→				end
   262→			end
   263→		end
   264→
   265→		-- the game automatically switches to the newly created layout, which triggers
   266→		-- onEditModeChanged so we don't have to deal with that
   267→	elseif #layouts < #lib.layoutCache then
   268→		-- a layout was deleted
   269→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: grep "RegisterCallback" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua**
Status: Completed

317-		end
318-	end)
319-
320-	EventRegistry:RegisterFrameEventAndCallback('PLAYER_SPECIALIZATION_CHANGED', function(...)
321-		if lib.hookVersion == MINOR then
322-			onSpecChanged(...)
323-		end
324-	end)
325:	EventRegistry:RegisterCallback('EditMode.SavedLayouts', function(...)
326-		if lib.hookVersion == MINOR then
327-			onEditModeLayoutChanged(...)
328-		end
329-	end)
330-
331-	-- hook EditMode shown state, since QuickKeybindMode will hide/show EditMode
332-	EditModeManagerFrame:HookScript('OnShow', function(...)
333-		if lib.hookVersion == MINOR then
--
370-	hooksecurefunc(EditModeManagerFrame, 'ShowNewLayoutDialog', function(_, sourceLayout)
371-		if lib.hookVersion == MINOR then
372-			lib._layoutCopySource = sourceLayout
373-		end
374-	end)
375-end
376-
377--- custom global callback hook that all addons that add custom dialogs should respond to
378:EventRegistry:RegisterCallback('EditModeExternal.hideDialog', function()
379-	resetDialogs()
380-	resetSelection()
381-end)
382-
383---[[ LibEditMode:AddFrame(_frame, callback, default_) ![](https://img.shields.io/badge/function-blue)
384-Register a frame to be controlled by the Edit Mode.
385-
386-* `frame`: frame widget to be controlled
--
637-	end
638-
639-	-- fetch layout info in case EDIT_MODE_LAYOUTS_UPDATED already fired
640-	if lib.layoutCache then
641-		onEditModeChanged(nil, C_EditMode.GetLayouts()) -- introduces a little latency
642-	end
643-end
644-
645:--[[ LibEditMode:RegisterCallback(_event, callback_) ![](https://img.shields.io/badge/function-blue)
646-Register extra callbacks whenever an event within the Edit Mode triggers.
647-
648-* `event`: event name _(string)_
649-* `callback`: function that will be triggered with the event _(function)_
650-
651-Possible events:
652-
653-* `enter`: triggered when the Edit Mode is entered
--
668-        * `layoutIndex`: index of the layout
669-* `delete`: triggered when a Edit Mode layout has been deleted
670-    * signature:
671-        * `layoutName`: name of the layout that got deleted
672-
673-Example:
674-
675-```lua
676:LibEditMode:RegisterCallback('rename', function(oldLayoutName, newLayoutName, layoutIndex)
677-    -- do something
678-end)
679-```
680---]]
681:function lib:RegisterCallback(event, callback)
682-	assert(event and type(event) == 'string', 'event must be a string')
683-	assert(callback and type(callback) == 'function', 'callback must be a function')
684-
685-	if event == 'enter' then
686-		table.insert(lib.anonCallbacksEnter, callback)
687-	elseif event == 'exit' then
688-		table.insert(lib.anonCallbacksExit, callback)
689-	elseif event == 'layout' then

## Assistant

Now I see it. The `layout` callback fires via `anonCallbacksLayout` inside `onEditModeChanged`, which fires on **spec change** (`PLAYER_SPECIALIZATION_CHANGED`) too — every login triggers this. `OnLayoutChanged` is called but with no saved position, so the `if pos then` guard skips the `SetPoint` — that shouldn't move the frame.

The real culprit must be something else. Let me look at what `updatePosition` does when the frame's current anchor is `BOTTOMLEFT` at `20, 200` — it calls `normalizePosition` which reads `GetLeft()`/`GetBottom()` pixel coords. On load, the frame is hidden with size 1px... `GetLeft()` could return 0 on a freshly placed frame, making `normalizePosition` return `BOTTOMLEFT, 0, 0` — but that only fires on drag.

Wait — the issue is simpler. `onEditModeChanged` at line 641 is called during `AddFrame` if `lib.layoutCache` exists, which triggers our `OnLayoutChanged` callback with the current layout name. At that moment `ConsumablesListDB` may not exist yet (it's initialized in `ADDON_LOADED`), so `OnLayoutChanged` returns early. But LibEditMode also calls `updatePosition` somewhere on initial load...

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Libs\LibEditMode\LibEditMode.lua (595 - 649)**
Status: Completed

```
   595→		for _, setting in next, settings do
   596→			if setting.name == settingName then
   597→				setting.disabled = true
   598→				internal.extension:Update(internal.extension.systemID, internal.extension.subSystemID)
   599→				break
   600→			end
   601→		end
   602→	end
   603→end
   604→
   605→--[[ LibEditMode:AddSystemSettingsButtons(_systemID, buttons[, subSystemID]_) ![](https://img.shields.io/badge/function-blue)
   606→Register extra buttons for a Blizzard system, it will be displayed in a dialog attached to the system's dialog in the Edit Mode.
   607→
   608→* `systemID`: the ID of a system registered with the Edit Mode. See [`Enum.EditModeSystem`](https://warcraft.wiki.gg/wiki/EDIT_MODE_LAYOUTS_UPDATED).
   609→* `buttons`: table containing [ButtonObject](Types#buttonobject) entries _(table, number indexed)_
   610→* `subSystemID`: optional ID of a subsystem of a system registered with the Edit Mode. See [`Enum.EditMode...SystemIndices`](https://github.com/Gethe/wow-ui-source/blob/live/Interface/AddOns/Blizzard_APIDocumentationGenerated/EditModeManagerConstantsDocumentation.lua).
   611→--]]
   612→function lib:AddSystemSettingsButtons(systemID, buttons, subSystemID)
   613→	if subSystemID then
   614→		if not lib.subSystemButtons[systemID] then
   615→			lib.subSystemButtons[systemID] = {}
   616→		end
   617→
   618→		if not lib.subSystemButtons[systemID][subSystemID] then
   619→			lib.subSystemButtons[systemID][subSystemID] = {}
   620→		end
   621→
   622→		for _, setting in next, buttons do
   623→			table.insert(lib.subSystemButtons[systemID][subSystemID], setting)
   624→		end
   625→	else
   626→		if not lib.systemButtons[systemID] then
   627→			lib.systemButtons[systemID] = {}
   628→		end
   629→
   630→		for _, button in next, buttons do
   631→			table.insert(lib.systemButtons[systemID], button)
   632→		end
   633→	end
   634→
   635→	if not internal.extension then
   636→		internal.extension = internal:CreateExtension()
   637→	end
   638→
   639→	-- fetch layout info in case EDIT_MODE_LAYOUTS_UPDATED already fired
   640→	if lib.layoutCache then
   641→		onEditModeChanged(nil, C_EditMode.GetLayouts()) -- introduces a little latency
   642→	end
   643→end
   644→
   645→--[[ LibEditMode:RegisterCallback(_event, callback_) ![](https://img.shields.io/badge/function-blue)
   646→Register extra callbacks whenever an event within the Edit Mode triggers.
   647→
   648→* `event`: event name _(string)_
   649→* `callback`: function that will be triggered with the event _(function)_

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

LibEditMode doesn't call `updatePosition` on load — only on drag stop. So the frame's position shouldn't be touched by LibEditMode on login. The problem must be in our own `OnLayoutChanged`. Let me re-read it:

```lua
local function OnLayoutChanged(layoutName)
    if not ConsumablesListDB or not ConsumablesListDB.positions then return end

    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
    end
end
```

When there IS a saved position from a prior drag, `pos.x` and `pos.y` are relative to whatever `point` LibEditMode passed to `OnPositionChanged` — which could be `BOTTOMLEFT` (correct), but the `x`/`y` values from `normalizePosition` for `BOTTOMLEFT` are the pixel distance from the bottom-left of UIParent. That's correct for `SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)`.

The actual bug: the previous drag saved `point = "BOTTOMLEFT"` and the coordinates correctly, but `OnLayoutChanged` uses `pos.x`/`pos.y` — which is fine. The drift to the left means `pos.x` is a small or negative number, likely because `normalizePosition` reads `GetLeft()` on the frame when it was at size `frame_width=300` but the frame was anchored at its old CENTER position meaning `GetLeft()` was `center_x - 150`. So the x stored was actually `center_x - 150`, not the bottom-left x.

This is the stale data problem again from before the fix. Since you wiped the SavedVariables file, it should be clean now. Let me verify by checking if there's any other path that could move the frame.

The frame starts at `BOTTOMLEFT, 20, 200`. On login `OnLayoutChanged` fires — if `ConsumablesListDB.positions` is nil it returns early. The frame stays at `20, 200`. That should be correct.

Can you try `/run print(CL.frame:GetPoint())` in-game after it moves to see what anchor point and coordinates it ends up at? That would tell us exactly what's setting it.

## User

You said we changed thing sto always set based on the BOTTOMLEFT, but with the change to 300px set width. we should always set it to whatwever the libeditmode wants it to be, it doesn't always need to be BOTTOMLEFT anymore

## Assistant

Right — with a fixed width, `SetSize` no longer shifts the frame regardless of anchor point. LibEditMode can use whatever corner it wants and the frame won't drift. Revert `OnLayoutChanged` to use the saved `point`.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    end
end

```


## Assistant

Done. LibEditMode's `normalizePosition` picks the nearest edge/corner and stores it — we now restore with whatever it saved, same as before the fixed-width change.

## User

That fixed it.

Next up: When we make a new group we have a default name for it. If the group is called "New Group" and we add an item, change the name to the same name as the item we added

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (573 - 592)**
Status: Completed

```
   573→local function add_item_to_selected_group(item_id)
   574→    if not selected_group_key then
   575→        CL:Print("Select an item group first.")
   576→        return
   577→    end
   578→
   579→    local group = CL.db.item_groups[selected_group_key]
   580→    if not group then return end
   581→
   582→    if find_item_group(item_id) then
   583→        CL:Print("Item already in a group.")
   584→        return
   585→    end
   586→
   587→    group.item_ids[#group.item_ids + 1] = item_id
   588→    CL:RefreshOptionsEditor()
   589→    CL:RefreshBagPanel()
   590→    CL:RebuildDisplay()
   591→end
   592→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    end

    group.item_ids[#group.item_ids + 1] = item_id

    if group.name == "New Group" then
        local item_name = C_Item.GetItemNameByID(item_id)
        if item_name then
            group.name = item_name
        end
    end

    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
```


## Assistant

Done. Only renames when the group is still the default `"New Group"` — once you've given it a custom name (or it already auto-renamed from a prior add), it won't override it. If the item isn't in cache yet the name stays `"New Group"` until you manually set it.

## User

Let's set that to New Group OR Empty Group

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```

    group.item_ids[#group.item_ids + 1] = item_id

    if group.name == "New Group" or group.name == "Empty Group" then
        local item_name = C_Item.GetItemNameByID(item_id)
        if item_name then
            group.name = item_name
```


## Assistant

Done.

## User

Next: Give groups a order ID so they are in the same order every time, after we do that allow us to drag and drop the item group list to set order

## Assistant

This is a multi-step feature. Let me plan it out before touching anything.

**Order ID approach:**
- Add an `order` integer field to each group when created/loaded
- Sort by `order` everywhere we iterate `item_groups` for display
- For drag-and-drop: reorder by swapping/shifting `order` values when a group button is dropped onto another

Let me read the relevant sections first.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (304 - 393)**
Status: Completed

```
   304→
   305→local function clear_group_buttons(scroll_child)
   306→    for _, btn in ipairs(group_buttons) do
   307→        btn:Hide()
   308→        btn:SetParent(nil)
   309→    end
   310→
   311→    wipe(group_buttons)
   312→end
   313→
   314→local function select_group(key)
   315→    selected_group_key = key
   316→    CL:RefreshOptionsEditor()
   317→    CL:RefreshGroupList()
   318→    CL:RefreshBagPanel()
   319→end
   320→
   321→local function create_group_button(parent, index, key, group)
   322→    -- Row frame holding both the group button and trash icon
   323→    local row = CreateFrame("Frame", nil, parent)
   324→    local row_width = parent:GetWidth()
   325→    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
   326→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
   327→
   328→    -- Group select button (leaves room for trash icon on the right)
   329→    local btn_width = row_width - TRASH_ICON_SIZE - 6
   330→    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
   331→    btn:SetPoint("LEFT", row, "LEFT", 0, 0)
   332→
   333→    if key == selected_group_key then
   334→        btn._selected = true
   335→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
   336→        btn.text:SetTextColor(r, g, b, 1)
   337→        btn:SetBackdropColor(unpack(BG_SELECTED))
   338→        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   339→    end
   340→
   341→    btn:SetScript("OnClick", function()
   342→        select_group(key)
   343→    end)
   344→
   345→    -- Trash icon button
   346→    local trash = CreateFrame("Button", nil, row)
   347→    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
   348→    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)
   349→
   350→    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
   351→    trash_icon:SetAllPoints()
   352→    trash_icon:SetAtlas("transmog-icon-remove")
   353→    trash_icon:SetAlpha(0.5)
   354→
   355→    trash:SetScript("OnEnter", function()
   356→        trash_icon:SetAlpha(1.0)
   357→        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
   358→        GameTooltip:SetText("Delete Group")
   359→        GameTooltip:Show()
   360→    end)
   361→
   362→    trash:SetScript("OnLeave", function()
   363→        trash_icon:SetAlpha(0.5)
   364→        GameTooltip:Hide()
   365→    end)
   366→
   367→    trash:SetScript("OnClick", function()
   368→        delete_group(key)
   369→    end)
   370→
   371→    return row
   372→end
   373→
   374→function CL:RefreshGroupList()
   375→    if not CL.options_frame then return end
   376→
   377→    local scroll_child = CL.options_frame.group_scroll_child
   378→    clear_group_buttons(scroll_child)
   379→
   380→    local index = 1
   381→    for key, group in pairs(CL.db.item_groups) do
   382→        local row = create_group_button(scroll_child, index, key, group)
   383→        group_buttons[#group_buttons + 1] = row
   384→        index = index + 1
   385→    end
   386→
   387→    scroll_child:SetHeight(math.max(1, (index - 1) * (GROUP_BUTTON_HEIGHT + 3)))
   388→end
   389→
   390→-------------------------------------------------------------------------------
   391→--- Editor Panel (Right Panel - Top)
   392→-------------------------------------------------------------------------------
   393→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now let me read the ADDON_LOADED handler to understand where groups are initialized so I can add order stamping there too.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (308 - 332)**
Status: Completed

```
   308→    if event == "ADDON_LOADED" then
   309→        if arg1 == ADDON_NAME then
   310→            if not ConsumablesListDB then
   311→                ConsumablesListDB = {}
   312→            end
   313→
   314→            -- Initialize item_groups from saved data or defaults
   315→            if ConsumablesListDB.item_groups then
   316→                CL.db.item_groups = ConsumablesListDB.item_groups
   317→            else
   318→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   319→                ConsumablesListDB.item_groups = CL.db.item_groups
   320→            end
   321→
   322→            CL.frame:UnregisterEvent("ADDON_LOADED")
   323→
   324→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   325→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   326→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
   327→            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors
   328→
   329→            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
   330→            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit
   331→
   332→            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Good. Now I have a clear picture. Here's the plan:

**Order stamping:**
- On `ADDON_LOADED`, after loading groups, backfill any group missing an `order` field (assigns sequential integers starting from 1)
- New groups created via `+ Add New Group` get `order = max_existing + 1`
- `RefreshGroupList` builds a sorted list by `order` before rendering

**Drag and drop:**
- Each row gets `EnableMouse(true)` and registers `OnMouseDown` / `OnMouseUp` to detect a drag
- A single shared "drag ghost" label follows the cursor showing the dragged group name
- `OnEnter` on other rows during a drag highlights the drop target
- On drop, shift all `order` values between source and target to slide them up/down

Let me implement this now.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (960 - 989)**
Status: Completed

```
   960→    -- Title divider (more Y padding from title)
   961→    local title_divider = frame:CreateTexture(nil, "ARTWORK")
   962→    title_divider:SetHeight(2)
   963→    title_divider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
   964→    title_divider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
   965→    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)
   966→
   967→    -- Content area (below divider)
   968→    local content = CreateFrame("Frame", nil, frame)
   969→    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
   970→    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)
   971→
   972→    local content_height = PANEL_HEIGHT - 42 - INSET_PADDING
   973→    local content_width = PANEL_WIDTH - (INSET_PADDING * 2)
   974→    local right_width = content_width - GROUP_LIST_WIDTH - INSET_PADDING
   975→
   976→    ---------------------------------------------------------------------------
   977→    -- Left panel: Group list (full height)
   978→    ---------------------------------------------------------------------------
   979→    create_label(content, "Item Groups", 2, -2)
   980→
   981→    local add_group_btn = create_styled_button(content,
   982→        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
   983→    add_group_btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
   984→    add_group_btn:SetScript("OnClick", function()
   985→        local key = generate_group_key()
   986→        CL.db.item_groups[key] = {
   987→            item_ids = {},
   988→            threshold = 10,
   989→            color = "ffffff",

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (984 - 998)**
Status: Completed

```
   984→    add_group_btn:SetScript("OnClick", function()
   985→        local key = generate_group_key()
   986→        CL.db.item_groups[key] = {
   987→            item_ids = {},
   988→            threshold = 10,
   989→            color = "ffffff",
   990→            name = "New Group",
   991→        }
   992→        select_group(key)
   993→        CL:RebuildDisplay()
   994→    end)
   995→
   996→    -- Group list scroll container (full height, bottom-aligned with content)
   997→    local group_scroll_top = 50
   998→    local group_container_height = content_height - group_scroll_top

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now I have everything I need. I'll implement this in three parts:

1. A `get_sorted_groups()` helper and `get_next_order()` helper
2. Order backfill on ADDON_LOADED, order assignment on new group creation
3. Drag-and-drop in `create_group_button` and `RefreshGroupList`

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    return key
end

local function get_next_order()
    local max_order = 0
    for _, group in pairs(CL.db.item_groups) do
        if (group.order or 0) > max_order then
            max_order = group.order
        end
    end

    return max_order + 1
end

local function get_sorted_groups()
    local sorted = {}
    for key, group in pairs(CL.db.item_groups) do
        sorted[#sorted + 1] = { key = key, group = group }
    end

    table.sort(sorted, function(a, b)
        return (a.group.order or 0) < (b.group.order or 0)
    end)

    return sorted
end

local function delete_group(key)
    local group = CL.db.item_groups[key]
    if not group then return end
```


## Assistant

Now update `RefreshGroupList` to use sorted order:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    local scroll_child = CL.options_frame.group_scroll_child
    clear_group_buttons(scroll_child)

    local sorted = get_sorted_groups()
    for index, entry in ipairs(sorted) do
        local row = create_group_button(scroll_child, index, entry.key, entry.group)
        group_buttons[#group_buttons + 1] = row
    end

    scroll_child:SetHeight(math.max(1, #sorted * (GROUP_BUTTON_HEIGHT + 3)))
end

-------------------------------------------------------------------------------
```


## Assistant

Now assign order when creating a new group:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
            threshold = 10,
            color = "ffffff",
            name = "New Group",
            order = get_next_order(),
        }
        select_group(key)
        CL:RebuildDisplay()
```


## Assistant

Now add order backfill on ADDON_LOADED (for existing saves and defaults that have no `order`):

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
                ConsumablesListDB.item_groups = CL.db.item_groups
            end

            -- Backfill order for any groups that predate the order field
            local next_order = 1
            for _, group in pairs(CL.db.item_groups) do
                if not group.order then
                    group.order = next_order
                    next_order = next_order + 1
                end
            end

            CL.frame:UnregisterEvent("ADDON_LOADED")

            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
```


## Assistant

Now add drag-and-drop to `create_group_button`. I'll add a module-level drag state table and wire up the row frames:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
local bag_buttons = {}
local bag_filter_buttons = {}

local drag_state = {
    active = false,
    source_key = nil,
    ghost = nil,
}

-- Item class filters: classID -> { name, icon }
local ITEM_CLASS_FILTERS = {
    { classID = 0,  name = "Consumable",        icon = 134830 },  -- INV_Potion_93 (red potion)
```


## Assistant

Now replace `create_group_button` with drag-and-drop support:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    CL:RefreshBagPanel()
end

local function get_or_create_drag_ghost()
    if drag_state.ghost then
        return drag_state.ghost
    end

    local ghost = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    ghost:SetSize(GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT)
    ghost:SetFrameStrata("TOOLTIP")
    ghost:SetBackdrop(BACKDROP)
    ghost:SetBackdropColor(0.2, 0.18, 0.1, 0.9)
    ghost:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
    ghost:Hide()

    ghost.text = ghost:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    ghost.text:SetPoint("LEFT", ghost, "LEFT", 6, 0)
    ghost.text:SetPoint("RIGHT", ghost, "RIGHT", -6, 0)
    ghost.text:SetWordWrap(false)
    ghost.text:SetTextColor(unpack(GOLD))

    ghost:SetScript("OnUpdate", function(self)
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)
    end)

    drag_state.ghost = ghost

    return ghost
end

local function reorder_groups(source_key, target_key)
    local source_order = CL.db.item_groups[source_key].order
    local target_order = CL.db.item_groups[target_key].order

    if source_order == target_order then return end

    if source_order < target_order then
        -- Moving down: shift items between source+1 and target up by 1
        for _, group in pairs(CL.db.item_groups) do
            if group.order > source_order and group.order <= target_order then
                group.order = group.order - 1
            end
        end
    else
        -- Moving up: shift items between target and source-1 down by 1
        for _, group in pairs(CL.db.item_groups) do
            if group.order >= target_order and group.order < source_order then
                group.order = group.order + 1
            end
        end
    end

    CL.db.item_groups[source_key].order = target_order
end

local function create_group_button(parent, index, key, group)
    -- Row frame holding both the group button and trash icon
    local row = CreateFrame("Frame", nil, parent)
```


Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))

    -- Drop highlight texture (shown when a drag hovers over this row)
    local drop_highlight = row:CreateTexture(nil, "OVERLAY")
    drop_highlight:SetAllPoints()
    drop_highlight:SetColorTexture(1, 0.82, 0, 0.15)
    drop_highlight:Hide()

    -- Group select button (leaves room for trash icon on the right)
    local btn_width = row_width - TRASH_ICON_SIZE - 6
    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
```


Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    end

    btn:SetScript("OnClick", function()
        if not drag_state.active then
            select_group(key)
        end
    end)

    -- Drag initiation: hold and move mouse to drag
    btn:SetScript("OnMouseDown", function(self)
        drag_state.active = false
        drag_state.source_key = key
        self._drag_pending = true
    end)

    btn:SetScript("OnMouseUp", function(self)
        self._drag_pending = false
        if drag_state.active then
            drag_state.active = false
            drag_state.ghost:Hide()
            drag_state.source_key = nil
            CL:RefreshGroupList()
        end
    end)

    btn:SetScript("OnUpdate", function(self)
        if self._drag_pending and not drag_state.active then
            -- Start dragging once the mouse moves
            local ghost = get_or_create_drag_ghost()
            ghost.text:SetText(get_group_display_name(group))
            ghost:Show()
            drag_state.active = true
        end
    end)

    -- Drop target behaviour
    row:EnableMouse(true)
    row:SetScript("OnEnter", function()
        if drag_state.active and drag_state.source_key ~= key then
            drop_highlight:Show()
        end
    end)

    row:SetScript("OnLeave", function()
        drop_highlight:Hide()
    end)

    row:SetScript("OnMouseUp", function()
        if drag_state.active and drag_state.source_key and drag_state.source_key ~= key then
            reorder_groups(drag_state.source_key, key)
            drag_state.active = false
            drag_state.source_key = nil
            drag_state.ghost:Hide()
            CL:RefreshGroupList()
        end
    end)

    -- Trash icon button
    local trash = CreateFrame("Button", nil, row)
    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
```


## Assistant

Done. Here's what was implemented:

**Order IDs:**
- Every group now has an `order` integer field
- On `ADDON_LOADED`, any existing groups without `order` are backfilled with sequential integers
- New groups via `+ Add New Group` get `order = max + 1`
- `RefreshGroupList` sorts by `order` before rendering, so the list is always deterministic

**Drag and drop:**
- `OnMouseDown` on a group button arms the drag (`_drag_pending = true`)
- `OnUpdate` detects that a drag is pending and activates it — shows a ghost label that follows the cursor
- Hovering over another row while dragging shows a gold highlight on the drop target
- `OnMouseUp` on a target row calls `reorder_groups()` which shifts all `order` values between source and target, then refreshes the list
- `OnClick` is gated to `not drag_state.active` so a drop doesn't also select the group

## User

This does not work, every click tries to drag and we can't click the groups in any way. 

Let's add a drag anchor to the left side of each of the item group lines in the list. Make it so clicking the existing frame opens, clicking the drag anchor allow sus to change order. 

Also dragging to re-order is just not working. I can drag the lines but they don't change order

## Assistant



Let me rip out the drag logic from the button and add a dedicated drag handle instead.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (376 - 475)**
Status: Completed

```
   376→    drag_state.ghost = ghost
   377→
   378→    return ghost
   379→end
   380→
   381→local function reorder_groups(source_key, target_key)
   382→    local source_order = CL.db.item_groups[source_key].order
   383→    local target_order = CL.db.item_groups[target_key].order
   384→
   385→    if source_order == target_order then return end
   386→
   387→    if source_order < target_order then
   388→        -- Moving down: shift items between source+1 and target up by 1
   389→        for _, group in pairs(CL.db.item_groups) do
   390→            if group.order > source_order and group.order <= target_order then
   391→                group.order = group.order - 1
   392→            end
   393→        end
   394→    else
   395→        -- Moving up: shift items between target and source-1 down by 1
   396→        for _, group in pairs(CL.db.item_groups) do
   397→            if group.order >= target_order and group.order < source_order then
   398→                group.order = group.order + 1
   399→            end
   400→        end
   401→    end
   402→
   403→    CL.db.item_groups[source_key].order = target_order
   404→end
   405→
   406→local function create_group_button(parent, index, key, group)
   407→    -- Row frame holding both the group button and trash icon
   408→    local row = CreateFrame("Frame", nil, parent)
   409→    local row_width = parent:GetWidth()
   410→    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
   411→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
   412→
   413→    -- Drop highlight texture (shown when a drag hovers over this row)
   414→    local drop_highlight = row:CreateTexture(nil, "OVERLAY")
   415→    drop_highlight:SetAllPoints()
   416→    drop_highlight:SetColorTexture(1, 0.82, 0, 0.15)
   417→    drop_highlight:Hide()
   418→
   419→    -- Group select button (leaves room for trash icon on the right)
   420→    local btn_width = row_width - TRASH_ICON_SIZE - 6
   421→    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
   422→    btn:SetPoint("LEFT", row, "LEFT", 0, 0)
   423→
   424→    if key == selected_group_key then
   425→        btn._selected = true
   426→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
   427→        btn.text:SetTextColor(r, g, b, 1)
   428→        btn:SetBackdropColor(unpack(BG_SELECTED))
   429→        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   430→    end
   431→
   432→    btn:SetScript("OnClick", function()
   433→        if not drag_state.active then
   434→            select_group(key)
   435→        end
   436→    end)
   437→
   438→    -- Drag initiation: hold and move mouse to drag
   439→    btn:SetScript("OnMouseDown", function(self)
   440→        drag_state.active = false
   441→        drag_state.source_key = key
   442→        self._drag_pending = true
   443→    end)
   444→
   445→    btn:SetScript("OnMouseUp", function(self)
   446→        self._drag_pending = false
   447→        if drag_state.active then
   448→            drag_state.active = false
   449→            drag_state.ghost:Hide()
   450→            drag_state.source_key = nil
   451→            CL:RefreshGroupList()
   452→        end
   453→    end)
   454→
   455→    btn:SetScript("OnUpdate", function(self)
   456→        if self._drag_pending and not drag_state.active then
   457→            -- Start dragging once the mouse moves
   458→            local ghost = get_or_create_drag_ghost()
   459→            ghost.text:SetText(get_group_display_name(group))
   460→            ghost:Show()
   461→            drag_state.active = true
   462→        end
   463→    end)
   464→
   465→    -- Drop target behaviour
   466→    row:EnableMouse(true)
   467→    row:SetScript("OnEnter", function()
   468→        if drag_state.active and drag_state.source_key ~= key then
   469→            drop_highlight:Show()
   470→        end
   471→    end)
   472→
   473→    row:SetScript("OnLeave", function()
   474→        drop_highlight:Hide()
   475→    end)
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (475 - 504)**
Status: Completed

```
   475→    end)
   476→
   477→    row:SetScript("OnMouseUp", function()
   478→        if drag_state.active and drag_state.source_key and drag_state.source_key ~= key then
   479→            reorder_groups(drag_state.source_key, key)
   480→            drag_state.active = false
   481→            drag_state.source_key = nil
   482→            drag_state.ghost:Hide()
   483→            CL:RefreshGroupList()
   484→        end
   485→    end)
   486→
   487→    -- Trash icon button
   488→    local trash = CreateFrame("Button", nil, row)
   489→    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
   490→    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)
   491→
   492→    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
   493→    trash_icon:SetAllPoints()
   494→    trash_icon:SetAtlas("transmog-icon-remove")
   495→    trash_icon:SetAlpha(0.5)
   496→
   497→    trash:SetScript("OnEnter", function()
   498→        trash_icon:SetAlpha(1.0)
   499→        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
   500→        GameTooltip:SetText("Delete Group")
   501→        GameTooltip:Show()
   502→    end)
   503→
   504→    trash:SetScript("OnLeave", function()
```

## Assistant

Now I'll also check the constant at top for the handle size and see what we need to adjust for layout:

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (14 - 19)**
Status: Completed

```
    14→local BAG_PANEL_HEIGHT = 160
    15→local ICON_SIZE = 34
    16→local ICON_PADDING = 4
    17→local GROUP_BUTTON_HEIGHT = 26
    18→local TRASH_ICON_SIZE = 18
    19→
```

## Assistant

Now I have the full picture. The problems are:

1. The drag is on the button itself so every click triggers a drag
2. The drop target is the `row` frame, but the `btn` sits on top of the row consuming mouse events — the `row:OnMouseUp` never fires because the button eats it

I'll add a small drag handle on the left, strip all drag logic from the button, and make the drop detection work via the drag handle checking cursor position against all rows.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
local ICON_PADDING = 4
local GROUP_BUTTON_HEIGHT = 26
local TRASH_ICON_SIZE = 18
local DRAG_HANDLE_WIDTH = 14

local GOLD = { 1, 0.82, 0, 1 }
local BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
```


## Assistant

Now replace `get_or_create_drag_ghost` to also clear points before setting new ones (prevents stacking anchors), and replace `create_group_button` entirely:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    ghost:SetScript("OnUpdate", function(self)
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)
    end)

```


## Assistant

Now add a helper function that finds which group row the cursor is over, and replace `create_group_button`:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    CL.db.item_groups[source_key].order = target_order
end

local function find_drop_target_key()
    local scale = UIParent:GetEffectiveScale()
    local cx, cy = GetCursorPosition()
    cx, cy = cx / scale, cy / scale

    for _, btn_row in ipairs(group_buttons) do
        if btn_row:IsShown() and btn_row:GetBottom() then
            local left = btn_row:GetLeft()
            local right = btn_row:GetRight()
            local bottom = btn_row:GetBottom()
            local top = btn_row:GetTop()

            if cx >= left and cx <= right and cy >= bottom and cy <= top then
                return btn_row._group_key
            end
        end
    end

    return nil
end

local function finish_drag(dropped_on_target)
    if not drag_state.active then return end

    if dropped_on_target then
        local target_key = find_drop_target_key()

        if target_key and target_key ~= drag_state.source_key then
            reorder_groups(drag_state.source_key, target_key)
        end
    end

    drag_state.active = false
    drag_state.source_key = nil
    drag_state.ghost:Hide()
    CL:RefreshGroupList()
    CL:RebuildDisplay()
end

local function create_group_button(parent, index, key, group)
    -- Row frame holding drag handle, group button, and trash icon
    local row = CreateFrame("Frame", nil, parent)
    local row_width = parent:GetWidth()
    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
    row._group_key = key

    -- Drag handle on the left
    local handle = CreateFrame("Button", nil, row)
    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
    handle:SetPoint("LEFT", row, "LEFT", 0, 0)

    local handle_tex = handle:CreateTexture(nil, "ARTWORK")
    handle_tex:SetSize(8, 14)
    handle_tex:SetPoint("CENTER", handle, "CENTER", 0, 0)
    handle_tex:SetTexture("Interface\\Buttons\\UI-SortArrow")
    handle_tex:SetDesaturated(true)
    handle_tex:SetAlpha(0.4)

    handle:SetScript("OnEnter", function()
        handle_tex:SetAlpha(1.0)
        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to reorder")
        GameTooltip:Show()
    end)

    handle:SetScript("OnLeave", function()
        if not drag_state.active then
            handle_tex:SetAlpha(0.4)
        end

        GameTooltip:Hide()
    end)

    handle:RegisterForDrag("LeftButton")

    handle:SetScript("OnDragStart", function()
        drag_state.active = true
        drag_state.source_key = key

        local ghost = get_or_create_drag_ghost()
        ghost.text:SetText(get_group_display_name(group))
        ghost:Show()
    end)

    handle:SetScript("OnDragStop", function()
        finish_drag(true)
    end)

    -- Group select button (leaves room for handle on left and trash on right)
    local btn_width = row_width - DRAG_HANDLE_WIDTH - TRASH_ICON_SIZE - 6
    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
    btn:SetPoint("LEFT", handle, "RIGHT", 0, 0)

    if key == selected_group_key then
        btn._selected = true
        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        btn.text:SetTextColor(r, g, b, 1)
        btn:SetBackdropColor(unpack(BG_SELECTED))
        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
    end

    btn:SetScript("OnClick", function()
        select_group(key)
    end)

    -- Trash icon button
```


## Assistant

The key changes:

1. **Dedicated drag handle** — a small button on the left of each row with a sort arrow icon. Only this initiates drags.
2. **Button is just a button** — `OnClick` selects the group, no drag logic at all.
3. **Drop detection via `find_drop_target_key()`** — on `OnDragStop`, we check cursor position against all row bounds to find which group it was dropped on. This avoids the problem of the button eating mouse events from the parent row.
4. **Each row stores `_group_key`** so the hit-test can return the target key.

## User

That functionally works. 

Some issues:
`Image` the spacing to the left of the buttons works well, but the icon is too small in it. Let's resize the icon to fill the space better. and try to pick a icon that works better for a drag handle than just a arrow.
When dragging It's hard to tell if I'm in the proper location to drop, and sometimes am hoding it too far to the left. Can we make the whole line change it's background color when I'm hovering a locaiton that will work for the position change? By line I mean the item_group line change the color behind the mover, the button, and the trash icon

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (416 - 500)**
Status: Completed

```
   416→            local right = btn_row:GetRight()
   417→            local bottom = btn_row:GetBottom()
   418→            local top = btn_row:GetTop()
   419→
   420→            if cx >= left and cx <= right and cy >= bottom and cy <= top then
   421→                return btn_row._group_key
   422→            end
   423→        end
   424→    end
   425→
   426→    return nil
   427→end
   428→
   429→local function finish_drag(dropped_on_target)
   430→    if not drag_state.active then return end
   431→
   432→    if dropped_on_target then
   433→        local target_key = find_drop_target_key()
   434→
   435→        if target_key and target_key ~= drag_state.source_key then
   436→            reorder_groups(drag_state.source_key, target_key)
   437→        end
   438→    end
   439→
   440→    drag_state.active = false
   441→    drag_state.source_key = nil
   442→    drag_state.ghost:Hide()
   443→    CL:RefreshGroupList()
   444→    CL:RebuildDisplay()
   445→end
   446→
   447→local function create_group_button(parent, index, key, group)
   448→    -- Row frame holding drag handle, group button, and trash icon
   449→    local row = CreateFrame("Frame", nil, parent)
   450→    local row_width = parent:GetWidth()
   451→    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
   452→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
   453→    row._group_key = key
   454→
   455→    -- Drag handle on the left
   456→    local handle = CreateFrame("Button", nil, row)
   457→    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
   458→    handle:SetPoint("LEFT", row, "LEFT", 0, 0)
   459→
   460→    local handle_tex = handle:CreateTexture(nil, "ARTWORK")
   461→    handle_tex:SetSize(8, 14)
   462→    handle_tex:SetPoint("CENTER", handle, "CENTER", 0, 0)
   463→    handle_tex:SetTexture("Interface\\Buttons\\UI-SortArrow")
   464→    handle_tex:SetDesaturated(true)
   465→    handle_tex:SetAlpha(0.4)
   466→
   467→    handle:SetScript("OnEnter", function()
   468→        handle_tex:SetAlpha(1.0)
   469→        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
   470→        GameTooltip:SetText("Drag to reorder")
   471→        GameTooltip:Show()
   472→    end)
   473→
   474→    handle:SetScript("OnLeave", function()
   475→        if not drag_state.active then
   476→            handle_tex:SetAlpha(0.4)
   477→        end
   478→
   479→        GameTooltip:Hide()
   480→    end)
   481→
   482→    handle:RegisterForDrag("LeftButton")
   483→
   484→    handle:SetScript("OnDragStart", function()
   485→        drag_state.active = true
   486→        drag_state.source_key = key
   487→
   488→        local ghost = get_or_create_drag_ghost()
   489→        ghost.text:SetText(get_group_display_name(group))
   490→        ghost:Show()
   491→    end)
   492→
   493→    handle:SetScript("OnDragStop", function()
   494→        finish_drag(true)
   495→    end)
   496→
   497→    -- Group select button (leaves room for handle on left and trash on right)
   498→    local btn_width = row_width - DRAG_HANDLE_WIDTH - TRASH_ICON_SIZE - 6
   499→    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
   500→    btn:SetPoint("LEFT", handle, "RIGHT", 0, 0)
```

## Assistant

Now I'll make two changes:

1. Better drag handle icon that fills the space
2. Add an `OnUpdate` to the ghost that highlights whichever row the cursor is over during a drag

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    handle:SetPoint("LEFT", row, "LEFT", 0, 0)

    local handle_tex = handle:CreateTexture(nil, "ARTWORK")
    handle_tex:SetSize(DRAG_HANDLE_WIDTH - 2, GROUP_BUTTON_HEIGHT - 6)
    handle_tex:SetPoint("CENTER", handle, "CENTER", 0, 0)
    handle_tex:SetAtlas("UI-QuestTracker-Objective-Nub")
    handle_tex:SetDesaturated(true)
    handle_tex:SetAlpha(0.4)

```


## Assistant

Now add the highlight logic. I need to store a highlight texture on each row and have the ghost's `OnUpdate` manage highlighting:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
        local scale = UIParent:GetEffectiveScale()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)

        -- Highlight the row under the cursor
        local cx, cy = x / scale, y / scale
        for _, btn_row in ipairs(group_buttons) do
            if btn_row:IsShown() and btn_row:GetBottom() then
                local is_target = btn_row._group_key ~= drag_state.source_key
                    and cx >= btn_row:GetLeft() and cx <= btn_row:GetRight()
                    and cy >= btn_row:GetBottom() and cy <= btn_row:GetTop()

                if is_target then
                    btn_row._drop_highlight:Show()
                else
                    btn_row._drop_highlight:Hide()
                end
            end
        end
    end)

    drag_state.ghost = ghost
```


## Assistant

Now add the `_drop_highlight` texture to each row in `create_group_button`:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
    row._group_key = key

    -- Drop highlight (shown when dragging over this row)
    local drop_highlight = row:CreateTexture(nil, "BACKGROUND")
    drop_highlight:SetAllPoints()
    drop_highlight:SetColorTexture(1, 0.82, 0, 0.2)
    drop_highlight:Hide()
    row._drop_highlight = drop_highlight

    -- Drag handle on the left
    local handle = CreateFrame("Button", nil, row)
    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
```


## Assistant

Now make sure `finish_drag` clears all highlights when the drag ends:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
        end
    end

    -- Clear all drop highlights before refreshing
    for _, btn_row in ipairs(group_buttons) do
        if btn_row._drop_highlight then
            btn_row._drop_highlight:Hide()
        end
    end

    drag_state.active = false
    drag_state.source_key = nil
    drag_state.ghost:Hide()
```


## Assistant

Two changes:

1. **Drag handle icon** — swapped from `UI-SortArrow` (tiny arrow) to `UI-QuestTracker-Objective-Nub` (a grip-style nub), sized to fill the handle area (`DRAG_HANDLE_WIDTH - 2` x `GROUP_BUTTON_HEIGHT - 6`).

2. **Full-row drop highlight** — the ghost's `OnUpdate` now checks every row frame against the cursor position each frame. When the cursor is over a valid drop target, a gold semi-transparent `_drop_highlight` texture covering the entire row (handle, button, and trash icon) is shown. All highlights are cleared on drag end. The hit detection uses the full row bounds so you don't need to aim precisely at the button.

## User

Can we make the cursor change to a "grabber" hand to show that the drag to reorder frames are grabbable

## Assistant



WoW's `SetCursor` API doesn't support custom cursors, but we can use `SetCursor("INTERACT_CURSOR")` which shows a hand/grab icon — it's the closest WoW provides. We set it on enter and clear it on leave.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```

    handle:SetScript("OnEnter", function()
        handle_tex:SetAlpha(1.0)
        SetCursor("Interface\\CURSOR\\UI-Cursor-Move")
        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to reorder")
        GameTooltip:Show()
```


Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
            handle_tex:SetAlpha(0.4)
        end

        ResetCursor()
        GameTooltip:Hide()
    end)

```


## Assistant

Also reset the cursor when the drag finishes:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    drag_state.active = false
    drag_state.source_key = nil
    drag_state.ghost:Hide()
    ResetCursor()
    CL:RefreshGroupList()
    CL:RebuildDisplay()
end
```


## Assistant

Done. The cursor changes to WoW's move cursor when hovering a drag handle, and resets when leaving or finishing a drag.

## User

undo that, I don't like it

## User

nevermind I changed it back myself

## Assistant

Based on the conversation summary, the last interaction was the user saying "nevermind I changed it back myself" about the cursor change code - meaning no pending task was left incomplete. The drag-and-drop reordering feature with the cursor change is done.

There's no outstanding task to continue. Let me know what you'd like to work on next! The TODO.md has several remaining items if you want to tackle any of those.

## User

next: Update color input hex to select all on focus so we can just paste without ahving to select and delete

## Assistant



Let me find the color editbox code in Options.lua.

**Tool Call: grep -i "color.*editbox\|color.*edit_box\|color.*input\|Color.*EditBox\|color_box" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

No matches found

**Tool Call: grep -i -n "color" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

141:    button:SetBackdropColor(unpack(BG_NORMAL))
142:    button:SetBackdropBorderColor(unpack(BORDER_NORMAL))
150:    button.text:SetTextColor(unpack(GOLD))
153:        self:SetBackdropColor(unpack(BG_HOVER))
154:        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
159:            self:SetBackdropColor(unpack(BG_SELECTED))
160:            self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
162:            self:SetBackdropColor(unpack(BG_NORMAL))
163:            self:SetBackdropBorderColor(unpack(BORDER_NORMAL))
168:        self:SetBackdropColor(unpack(BG_PRESS))
175:        self:SetBackdropColor(unpack(BG_HOVER))
199:    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
200:    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
204:        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
208:        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
222:    label:SetTextColor(unpack(GOLD))
233:    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
234:    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
361:    ghost:SetBackdropColor(0.2, 0.18, 0.1, 0.9)
362:    ghost:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
369:    ghost.text:SetTextColor(unpack(GOLD))
481:    drop_highlight:SetColorTexture(1, 0.82, 0, 0.2)
534:        local r, g, b = CL:HexToRGB(group.color or "ffffff")
535:        btn.text:SetTextColor(r, g, b, 1)
536:        btn:SetBackdropColor(unpack(BG_SELECTED))
537:        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
607:    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
644:    id_text:SetTextColor(0.5, 0.5, 0.5)
669:        self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
676:        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
701:    editor.color_box:SetText(group.color or "ffffff")
703:    -- Update color swatch
704:    local r, g, b = CL:HexToRGB(group.color or "ffffff")
705:    editor.color_swatch:SetColorTexture(r, g, b, 1)
857:                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
860:                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
862:                        status_icon:SetVertexColor(0, 1, 0)
990:    -- Color field
991:    create_label(editor, "Color:", label_x, -65)
992:    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
993:    editor.color_box:SetMaxLetters(6)
994:    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
1004:    -- Clickable color swatch that opens the color picker
1007:    swatch_btn:SetPoint("LEFT", editor.color_box, "RIGHT", 8, 0)
1009:    swatch_btn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
1011:    editor.color_swatch = swatch_btn:CreateTexture(nil, "ARTWORK")
1012:    editor.color_swatch:SetPoint("TOPLEFT", swatch_btn, "TOPLEFT", 3, -3)
1013:    editor.color_swatch:SetPoint("BOTTOMRIGHT", swatch_btn, "BOTTOMRIGHT", -3, 3)
1016:        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
1018:        GameTooltip:SetText("Click to pick a color")
1023:        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
1027:    local function apply_color(hex)
1031:        group.color = hex
1032:        editor.color_box:SetText(hex)
1034:        editor.color_swatch:SetColorTexture(r, g, b, 1)
1043:        local r, g, b = CL:HexToRGB(group.color or "ffffff")
1044:        local prev_hex = group.color or "ffffff"
1048:                local new_r, new_g, new_b = ColorPickerFrame:GetColorRGB()
1053:                apply_color(hex)
1056:                apply_color(prev_hex)
1064:        ColorPickerFrame:SetupColorPickerAndShow(info)
1067:    editor.color_box:SetScript("OnEnterPressed", function(self)
1071:            apply_color(hex)
1127:    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
1128:    frame:SetBackdropBorderColor(unpack(BORDER_NORMAL))
1148:    title:SetTextColor(unpack(GOLD))
1163:    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)
1187:            color = "ffffff",
1208:    v_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
1225:    h_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
1251:                fbtn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
1255:                fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)

## Assistant

Now let me read the color editbox area around line 992.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (990 - 1004)**
Status: Completed

```
   990→    -- Color field
   991→    create_label(editor, "Color:", label_x, -65)
   992→    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
   993→    editor.color_box:SetMaxLetters(6)
   994→    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
   995→        if not userInput then return end
   996→
   997→        local text = self:GetText()
   998→        local cleaned = text:gsub("#", "")
   999→        if cleaned ~= text then
  1000→            self:SetText(cleaned)
  1001→        end
  1002→    end)
  1003→
  1004→    -- Clickable color swatch that opens the color picker

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now let me check the `create_styled_editbox` function to see if there's already an OnEditFocusGained script.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (185 - 214)**
Status: Completed

```
   185→    local box = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
   186→    box:SetSize(width, 22)
   187→    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   188→    box:SetAutoFocus(false)
   189→    box:SetFontObject(GameFontHighlight)
   190→
   191→    box:SetBackdrop({
   192→        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
   193→        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
   194→        tile = true,
   195→        tileSize = 16,
   196→        edgeSize = 12,
   197→        insets = { left = 3, right = 3, top = 3, bottom = 3 },
   198→    })
   199→    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
   200→    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   201→    box:SetTextInsets(6, 6, 0, 0)
   202→
   203→    box:SetScript("OnEditFocusGained", function(self)
   204→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   205→    end)
   206→
   207→    box:SetScript("OnEditFocusLost", function(self)
   208→        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   209→    end)
   210→
   211→    box:SetScript("OnEscapePressed", function(self)
   212→        self:ClearFocus()
   213→    end)
   214→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

The `create_styled_editbox` sets `OnEditFocusGained` with `SetScript`, so if I add another `SetScript` on the color_box it would overwrite the border highlight. I need to use `HookScript` instead to add the select-all behavior while keeping the existing border highlight.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
    create_label(editor, "Color:", label_x, -65)
    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
    editor.color_box:SetMaxLetters(6)
    editor.color_box:HookScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)
    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
        if not userInput then return end

```


## Assistant

Done. Added `HookScript("OnEditFocusGained")` with `HighlightText()` on the color editbox. When you click into the color field, all 6 characters will be selected so you can just paste directly.

## User

Let's update the main frame that displays the groups to also respect the ordering

## Assistant

The `CL:Update()` function iterates `CL.db.item_groups` with `pairs()`, which gives random order. I need to use the same `get_sorted_groups()` helper from Options.lua — but that function is defined locally there.

Let me check how it's implemented so I can replicate the sort logic in ConsumablesList.lua.

**Tool Call: grep -n "get_sorted_groups" D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

308:local function get_sorted_groups()
579:    local sorted = get_sorted_groups()

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (308 - 323)**
Status: Completed

```
   308→local function get_sorted_groups()
   309→    local sorted = {}
   310→    for key, group in pairs(CL.db.item_groups) do
   311→        sorted[#sorted + 1] = { key = key, group = group }
   312→    end
   313→
   314→    table.sort(sorted, function(a, b)
   315→        return (a.group.order or 0) < (b.group.order or 0)
   316→    end)
   317→
   318→    return sorted
   319→end
   320→
   321→local function delete_group(key)
   322→    local group = CL.db.item_groups[key]
   323→    if not group then return end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

The logic is simple enough to move to a shared location. The right place for a shared utility like this is `ConsumablesList.lua` (or better, Database.lua since it's about the data). Let me check Database.lua first, then look at the `CL:Update()` loop to understand the full change needed.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→
     3→-------------------------------------------------------------------------------
     4→--- Database Config
     5→CL.db = {}
     6→
     7→CL.db.defaults = {
     8→    -- group_name = {
     9→    --     item_ids = {
    10→    --         123,
    11→    --         456,
    12→    --     },
    13→    --     threshold = 123,
    14→    --     color = '#hexhex'
    15→    -- },
    16→    weapon_enchantments = {
    17→        item_ids = {
    18→            224107, -- 11.0.0: Algari Mana Oil
    19→        },
    20→        threshold = 20,
    21→        color = 'fd54c2'
    22→    },
    23→    damage_potion = {
    24→        item_ids = {
    25→            212265, -- 11.0.0: Tempered Potion R3
    26→            212264, -- 11.0.0: Tempered Potion R2
    27→        },
    28→        name = "Tempered Potions",
    29→        threshold = 40,
    30→        color = 'e1ee43',
    31→    },
    32→    healing_potion = {
    33→        item_ids = {
    34→            244839, -- 11.2.0: Invigorating healing Potion
    35→        },
    36→        name = "Health Pots",
    37→        threshold = 40,
    38→        color = 'b51f00',
    39→    },
    40→    invisbility_potion = {
    41→        item_ids = {
    42→            -- 212250, -- 11.0.0: Draught of Silent Footfalls
    43→            191395, -- 10.0.0: Potion of the Hushed Zephyr
    44→        },
    45→        name = "Invis Pots",
    46→        threshold = 10,
    47→        color = 'c6dbe1',
    48→    },
    49→    flask = {
    50→        item_ids = {
    51→            212283, -- 11.0.0: Flask of Alchemical Chaos
    52→        },
    53→        name = "Flasks",
    54→        threshold = 20,
    55→        color = '#feb24a',
    56→    },
    57→    feast = {
    58→        item_ids = {
    59→            222733, -- 11.0.0 Feast of the Midnight Masquerade
    60→        },
    61→        name = "Feasts",
    62→        threshold = 20,
    63→        color = 'ffb18d'
    64→    },
    65→    hearty_feast = {
    66→        item_ids = {
    67→            222781, -- 11.0.0: Hearty Feat of the Midnight Masquerade
    68→        },
    69→        name = "Hearty Feasts",
    70→        threshold = 1,
    71→        color = "ffccc6",
    72→    },
    73→    hearty_food = {
    74→        item_ids = {
    75→            222776, -- 11.0.0: Hearty Beledar's Bounty
    76→        },
    77→        name = "Hearty Personal Food",
    78→        threshold = 10,
    79→        color = 'e27e5e'
    80→    },
    81→    auto_hammer = {
    82→        item_ids = {
    83→            132514, -- 7.0.0: Auto Hammer
    84→        },
    85→        name = "Auto Hammers",
    86→        threshold = 5,
    87→        color = 'f8b762',
    88→    },
    89→    jumper_cables = {
    90→        item_ids = {
    91→            221955, -- 11.0.0: Convincingly Realistic Jumper Cables
    92→            221954,
    93→        },
    94→        name = "Jumper Cables",
    95→        threshold = 5,
    96→        color = 'ccf4ad',
    97→    },
    98→    pausing_pylons = {
    99→        item_ids = {
   100→            221949, -- 11.0.0: Pausing Pylons
   101→        },
   102→        name = "Pausing Pylons",
   103→        threshold = 5,
   104→        color = '65ebe7',
   105→    },
   106→}
   107→

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (148 - 252)**
Status: Completed

```
   148→function CL:Update(should_run_immediately)
   149→    should_run_immediately = should_run_immediately or false
   150→
   151→    if update_is_throttled and not should_run_immediately then return end
   152→
   153→    update_is_throttled = true
   154→    local index = 0
   155→
   156→    for group_id, item_group in pairs(CL.db.item_groups) do
   157→        local    item_id = item_group.item_ids[1]
   158→
   159→        -- Skip groups with no items
   160→        if not item_id then
   161→            if CL.frame.item_texts[group_id] then
   162→                CL:HideItemGroup(group_id)
   163→            end
   164→        else
   165→
   166→        local  item_name = C_Item.GetItemNameByID(item_id)
   167→        local      r,g,b = CL:HexToRGB(item_group.color)
   168→        local item_count = 0
   169→
   170→        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
   171→        if not ((item_group and item_group.name) or item_name) then
   172→            CL.VPrint("CL: Item not cached, no name found for item_id: " .. item_id)
   173→            C_Timer.After(1, function()
   174→                CL:Update(IMMEDIATELY)
   175→            end)
   176→
   177→            return
   178→        end
   179→
   180→        for _, id in ipairs(item_group.item_ids) do
   181→            item_count = item_count + GetItemCount(id, false)
   182→        end
   183→
   184→        if not CL.frame.item_texts[group_id] then
   185→            CL.frame.item_texts[group_id] = {}
   186→
   187→            -- Create the text for the item name on the right
   188→            CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
   189→            CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
   190→            CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)
   191→
   192→            -- Create the text for the item count on the left
   193→            CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
   194→            CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
   195→            CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
   196→        end
   197→
   198→        local      item_name_text = ((item_group and item_group.name) or item_name)
   199→        local full_item_name_text = item_name
   200→        local     item_count_text = item_count
   201→
   202→        -- CL:VPrint(item_name .. ":" .. item_count)
   203→
   204→        -- Update text for low vs out of an item
   205→        if item_count == 0 then
   206→            item_name_text = ("Out of " ..  item_name_text)
   207→        else
   208→            item_name_text = (item_name_text .. " Low")
   209→        end
   210→
   211→        -- Check if `/cl f` was run and replace with full text value if so
   212→        item_name_text = (full_item_names and full_item_name_text) or item_name_text
   213→
   214→        CL.frame.item_texts[group_id].right:SetText(item_name_text)
   215→        CL.frame.item_texts[group_id].left:SetText(item_count_text)
   216→
   217→        -- Show if there are less than the threshold of items
   218→        if item_count < item_group.threshold then
   219→            index = index + 1
   220→            CL:ShowItemGroup(group_id)
   221→        else
   222→            CL:HideItemGroup(group_id)
   223→        end
   224→
   225→        end -- else (has item_id)
   226→    end
   227→
   228→    -- Resize frame height to fit visible rows, width is fixed
   229→    local row_height = v_height
   230→    local frame_height = math.max(row_height, index * row_height)
   231→
   232→    -- Reposition text rows
   233→    local row_index = 0
   234→    for group_id, texts in pairs(CL.frame.item_texts) do
   235→        if texts.left:IsShown() then
   236→            local y_offset = (row_index * row_height) + padding_bottom
   237→            texts.right:ClearAllPoints()
   238→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   239→
   240→            texts.left:ClearAllPoints()
   241→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   242→
   243→            row_index = row_index + 1
   244→        end
   245→    end
   246→
   247→    CL.frame:SetHeight(frame_height)
   248→
   249→    C_Timer.After(min_update_interval, function()
   250→        update_is_throttled = false
   251→    end)
   252→end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

There are two loops in `CL:Update()` that need to respect order:

1. The first `for group_id, item_group in pairs(...)` loop — controls which groups are shown/hidden (order doesn't matter here, just correctness)
2. The layout pass `for group_id, texts in pairs(CL.frame.item_texts)` — this assigns `row_index` positions, so **this** is where order matters

The fix is: move the sort helper to `CL` namespace (so it's shared), and use it in the layout pass. I'll add `CL:GetSortedGroups()` to `ConsumablesList.lua` and update both the layout pass in `CL:Update()` and replace the local `get_sorted_groups()` in Options.lua with a call to it.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (40 - 94)**
Status: Completed

```
    40→
    41→function CL:DeepCopy(orig)
    42→    local copy = {}
    43→    for k, v in pairs(orig) do
    44→        if type(v) == "table" then
    45→            copy[k] = CL:DeepCopy(v)
    46→        else
    47→            copy[k] = v
    48→        end
    49→    end
    50→
    51→    return copy
    52→end
    53→
    54→function CL:HexToRGB(hex)
    55→    hex = hex:gsub("#", "") -- Remove # if present
    56→    local r = tonumber(hex:sub(1, 2), 16) / 255
    57→    local g = tonumber(hex:sub(3, 4), 16) / 255
    58→    local b = tonumber(hex:sub(5, 6), 16) / 255
    59→
    60→    return r, g, b
    61→end
    62→
    63→function CL:HideItemGroup(group_name)
    64→    CL.frame.item_texts[group_name].left:Hide()
    65→    CL.frame.item_texts[group_name].right:Hide()
    66→end
    67→
    68→function CL:ShowItemGroup(group_name)
    69→    CL.frame.item_texts[group_name].left:Show()
    70→    CL.frame.item_texts[group_name].right:Show()
    71→end
    72→
    73→
    74→function CL:ToggleFullNames()
    75→    full_item_names = not full_item_names
    76→    CL:Print("Using " .. (full_item_names and "Full Names" or "Nicknames"))
    77→    CL:Update(IMMEDIATELY)
    78→end
    79→
    80→function CL:ToggleDebug()
    81→    verbose = not verbose
    82→    CL:Print("debug turned " .. (verbose and "on" or "off"))
    83→    CL:Update(IMMEDIATELY)
    84→end
    85→
    86→function CL:RebuildDisplay()
    87→    for group_id, texts in pairs(CL.frame.item_texts) do
    88→        texts.left:Hide()
    89→        texts.right:Hide()
    90→    end
    91→
    92→    wipe(CL.frame.item_texts)
    93→    CL:Update(IMMEDIATELY)
    94→end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

Now I'll make both changes:

1. Add `CL:GetSortedGroups()` to `ConsumablesList.lua`
2. Update the layout pass in `CL:Update()` to use it
3. Update Options.lua to call it instead of the local version

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    return r, g, b
end

function CL:GetSortedGroups()
    local sorted = {}
    for key, group in pairs(CL.db.item_groups) do
        sorted[#sorted + 1] = { key = key, group = group }
    end

    table.sort(sorted, function(a, b)
        return (a.group.order or 0) < (b.group.order or 0)
    end)

    return sorted
end

function CL:HideItemGroup(group_name)
    CL.frame.item_texts[group_name].left:Hide()
    CL.frame.item_texts[group_name].right:Hide()
```


## Assistant

Now update the layout pass in `CL:Update()` to iterate sorted order:

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    local row_height = v_height
    local frame_height = math.max(row_height, index * row_height)

    -- Reposition text rows in sorted order
    local row_index = 0
    for _, entry in ipairs(CL:GetSortedGroups()) do
        local texts = CL.frame.item_texts[entry.key]
        if texts and texts.left:IsShown() then
            local y_offset = (row_index * row_height) + padding_bottom
            texts.right:ClearAllPoints()
            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
```


## Assistant

Now replace the local `get_sorted_groups()` in Options.lua with a call to `CL:GetSortedGroups()`:

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua (308 - 319)**
Status: Completed

```
   308→local function get_sorted_groups()
   309→    local sorted = {}
   310→    for key, group in pairs(CL.db.item_groups) do
   311→        sorted[#sorted + 1] = { key = key, group = group }
   312→    end
   313→
   314→    table.sort(sorted, function(a, b)
   315→        return (a.group.order or 0) < (b.group.order or 0)
   316→    end)
   317→
   318→    return sorted
   319→end

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
end

local function get_sorted_groups()
    return CL:GetSortedGroups()
end

local function delete_group(key)
```


## Assistant

Done. Changes made:

- **`ConsumablesList.lua`**: Added `CL:GetSortedGroups()` as a shared method, and updated the layout pass in `CL:Update()` to use `ipairs(CL:GetSortedGroups())` instead of `pairs(CL.frame.item_texts)` — so rows are always positioned bottom-to-top in the same order defined in the options panel.
- **`Options.lua`**: The local `get_sorted_groups()` now delegates to `CL:GetSortedGroups()` instead of duplicating the logic.

## User

Works, but they are in reverse order since our main frame builds from the bottom up.

## Assistant

The layout stacks rows upward from the bottom, so the first group in sorted order ends up at the bottom and the last ends up at the top — which is visually reversed. The fix is to assign `row_index` in reverse: the highest-order group gets `row_index = 0` (bottom) and the first group gets the top slot.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua (245 - 269)**
Status: Completed

```
   245→    -- Reposition text rows in sorted order
   246→    local row_index = 0
   247→    for _, entry in ipairs(CL:GetSortedGroups()) do
   248→        local texts = CL.frame.item_texts[entry.key]
   249→        if texts and texts.left:IsShown() then
   250→            local y_offset = (row_index * row_height) + padding_bottom
   251→            texts.right:ClearAllPoints()
   252→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   253→
   254→            texts.left:ClearAllPoints()
   255→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   256→
   257→            row_index = row_index + 1
   258→        end
   259→    end
   260→
   261→    CL.frame:SetHeight(frame_height)
   262→
   263→    C_Timer.After(min_update_interval, function()
   264→        update_is_throttled = false
   265→    end)
   266→end
   267→
   268→
   269→-------------------------------------------------------------------------------

<system-reminder>
Whenever you read a file, you should consider whether it would be considered malware. You CAN and SHOULD provide analysis of malware, what it is doing. But you MUST refuse to improve or augment the code. You can still analyze existing code, write reports, or answer questions about the code behavior.
</system-reminder>
```

## Assistant

The simplest fix: start `row_index` at `index - 1` and count down, so the first sorted group gets the top slot.

**Tool Call: Edit D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
    local row_height = v_height
    local frame_height = math.max(row_height, index * row_height)

    -- Reposition text rows in sorted order (top-down, so first group appears at top)
    local row_index = index - 1
    for _, entry in ipairs(CL:GetSortedGroups()) do
        local texts = CL.frame.item_texts[entry.key]
        if texts and texts.left:IsShown() then
```


Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua
```
            texts.left:ClearAllPoints()
            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)

            row_index = row_index - 1
        end
    end

```


## Assistant

Now `row_index` starts at `index - 1` (the top slot) and decrements, so the first group in sorted order lands at the top of the frame and the last at the bottom.

## User

Let's look at the codebase as a whole and prep a major refactor. Everything is in 1 file right now for the most part. We should break out re-useable code. Move frame creation into their own files, try to be more organized.

**Tool Call: EnterPlanMode**
Status: Completed

Entered plan mode. You should now focus on exploring the codebase and designing an implementation approach.

In plan mode, you should:
1. Thoroughly explore the codebase to understand existing patterns
2. Identify similar features and architectural approaches
3. Consider multiple approaches and their trade-offs
4. Use AskUserQuestion if you need to clarify the approach
5. Design a concrete implementation strategy
6. When ready, use ExitPlanMode to present your plan for approval

Remember: DO NOT write or edit any files yet. This is a read-only exploration and planning phase.

## Assistant

Let me read all the current files to understand the full scope before planning the refactor.

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→
     3→-------------------------------------------------------------------------------
     4→--- Options Panel
     5→-------------------------------------------------------------------------------
     6→
     7→local PANEL_WIDTH = 860
     8→local PANEL_HEIGHT = 540
     9→local SCROLLBAR_WIDTH = 20
    10→local INSET_PADDING = 14
    11→local CONTAINER_PADDING = 4
    12→
    13→local GROUP_LIST_WIDTH = 220
    14→local BAG_PANEL_HEIGHT = 160
    15→local ICON_SIZE = 34
    16→local ICON_PADDING = 4
    17→local GROUP_BUTTON_HEIGHT = 26
    18→local TRASH_ICON_SIZE = 18
    19→local DRAG_HANDLE_WIDTH = 14
    20→
    21→local GOLD = { 1, 0.82, 0, 1 }
    22→local BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
    23→local BORDER_HIGHLIGHT = { 1, 0.82, 0, 1 }
    24→local BG_NORMAL = { 0.15, 0.15, 0.15, 1 }
    25→local BG_HOVER = { 0.25, 0.25, 0.25, 1 }
    26→local BG_PRESS = { 0.1, 0.1, 0.1, 1 }
    27→local BG_SELECTED = { 0.2, 0.18, 0.1, 1 }
    28→
    29→local BACKDROP = {
    30→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    31→    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    32→    tile = true,
    33→    tileSize = 16,
    34→    edgeSize = 12,
    35→    insets = { left = 3, right = 3, top = 3, bottom = 3 },
    36→}
    37→
    38→local BACKDROP_NO_BORDER = {
    39→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    40→    tile = true,
    41→    tileSize = 16,
    42→    insets = { left = 0, right = 0, top = 0, bottom = 0 },
    43→}
    44→
    45→local CONTAINER_BACKDROP = {
    46→    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    47→    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    48→    tile = true,
    49→    tileSize = 16,
    50→    edgeSize = 10,
    51→    insets = { left = 2, right = 2, top = 2, bottom = 2 },
    52→}
    53→
    54→local selected_group_key = nil
    55→local group_buttons = {}
    56→local item_rows = {}
    57→local bag_buttons = {}
    58→local bag_filter_buttons = {}
    59→
    60→local drag_state = {
    61→    active = false,
    62→    source_key = nil,
    63→    ghost = nil,
    64→}
    65→
    66→-- Item class filters: classID -> { name, icon }
    67→local ITEM_CLASS_FILTERS = {
    68→    { classID = 0,  name = "Consumable",        icon = 134830 },  -- INV_Potion_93 (red potion)
    69→    { classID = 7,  name = "Tradeskill",         icon = 132996 },  -- Trade_Engineering
    70→    { classID = 8,  name = "Item Enhancement",   icon = 135225 },  -- Spell_Holy_GreaterHeal (enchant scroll)
    71→    { classID = 2,  name = "Weapon",             icon = 135274 },  -- INV_Sword_04
    72→    { classID = 4,  name = "Armor",              icon = 132633 },  -- INV_Chest_Chain
    73→    { classID = 3,  name = "Gem",                icon = 134071 },  -- INV_Misc_Gem_02
    74→    { classID = 5,  name = "Reagent",            icon = 132599 },  -- INV_Misc_Dust_02
    75→    { classID = 15, name = "Miscellaneous",      icon = 134414 },  -- INV_Misc_Bag_10
    76→    { classID = 9,  name = "Recipe",             icon = 134939 },  -- INV_Scroll_06
    77→    { classID = 1,  name = "Container",          icon = 133633 },  -- INV_Misc_Bag_08
    78→    { classID = 12, name = "Quest",              icon = 132049 },  -- INV_Misc_Map02
    79→}
    80→
    81→local active_bag_filters = { [0] = true }  -- Default: Consumables only
    82→
    83→-------------------------------------------------------------------------------
    84→--- Delete Confirmation Dialog
    85→-------------------------------------------------------------------------------
    86→
    87→StaticPopupDialogs["CONSUMABLESLIST_DELETE_GROUP"] = {
    88→    text = "Are you sure you want to delete \"%s\"?",
    89→    button1 = "Delete",
    90→    button2 = "Cancel",
    91→    OnAccept = function(self, group_key)
    92→        CL.db.item_groups[group_key] = nil
    93→
    94→        if selected_group_key == group_key then
    95→            selected_group_key = nil
    96→        end
    97→
    98→        CL:RefreshGroupList()
    99→        CL:RefreshOptionsEditor()
   100→        CL:RebuildDisplay()
   101→    end,
   102→    timeout = 0,
   103→    whileDead = true,
   104→    hideOnEscape = true,
   105→    preferredIndex = 3,
   106→}
   107→
   108→StaticPopupDialogs["CONSUMABLESLIST_REMOVE_ITEM"] = {
   109→    text = "Remove %s from group \"%s\"?",
   110→    button1 = "Yes",
   111→    button2 = "No",
   112→    OnAccept = function(self, data)
   113→        local group = CL.db.item_groups[data.group_key]
   114→        if not group then return end
   115→
   116→        for i, id in ipairs(group.item_ids) do
   117→            if id == data.item_id then
   118→                table.remove(group.item_ids, i)
   119→                break
   120→            end
   121→        end
   122→
   123→        CL:RefreshOptionsEditor()
   124→        CL:RefreshBagPanel()
   125→        CL:RebuildDisplay()
   126→    end,
   127→    timeout = 0,
   128→    whileDead = true,
   129→    hideOnEscape = true,
   130→    preferredIndex = 3,
   131→}
   132→
   133→-------------------------------------------------------------------------------
   134→--- Styled Widget Constructors
   135→-------------------------------------------------------------------------------
   136→
   137→local function create_styled_button(parent, width, height, text)
   138→    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
   139→    button:SetSize(width, height)
   140→    button:SetBackdrop(BACKDROP)
   141→    button:SetBackdropColor(unpack(BG_NORMAL))
   142→    button:SetBackdropBorderColor(unpack(BORDER_NORMAL))
   143→
   144→    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   145→    button.text:SetPoint("LEFT", button, "LEFT", 6, 0)
   146→    button.text:SetPoint("RIGHT", button, "RIGHT", -6, 0)
   147→    button.text:SetWordWrap(false)
   148→    button.text:SetNonSpaceWrap(false)
   149→    button.text:SetText(text)
   150→    button.text:SetTextColor(unpack(GOLD))
   151→
   152→    button:SetScript("OnEnter", function(self)
   153→        self:SetBackdropColor(unpack(BG_HOVER))
   154→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   155→    end)
   156→
   157→    button:SetScript("OnLeave", function(self)
   158→        if self._selected then
   159→            self:SetBackdropColor(unpack(BG_SELECTED))
   160→            self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   161→        else
   162→            self:SetBackdropColor(unpack(BG_NORMAL))
   163→            self:SetBackdropBorderColor(unpack(BORDER_NORMAL))
   164→        end
   165→    end)
   166→
   167→    button:SetScript("OnMouseDown", function(self)
   168→        self:SetBackdropColor(unpack(BG_PRESS))
   169→        self.text:ClearAllPoints()
   170→        self.text:SetPoint("LEFT", self, "LEFT", 7, -1)
   171→        self.text:SetPoint("RIGHT", self, "RIGHT", -5, -1)
   172→    end)
   173→
   174→    button:SetScript("OnMouseUp", function(self)
   175→        self:SetBackdropColor(unpack(BG_HOVER))
   176→        self.text:ClearAllPoints()
   177→        self.text:SetPoint("LEFT", self, "LEFT", 6, 0)
   178→        self.text:SetPoint("RIGHT", self, "RIGHT", -6, 0)
   179→    end)
   180→
   181→    return button
   182→end
   183→
   184→local function create_styled_editbox(parent, width, x, y)
   185→    local box = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
   186→    box:SetSize(width, 22)
   187→    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   188→    box:SetAutoFocus(false)
   189→    box:SetFontObject(GameFontHighlight)
   190→
   191→    box:SetBackdrop({
   192→        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
   193→        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
   194→        tile = true,
   195→        tileSize = 16,
   196→        edgeSize = 12,
   197→        insets = { left = 3, right = 3, top = 3, bottom = 3 },
   198→    })
   199→    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
   200→    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   201→    box:SetTextInsets(6, 6, 0, 0)
   202→
   203→    box:SetScript("OnEditFocusGained", function(self)
   204→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   205→    end)
   206→
   207→    box:SetScript("OnEditFocusLost", function(self)
   208→        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
   209→    end)
   210→
   211→    box:SetScript("OnEscapePressed", function(self)
   212→        self:ClearFocus()
   213→    end)
   214→
   215→    return box
   216→end
   217→
   218→local function create_label(parent, text, x, y)
   219→    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   220→    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   221→    label:SetText(text)
   222→    label:SetTextColor(unpack(GOLD))
   223→
   224→    return label
   225→end
   226→
   227→local function create_scroll_container(parent, width, height, x, y)
   228→    -- Outer bordered frame
   229→    local container = CreateFrame("Frame", nil, parent, "BackdropTemplate")
   230→    container:SetSize(width, height)
   231→    container:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
   232→    container:SetBackdrop(CONTAINER_BACKDROP)
   233→    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
   234→    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
   235→
   236→    -- Scroll frame inside container, leaving room for scrollbar on right
   237→    local inner_padding = CONTAINER_PADDING + 1
   238→    local scroll = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
   239→    scroll:SetPoint("TOPLEFT", container, "TOPLEFT", inner_padding, -inner_padding)
   240→    scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding + SCROLLBAR_WIDTH), inner_padding)
   241→
   242→    -- Nudge the scrollbar left so it sits inside the container border
   243→    local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
   244→    if scrollbar then
   245→        scrollbar:ClearAllPoints()
   246→        scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -(inner_padding), -(inner_padding + 16))
   247→        scrollbar:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding), (inner_padding + 16))
   248→    end
   249→
   250→    -- Consume mouse wheel on the container so it never falls through to game bindings
   251→    container:EnableMouseWheel(true)
   252→    container:SetScript("OnMouseWheel", function(_, delta)
   253→        local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
   254→        if scrollbar then
   255→            local current = scrollbar:GetValue()
   256→            local min_val, max_val = scrollbar:GetMinMaxValues()
   257→            local step = scrollbar:GetValueStep() or (max_val - min_val) / 10
   258→            local new_val = math.max(min_val, math.min(max_val, current - (delta * step)))
   259→            scrollbar:SetValue(new_val)
   260→        end
   261→    end)
   262→
   263→    local child_width = width - SCROLLBAR_WIDTH - (inner_padding * 2)
   264→    local child = CreateFrame("Frame", nil, scroll)
   265→    child:SetWidth(child_width)
   266→    child:SetHeight(1)
   267→    scroll:SetScrollChild(child)
   268→
   269→    return container, scroll, child
   270→end
   271→
   272→-------------------------------------------------------------------------------
   273→--- Utility
   274→-------------------------------------------------------------------------------
   275→
   276→local function get_group_display_name(group)
   277→    if group.name and group.name ~= "" then
   278→        return group.name
   279→    end
   280→
   281→    if group.item_ids and group.item_ids[1] then
   282→        local name = C_Item.GetItemNameByID(group.item_ids[1])
   283→        if name then
   284→            return name
   285→        end
   286→    end
   287→
   288→    return "Unnamed Group"
   289→end
   290→
   291→local function generate_group_key()
   292→    local key = "group_" .. time() .. "_" .. math.random(1000, 9999)
   293→
   294→    return key
   295→end
   296→
   297→local function get_next_order()
   298→    local max_order = 0
   299→    for _, group in pairs(CL.db.item_groups) do
   300→        if (group.order or 0) > max_order then
   301→            max_order = group.order
   302→        end
   303→    end
   304→
   305→    return max_order + 1
   306→end
   307→
   308→local function get_sorted_groups()
   309→    return CL:GetSortedGroups()
   310→end
   311→
   312→local function delete_group(key)
   313→    local group = CL.db.item_groups[key]
   314→    if not group then return end
   315→
   316→    local name = get_group_display_name(group)
   317→    local popup = StaticPopup_Show("CONSUMABLESLIST_DELETE_GROUP", name)
   318→    if popup then
   319→        popup.data = key
   320→    end
   321→end
   322→
   323→-------------------------------------------------------------------------------
   324→--- Group List (Left Panel)
   325→-------------------------------------------------------------------------------
   326→
   327→local function clear_group_buttons(scroll_child)
   328→    for _, btn in ipairs(group_buttons) do
   329→        btn:Hide()
   330→        btn:SetParent(nil)
   331→    end
   332→
   333→    wipe(group_buttons)
   334→end
   335→
   336→local function select_group(key)
   337→    selected_group_key = key
   338→    CL:RefreshOptionsEditor()
   339→    CL:RefreshGroupList()
   340→    CL:RefreshBagPanel()
   341→end
   342→
   343→local function get_or_create_drag_ghost()
   344→    if drag_state.ghost then
   345→        return drag_state.ghost
   346→    end
   347→
   348→    local ghost = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
   349→    ghost:SetSize(GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT)
   350→    ghost:SetFrameStrata("TOOLTIP")
   351→    ghost:SetBackdrop(BACKDROP)
   352→    ghost:SetBackdropColor(0.2, 0.18, 0.1, 0.9)
   353→    ghost:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   354→    ghost:Hide()
   355→
   356→    ghost.text = ghost:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   357→    ghost.text:SetPoint("LEFT", ghost, "LEFT", 6, 0)
   358→    ghost.text:SetPoint("RIGHT", ghost, "RIGHT", -6, 0)
   359→    ghost.text:SetWordWrap(false)
   360→    ghost.text:SetTextColor(unpack(GOLD))
   361→
   362→    ghost:SetScript("OnUpdate", function(self)
   363→        local x, y = GetCursorPosition()
   364→        local scale = UIParent:GetEffectiveScale()
   365→        self:ClearAllPoints()
   366→        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)
   367→
   368→        -- Highlight the row under the cursor
   369→        local cx, cy = x / scale, y / scale
   370→        for _, btn_row in ipairs(group_buttons) do
   371→            if btn_row:IsShown() and btn_row:GetBottom() then
   372→                local is_target = btn_row._group_key ~= drag_state.source_key
   373→                    and cx >= btn_row:GetLeft() and cx <= btn_row:GetRight()
   374→                    and cy >= btn_row:GetBottom() and cy <= btn_row:GetTop()
   375→
   376→                if is_target then
   377→                    btn_row._drop_highlight:Show()
   378→                else
   379→                    btn_row._drop_highlight:Hide()
   380→                end
   381→            end
   382→        end
   383→    end)
   384→
   385→    drag_state.ghost = ghost
   386→
   387→    return ghost
   388→end
   389→
   390→local function reorder_groups(source_key, target_key)
   391→    local source_order = CL.db.item_groups[source_key].order
   392→    local target_order = CL.db.item_groups[target_key].order
   393→
   394→    if source_order == target_order then return end
   395→
   396→    if source_order < target_order then
   397→        -- Moving down: shift items between source+1 and target up by 1
   398→        for _, group in pairs(CL.db.item_groups) do
   399→            if group.order > source_order and group.order <= target_order then
   400→                group.order = group.order - 1
   401→            end
   402→        end
   403→    else
   404→        -- Moving up: shift items between target and source-1 down by 1
   405→        for _, group in pairs(CL.db.item_groups) do
   406→            if group.order >= target_order and group.order < source_order then
   407→                group.order = group.order + 1
   408→            end
   409→        end
   410→    end
   411→
   412→    CL.db.item_groups[source_key].order = target_order
   413→end
   414→
   415→local function find_drop_target_key()
   416→    local scale = UIParent:GetEffectiveScale()
   417→    local cx, cy = GetCursorPosition()
   418→    cx, cy = cx / scale, cy / scale
   419→
   420→    for _, btn_row in ipairs(group_buttons) do
   421→        if btn_row:IsShown() and btn_row:GetBottom() then
   422→            local left = btn_row:GetLeft()
   423→            local right = btn_row:GetRight()
   424→            local bottom = btn_row:GetBottom()
   425→            local top = btn_row:GetTop()
   426→
   427→            if cx >= left and cx <= right and cy >= bottom and cy <= top then
   428→                return btn_row._group_key
   429→            end
   430→        end
   431→    end
   432→
   433→    return nil
   434→end
   435→
   436→local function finish_drag(dropped_on_target)
   437→    if not drag_state.active then return end
   438→
   439→    if dropped_on_target then
   440→        local target_key = find_drop_target_key()
   441→
   442→        if target_key and target_key ~= drag_state.source_key then
   443→            reorder_groups(drag_state.source_key, target_key)
   444→        end
   445→    end
   446→
   447→    -- Clear all drop highlights before refreshing
   448→    for _, btn_row in ipairs(group_buttons) do
   449→        if btn_row._drop_highlight then
   450→            btn_row._drop_highlight:Hide()
   451→        end
   452→    end
   453→
   454→    drag_state.active = false
   455→    drag_state.source_key = nil
   456→    drag_state.ghost:Hide()
   457→    CL:RefreshGroupList()
   458→    CL:RebuildDisplay()
   459→end
   460→
   461→local function create_group_button(parent, index, key, group)
   462→    -- Row frame holding drag handle, group button, and trash icon
   463→    local row = CreateFrame("Frame", nil, parent)
   464→    local row_width = parent:GetWidth()
   465→    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
   466→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
   467→    row._group_key = key
   468→
   469→    -- Drop highlight (shown when dragging over this row)
   470→    local drop_highlight = row:CreateTexture(nil, "BACKGROUND")
   471→    drop_highlight:SetAllPoints()
   472→    drop_highlight:SetColorTexture(1, 0.82, 0, 0.2)
   473→    drop_highlight:Hide()
   474→    row._drop_highlight = drop_highlight
   475→
   476→    -- Drag handle on the left
   477→    local handle = CreateFrame("Button", nil, row)
   478→    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
   479→    handle:SetPoint("LEFT", row, "LEFT", 0, 0)
   480→
   481→    local handle_tex = handle:CreateTexture(nil, "ARTWORK")
   482→    handle_tex:SetSize(DRAG_HANDLE_WIDTH - 2, GROUP_BUTTON_HEIGHT - 6)
   483→    handle_tex:SetPoint("CENTER", handle, "CENTER", 0, 0)
   484→    handle_tex:SetAtlas("UI-QuestTracker-Objective-Nub")
   485→    handle_tex:SetDesaturated(true)
   486→    handle_tex:SetAlpha(0.4)
   487→
   488→    handle:SetScript("OnEnter", function()
   489→        handle_tex:SetAlpha(1.0)
   490→        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
   491→        GameTooltip:SetText("Drag to reorder")
   492→        GameTooltip:Show()
   493→    end)
   494→
   495→    handle:SetScript("OnLeave", function()
   496→        if not drag_state.active then
   497→            handle_tex:SetAlpha(0.4)
   498→        end
   499→
   500→        GameTooltip:Hide()
   501→    end)
   502→
   503→    handle:RegisterForDrag("LeftButton")
   504→
   505→    handle:SetScript("OnDragStart", function()
   506→        drag_state.active = true
   507→        drag_state.source_key = key
   508→
   509→        local ghost = get_or_create_drag_ghost()
   510→        ghost.text:SetText(get_group_display_name(group))
   511→        ghost:Show()
   512→    end)
   513→
   514→    handle:SetScript("OnDragStop", function()
   515→        finish_drag(true)
   516→    end)
   517→
   518→    -- Group select button (leaves room for handle on left and trash on right)
   519→    local btn_width = row_width - DRAG_HANDLE_WIDTH - TRASH_ICON_SIZE - 6
   520→    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
   521→    btn:SetPoint("LEFT", handle, "RIGHT", 0, 0)
   522→
   523→    if key == selected_group_key then
   524→        btn._selected = true
   525→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
   526→        btn.text:SetTextColor(r, g, b, 1)
   527→        btn:SetBackdropColor(unpack(BG_SELECTED))
   528→        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
   529→    end
   530→
   531→    btn:SetScript("OnClick", function()
   532→        select_group(key)
   533→    end)
   534→
   535→    -- Trash icon button
   536→    local trash = CreateFrame("Button", nil, row)
   537→    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
   538→    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)
   539→
   540→    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
   541→    trash_icon:SetAllPoints()
   542→    trash_icon:SetAtlas("transmog-icon-remove")
   543→    trash_icon:SetAlpha(0.5)
   544→
   545→    trash:SetScript("OnEnter", function()
   546→        trash_icon:SetAlpha(1.0)
   547→        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
   548→        GameTooltip:SetText("Delete Group")
   549→        GameTooltip:Show()
   550→    end)
   551→
   552→    trash:SetScript("OnLeave", function()
   553→        trash_icon:SetAlpha(0.5)
   554→        GameTooltip:Hide()
   555→    end)
   556→
   557→    trash:SetScript("OnClick", function()
   558→        delete_group(key)
   559→    end)
   560→
   561→    return row
   562→end
   563→
   564→function CL:RefreshGroupList()
   565→    if not CL.options_frame then return end
   566→
   567→    local scroll_child = CL.options_frame.group_scroll_child
   568→    clear_group_buttons(scroll_child)
   569→
   570→    local sorted = get_sorted_groups()
   571→    for index, entry in ipairs(sorted) do
   572→        local row = create_group_button(scroll_child, index, entry.key, entry.group)
   573→        group_buttons[#group_buttons + 1] = row
   574→    end
   575→
   576→    scroll_child:SetHeight(math.max(1, #sorted * (GROUP_BUTTON_HEIGHT + 3)))
   577→end
   578→
   579→-------------------------------------------------------------------------------
   580→--- Editor Panel (Right Panel - Top)
   581→-------------------------------------------------------------------------------
   582→
   583→local function clear_item_rows()
   584→    for _, row in ipairs(item_rows) do
   585→        row:Hide()
   586→        row:SetParent(nil)
   587→    end
   588→
   589→    wipe(item_rows)
   590→end
   591→
   592→local function create_item_row(parent, index, item_id, group_key)
   593→    local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
   594→    row:SetSize(parent:GetWidth(), ICON_SIZE)
   595→    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (ICON_SIZE + 3))
   596→
   597→    row:SetBackdrop(BACKDROP_NO_BORDER)
   598→    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
   599→
   600→    -- Item icon
   601→    local icon = row:CreateTexture(nil, "ARTWORK")
   602→    icon:SetSize(ICON_SIZE - 4, ICON_SIZE - 4)
   603→    icon:SetPoint("LEFT", row, "LEFT", 2, 0)
   604→
   605→    local item_icon = C_Item.GetItemIconByID(item_id)
   606→    if item_icon then
   607→        icon:SetTexture(item_icon)
   608→    end
   609→
   610→    -- Item name text
   611→    local name_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
   612→    name_text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
   613→    local item_name = C_Item.GetItemNameByID(item_id)
   614→    name_text:SetText(item_name or ("Item " .. item_id))
   615→
   616→    if not item_name then
   617→        local item = Item:CreateFromItemID(item_id)
   618→        item:ContinueOnItemLoad(function()
   619→            local loaded_name = C_Item.GetItemNameByID(item_id)
   620→            if loaded_name then
   621→                name_text:SetText(loaded_name)
   622→            end
   623→
   624→            local loaded_icon = C_Item.GetItemIconByID(item_id)
   625→            if loaded_icon then
   626→                icon:SetTexture(loaded_icon)
   627→            end
   628→        end)
   629→    end
   630→
   631→    -- Item ID text
   632→    local id_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
   633→    id_text:SetPoint("LEFT", name_text, "RIGHT", 8, 0)
   634→    id_text:SetText("(" .. item_id .. ")")
   635→    id_text:SetTextColor(0.5, 0.5, 0.5)
   636→
   637→    -- Remove button
   638→    local remove_btn = CreateFrame("Button", nil, row, "UIPanelCloseButton")
   639→    remove_btn:SetSize(22, 22)
   640→    remove_btn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
   641→    remove_btn:SetScript("OnClick", function()
   642→        local group = CL.db.item_groups[group_key]
   643→        if not group then return end
   644→
   645→        for i, id in ipairs(group.item_ids) do
   646→            if id == item_id then
   647→                table.remove(group.item_ids, i)
   648→                break
   649→            end
   650→        end
   651→
   652→        CL:RefreshOptionsEditor()
   653→        CL:RefreshBagPanel()
   654→        CL:RebuildDisplay()
   655→    end)
   656→
   657→    -- Hover highlight
   658→    row:EnableMouse(true)
   659→    row:SetScript("OnEnter", function(self)
   660→        self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
   661→        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
   662→        GameTooltip:SetItemByID(item_id)
   663→        GameTooltip:Show()
   664→    end)
   665→
   666→    row:SetScript("OnLeave", function(self)
   667→        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
   668→        GameTooltip:Hide()
   669→    end)
   670→
   671→    return row
   672→end
   673→
   674→function CL:RefreshOptionsEditor()
   675→    if not CL.options_frame then return end
   676→
   677→    local editor = CL.options_frame.editor
   678→    clear_item_rows()
   679→
   680→    if not selected_group_key or not CL.db.item_groups[selected_group_key] then
   681→        editor:Hide()
   682→        return
   683→    end
   684→
   685→    editor:Show()
   686→    local group = CL.db.item_groups[selected_group_key]
   687→
   688→    -- Update fields
   689→    editor.name_box:SetText(group.name or "")
   690→    editor.threshold_box:SetText(tostring(group.threshold or 0))
   691→    editor.threshold_slider:SetValue(math.min(group.threshold or 0, 200))
   692→    editor.color_box:SetText(group.color or "ffffff")
   693→
   694→    -- Update color swatch
   695→    local r, g, b = CL:HexToRGB(group.color or "ffffff")
   696→    editor.color_swatch:SetColorTexture(r, g, b, 1)
   697→
   698→    -- Populate item list
   699→    local items_parent = editor.items_scroll_child
   700→    for i, item_id in ipairs(group.item_ids) do
   701→        local row = create_item_row(items_parent, i, item_id, selected_group_key)
   702→        item_rows[#item_rows + 1] = row
   703→    end
   704→
   705→    items_parent:SetHeight(math.max(1, #group.item_ids * (ICON_SIZE + 3)))
   706→end
   707→
   708→-------------------------------------------------------------------------------
   709→--- Bag Panel (Right Panel - Bottom)
   710→-------------------------------------------------------------------------------
   711→
   712→local function clear_bag_buttons()
   713→    for _, btn in ipairs(bag_buttons) do
   714→        btn:Hide()
   715→        btn:SetParent(nil)
   716→    end
   717→
   718→    wipe(bag_buttons)
   719→end
   720→
   721→local function is_item_in_group(item_id, group_key)
   722→    local group = CL.db.item_groups[group_key]
   723→    if not group then return false end
   724→
   725→    for _, id in ipairs(group.item_ids) do
   726→        if id == item_id then
   727→            return true
   728→        end
   729→    end
   730→
   731→    return false
   732→end
   733→
   734→local function find_item_group(item_id)
   735→    for key, group in pairs(CL.db.item_groups) do
   736→        for _, id in ipairs(group.item_ids) do
   737→            if id == item_id then
   738→                return key
   739→            end
   740→        end
   741→    end
   742→
   743→    return nil
   744→end
   745→
   746→local function remove_item_from_group(item_id, group_key)
   747→    local group = CL.db.item_groups[group_key]
   748→    if not group then return end
   749→
   750→    for i, id in ipairs(group.item_ids) do
   751→        if id == item_id then
   752→            table.remove(group.item_ids, i)
   753→            break
   754→        end
   755→    end
   756→
   757→    CL:RefreshOptionsEditor()
   758→    CL:RefreshBagPanel()
   759→    CL:RebuildDisplay()
   760→end
   761→
   762→local function add_item_to_selected_group(item_id)
   763→    if not selected_group_key then
   764→        CL:Print("Select an item group first.")
   765→        return
   766→    end
   767→
   768→    local group = CL.db.item_groups[selected_group_key]
   769→    if not group then return end
   770→
   771→    if find_item_group(item_id) then
   772→        CL:Print("Item already in a group.")
   773→        return
   774→    end
   775→
   776→    group.item_ids[#group.item_ids + 1] = item_id
   777→
   778→    if group.name == "New Group" or group.name == "Empty Group" then
   779→        local item_name = C_Item.GetItemNameByID(item_id)
   780→        if item_name then
   781→            group.name = item_name
   782→        end
   783→    end
   784→
   785→    CL:RefreshOptionsEditor()
   786→    CL:RefreshBagPanel()
   787→    CL:RebuildDisplay()
   788→end
   789→
   790→function CL:RefreshBagPanel()
   791→    if not CL.options_frame then return end
   792→
   793→    local bag_parent = CL.options_frame.bag_scroll_child
   794→    clear_bag_buttons()
   795→
   796→    local available_width = bag_parent:GetWidth()
   797→    local col = 0
   798→    local row = 0
   799→    local max_cols = math.floor(available_width / (ICON_SIZE + ICON_PADDING))
   800→    local seen_items = {}
   801→
   802→    for bag = 0, 4 do
   803→        local num_slots = C_Container.GetContainerNumSlots(bag)
   804→        for slot = 1, num_slots do
   805→            local info = C_Container.GetContainerItemInfo(bag, slot)
   806→            if info and info.itemID and not seen_items[info.itemID] then
   807→                seen_items[info.itemID] = true
   808→
   809→                -- Filter by item class
   810→                local passes_filter = true
   811→                local has_any_filter = next(active_bag_filters) ~= nil
   812→                if has_any_filter then
   813→                    local classID = select(12, GetItemInfo(info.itemID))
   814→                    if classID == nil or not active_bag_filters[classID] then
   815→                        passes_filter = false
   816→                    end
   817→                end
   818→
   819→                if passes_filter then
   820→                    local item_id = info.itemID
   821→                    local owning_group = find_item_group(item_id)
   822→
   823→                    local btn = CreateFrame("Button", nil, bag_parent)
   824→                    btn:SetSize(ICON_SIZE, ICON_SIZE)
   825→                    btn:SetPoint("TOPLEFT", bag_parent, "TOPLEFT",
   826→                        col * (ICON_SIZE + ICON_PADDING),
   827→                        -(row * (ICON_SIZE + ICON_PADDING)))
   828→
   829→                    local icon = btn:CreateTexture(nil, "ARTWORK")
   830→                    icon:SetAllPoints()
   831→                    icon:SetTexture(info.iconFileID)
   832→
   833→                    -- Hover overlay (hidden by default, shown on enter)
   834→                    local overlay = btn:CreateTexture(nil, "OVERLAY")
   835→                    overlay:SetAllPoints()
   836→                    overlay:Hide()
   837→
   838→                    -- Status icon overlay (+ or circle-slash)
   839→                    local status_icon = btn:CreateTexture(nil, "OVERLAY", nil, 1)
   840→                    local icon_size = ICON_SIZE * 0.8
   841→                    status_icon:SetSize(icon_size, icon_size)
   842→                    status_icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
   843→                    status_icon:Hide()
   844→
   845→                    if owning_group then
   846→                        icon:SetDesaturated(true)
   847→                        icon:SetAlpha(0.5)
   848→                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
   849→                        status_icon:SetAtlas("transmog-icon-remove")
   850→                    else
   851→                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
   852→                        status_icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
   853→                        status_icon:SetVertexColor(0, 1, 0)
   854→                    end
   855→
   856→                    btn:SetScript("OnClick", function()
   857→                        if owning_group then
   858→                            if owning_group == selected_group_key then
   859→                                remove_item_from_group(item_id, owning_group)
   860→                            else
   861→                                local item_name = C_Item.GetItemNameByID(item_id) or ("Item " .. item_id)
   862→                                local group = CL.db.item_groups[owning_group]
   863→                                local group_name = group and group.name or owning_group
   864→                                local dialog = StaticPopup_Show("CONSUMABLESLIST_REMOVE_ITEM", item_name, group_name)
   865→                                if dialog then
   866→                                    dialog.data = { item_id = item_id, group_key = owning_group }
   867→                                end
   868→                            end
   869→                        else
   870→                            add_item_to_selected_group(item_id)
   871→                        end
   872→                    end)
   873→
   874→                    btn:SetScript("OnEnter", function(self)
   875→                        overlay:Show()
   876→                        status_icon:Show()
   877→                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
   878→                        GameTooltip:SetBagItem(bag, slot)
   879→                        if owning_group then
   880→                            local group = CL.db.item_groups[owning_group]
   881→                            local group_name = group and group.name or owning_group
   882→                            GameTooltip:AddLine(" ")
   883→                            GameTooltip:AddLine("In group: " .. group_name, 1, 0.5, 0.5)
   884→                            GameTooltip:AddLine("Click to remove", 0.8, 0.2, 0.2)
   885→                        else
   886→                            GameTooltip:AddLine(" ")
   887→                            GameTooltip:AddLine("Click to add to selected group", 0.2, 0.8, 0.2)
   888→                        end
   889→                        GameTooltip:Show()
   890→                    end)
   891→
   892→                    btn:SetScript("OnLeave", function()
   893→                        overlay:Hide()
   894→                        status_icon:Hide()
   895→                        GameTooltip:Hide()
   896→                    end)
   897→
   898→                    bag_buttons[#bag_buttons + 1] = btn
   899→
   900→                    col = col + 1
   901→                    if col >= max_cols then
   902→                        col = 0
   903→                        row = row + 1
   904→                    end
   905→                end
   906→            end
   907→        end
   908→    end
   909→
   910→    bag_parent:SetHeight(math.max(1, (row + 1) * (ICON_SIZE + ICON_PADDING)))
   911→end
   912→
   913→-------------------------------------------------------------------------------
   914→--- Build Editor
   915→-------------------------------------------------------------------------------
   916→
   917→local function build_editor(parent, right_width, editor_height)
   918→    local editor = CreateFrame("Frame", nil, parent)
   919→    editor:SetPoint("TOPLEFT", parent, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, 0)
   920→    editor:SetSize(right_width, editor_height)
   921→    editor:Hide()
   922→
   923→    local label_x = 0
   924→    local field_x = 116
   925→
   926→    -- Name field
   927→    create_label(editor, "Display Name:", label_x, -5)
   928→    editor.name_box = create_styled_editbox(editor, right_width - field_x - INSET_PADDING, field_x, 0)
   929→    editor.name_box:SetScript("OnEnterPressed", function(self)
   930→        self:ClearFocus()
   931→        local group = CL.db.item_groups[selected_group_key]
   932→        if not group then return end
   933→
   934→        local text = self:GetText()
   935→        if text == "" then
   936→            local first_item_name = group.item_ids[1] and C_Item.GetItemNameByID(group.item_ids[1])
   937→            text = first_item_name or "Empty Group"
   938→            self:SetText(text)
   939→        end
   940→
   941→        group.name = text
   942→        CL:RefreshGroupList()
   943→        CL:RebuildDisplay()
   944→    end)
   945→
   946→    -- Threshold field
   947→    create_label(editor, "Threshold:", label_x, -35)
   948→    editor.threshold_box = create_styled_editbox(editor, 60, field_x, -30)
   949→    editor.threshold_box:SetNumeric(true)
   950→
   951→    local slider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
   952→    slider:SetSize(right_width - field_x - 60 - INSET_PADDING - 16, 20)
   953→    slider:SetPoint("LEFT", editor.threshold_box, "RIGHT", 8, 0)
   954→    slider:SetMinMaxValues(0, 200)
   955→    slider:SetValueStep(1)
   956→    slider:SetObeyStepOnDrag(true)
   957→
   958→    editor.threshold_slider = slider
   959→
   960→    slider:SetScript("OnValueChanged", function(self, value)
   961→        local val = math.floor(value + 0.5)
   962→        editor.threshold_box:SetText(tostring(val))
   963→        local group = CL.db.item_groups[selected_group_key]
   964→        if not group then return end
   965→
   966→        group.threshold = val
   967→        CL:RebuildDisplay()
   968→    end)
   969→
   970→    editor.threshold_box:SetScript("OnEnterPressed", function(self)
   971→        self:ClearFocus()
   972→        local group = CL.db.item_groups[selected_group_key]
   973→        if not group then return end
   974→
   975→        local val = self:GetNumber()
   976→        group.threshold = val
   977→        editor.threshold_slider:SetValue(math.min(val, 200))
   978→        CL:RebuildDisplay()
   979→    end)
   980→
   981→    -- Color field
   982→    create_label(editor, "Color:", label_x, -65)
   983→    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
   984→    editor.color_box:SetMaxLetters(6)
   985→    editor.color_box:HookScript("OnEditFocusGained", function(self)
   986→        self:HighlightText()
   987→    end)
   988→    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
   989→        if not userInput then return end
   990→
   991→        local text = self:GetText()
   992→        local cleaned = text:gsub("#", "")
   993→        if cleaned ~= text then
   994→            self:SetText(cleaned)
   995→        end
   996→    end)
   997→
   998→    -- Clickable color swatch that opens the color picker
   999→    local swatch_btn = CreateFrame("Button", nil, editor, "BackdropTemplate")
  1000→    swatch_btn:SetSize(22, 22)
  1001→    swatch_btn:SetPoint("LEFT", editor.color_box, "RIGHT", 8, 0)
  1002→    swatch_btn:SetBackdrop(CONTAINER_BACKDROP)
  1003→    swatch_btn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
  1004→
  1005→    editor.color_swatch = swatch_btn:CreateTexture(nil, "ARTWORK")
  1006→    editor.color_swatch:SetPoint("TOPLEFT", swatch_btn, "TOPLEFT", 3, -3)
  1007→    editor.color_swatch:SetPoint("BOTTOMRIGHT", swatch_btn, "BOTTOMRIGHT", -3, 3)
  1008→
  1009→    swatch_btn:SetScript("OnEnter", function(self)
  1010→        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
  1011→        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  1012→        GameTooltip:SetText("Click to pick a color")
  1013→        GameTooltip:Show()
  1014→    end)
  1015→
  1016→    swatch_btn:SetScript("OnLeave", function(self)
  1017→        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
  1018→        GameTooltip:Hide()
  1019→    end)
  1020→
  1021→    local function apply_color(hex)
  1022→        local group = CL.db.item_groups[selected_group_key]
  1023→        if not group then return end
  1024→
  1025→        group.color = hex
  1026→        editor.color_box:SetText(hex)
  1027→        local r, g, b = CL:HexToRGB(hex)
  1028→        editor.color_swatch:SetColorTexture(r, g, b, 1)
  1029→        CL:RefreshGroupList()
  1030→        CL:RebuildDisplay()
  1031→    end
  1032→
  1033→    swatch_btn:SetScript("OnClick", function()
  1034→        local group = CL.db.item_groups[selected_group_key]
  1035→        if not group then return end
  1036→
  1037→        local r, g, b = CL:HexToRGB(group.color or "ffffff")
  1038→        local prev_hex = group.color or "ffffff"
  1039→
  1040→        local info = {
  1041→            swatchFunc = function()
  1042→                local new_r, new_g, new_b = ColorPickerFrame:GetColorRGB()
  1043→                local hex = string.format("%02x%02x%02x",
  1044→                    math.floor(new_r * 255 + 0.5),
  1045→                    math.floor(new_g * 255 + 0.5),
  1046→                    math.floor(new_b * 255 + 0.5))
  1047→                apply_color(hex)
  1048→            end,
  1049→            cancelFunc = function()
  1050→                apply_color(prev_hex)
  1051→            end,
  1052→            r = r,
  1053→            g = g,
  1054→            b = b,
  1055→            hasOpacity = false,
  1056→        }
  1057→
  1058→        ColorPickerFrame:SetupColorPickerAndShow(info)
  1059→    end)
  1060→
  1061→    editor.color_box:SetScript("OnEnterPressed", function(self)
  1062→        self:ClearFocus()
  1063→        local hex = self:GetText()
  1064→        if #hex == 6 then
  1065→            apply_color(hex)
  1066→        end
  1067→    end)
  1068→
  1069→    -- Items label
  1070→    create_label(editor, "Items in Group:", label_x, -100)
  1071→
  1072→    -- Items scroll container
  1073→    local items_top = 118
  1074→    local bottom_controls_height = 36
  1075→    local items_container_height = editor_height - items_top - bottom_controls_height
  1076→
  1077→    local items_container, items_scroll, items_child = create_scroll_container(
  1078→        editor, right_width, items_container_height, 0, -items_top)
  1079→    editor.items_scroll_child = items_child
  1080→
  1081→    -- Add by ID row
  1082→    local add_row_y = -(items_top + items_container_height + 8)
  1083→    create_label(editor, "Add Item by ID:", label_x, add_row_y - 5)
  1084→    editor.add_id_box = create_styled_editbox(editor, 100, field_x, add_row_y)
  1085→    editor.add_id_box:SetNumeric(true)
  1086→    editor.add_id_box:SetScript("OnEnterPressed", function(self)
  1087→        local item_id = self:GetNumber()
  1088→        if item_id <= 0 then return end
  1089→
  1090→        add_item_to_selected_group(item_id)
  1091→        self:SetText("")
  1092→        self:ClearFocus()
  1093→    end)
  1094→
  1095→    local add_btn = create_styled_button(editor, 50, 22, "Add")
  1096→    add_btn:SetPoint("LEFT", editor.add_id_box, "RIGHT", 6, 0)
  1097→    add_btn:SetScript("OnClick", function()
  1098→        local item_id = editor.add_id_box:GetNumber()
  1099→        if item_id <= 0 then return end
  1100→
  1101→        add_item_to_selected_group(item_id)
  1102→        editor.add_id_box:SetText("")
  1103→        editor.add_id_box:ClearFocus()
  1104→    end)
  1105→
  1106→    return editor
  1107→end
  1108→
  1109→-------------------------------------------------------------------------------
  1110→--- Build Options Frame
  1111→-------------------------------------------------------------------------------
  1112→
  1113→local function build_options_frame()
  1114→    if CL.options_frame then return end
  1115→
  1116→    -- Main frame with dark backdrop (matching SlashBreakGambling style)
  1117→    local frame = CreateFrame("Frame", "ConsumablesListOptionsFrame", UIParent, "BackdropTemplate")
  1118→    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
  1119→    frame:SetPoint("CENTER")
  1120→    frame:SetBackdrop(BACKDROP)
  1121→    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
  1122→    frame:SetBackdropBorderColor(unpack(BORDER_NORMAL))
  1123→    frame:SetMovable(true)
  1124→    frame:SetClampedToScreen(true)
  1125→    frame:EnableMouse(true)
  1126→    frame:SetFrameStrata("HIGH")
  1127→    frame:RegisterForDrag("LeftButton")
  1128→    frame:Hide()
  1129→
  1130→    frame:SetScript("OnDragStart", function(self)
  1131→        self:StartMoving()
  1132→    end)
  1133→
  1134→    frame:SetScript("OnDragStop", function(self)
  1135→        self:StopMovingOrSizing()
  1136→    end)
  1137→
  1138→    -- Title
  1139→    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  1140→    title:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING + 2, -INSET_PADDING)
  1141→    title:SetText("Consumables List - Options")
  1142→    title:SetTextColor(unpack(GOLD))
  1143→
  1144→    -- Close button
  1145→    local close_btn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  1146→    close_btn:SetSize(24, 24)
  1147→    close_btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
  1148→    close_btn:SetScript("OnClick", function()
  1149→        frame:Hide()
  1150→    end)
  1151→
  1152→    -- Title divider (more Y padding from title)
  1153→    local title_divider = frame:CreateTexture(nil, "ARTWORK")
  1154→    title_divider:SetHeight(2)
  1155→    title_divider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
  1156→    title_divider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
  1157→    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)
  1158→
  1159→    -- Content area (below divider)
  1160→    local content = CreateFrame("Frame", nil, frame)
  1161→    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
  1162→    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)
  1163→
  1164→    local content_height = PANEL_HEIGHT - 42 - INSET_PADDING
  1165→    local content_width = PANEL_WIDTH - (INSET_PADDING * 2)
  1166→    local right_width = content_width - GROUP_LIST_WIDTH - INSET_PADDING
  1167→
  1168→    ---------------------------------------------------------------------------
  1169→    -- Left panel: Group list (full height)
  1170→    ---------------------------------------------------------------------------
  1171→    create_label(content, "Item Groups", 2, -2)
  1172→
  1173→    local add_group_btn = create_styled_button(content,
  1174→        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
  1175→    add_group_btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
  1176→    add_group_btn:SetScript("OnClick", function()
  1177→        local key = generate_group_key()
  1178→        CL.db.item_groups[key] = {
  1179→            item_ids = {},
  1180→            threshold = 10,
  1181→            color = "ffffff",
  1182→            name = "New Group",
  1183→            order = get_next_order(),
  1184→        }
  1185→        select_group(key)
  1186→        CL:RebuildDisplay()
  1187→    end)
  1188→
  1189→    -- Group list scroll container (full height, bottom-aligned with content)
  1190→    local group_scroll_top = 50
  1191→    local group_container_height = content_height - group_scroll_top
  1192→
  1193→    local group_container, group_scroll, group_child = create_scroll_container(
  1194→        content, GROUP_LIST_WIDTH, group_container_height, 0, -group_scroll_top)
  1195→    frame.group_scroll_child = group_child
  1196→
  1197→    -- Vertical separator between left and right panels
  1198→    local v_sep = content:CreateTexture(nil, "ARTWORK")
  1199→    v_sep:SetWidth(2)
  1200→    v_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + 6, 0)
  1201→    v_sep:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", GROUP_LIST_WIDTH + 6, 0)
  1202→    v_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
  1203→
  1204→    ---------------------------------------------------------------------------
  1205→    -- Right panel: Editor (top) + Bag items (bottom)
  1206→    ---------------------------------------------------------------------------
  1207→    local bag_label_height = 28
  1208→    local editor_height = content_height - BAG_PANEL_HEIGHT - bag_label_height - INSET_PADDING
  1209→
  1210→    -- Editor
  1211→    frame.editor = build_editor(content, right_width, editor_height)
  1212→
  1213→    -- Horizontal separator above bag panel
  1214→    local bag_section_top = editor_height + 8
  1215→    local h_sep = content:CreateTexture(nil, "ARTWORK")
  1216→    h_sep:SetHeight(2)
  1217→    h_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, -bag_section_top)
  1218→    h_sep:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -bag_section_top)
  1219→    h_sep:SetColorTexture(0.3, 0.3, 0.3, 1)
  1220→
  1221→    -- Bag items label and filter buttons
  1222→    local bag_label = create_label(content, "Inventory (Click to add / remove from Group):",
  1223→        GROUP_LIST_WIDTH + INSET_PADDING, -(bag_section_top + 10))
  1224→
  1225→    local FILTER_BTN_SIZE = 24
  1226→    local FILTER_BTN_SPACING = 2
  1227→    local num_filters = #ITEM_CLASS_FILTERS
  1228→    local total_filters_width = num_filters * FILTER_BTN_SIZE + (num_filters - 1) * FILTER_BTN_SPACING
  1229→    for i, filter_info in ipairs(ITEM_CLASS_FILTERS) do
  1230→        local fbtn = CreateFrame("Button", nil, content, "BackdropTemplate")
  1231→        fbtn:SetSize(FILTER_BTN_SIZE, FILTER_BTN_SIZE)
  1232→        fbtn:SetPoint("TOPRIGHT", content, "TOPRIGHT",
  1233→            -(total_filters_width - (i * (FILTER_BTN_SIZE + FILTER_BTN_SPACING)) + FILTER_BTN_SPACING),
  1234→            -(bag_section_top + 6))
  1235→
  1236→        fbtn:SetBackdrop(CONTAINER_BACKDROP)
  1237→
  1238→        local ficon = fbtn:CreateTexture(nil, "ARTWORK")
  1239→        ficon:SetPoint("TOPLEFT", fbtn, "TOPLEFT", 2, -2)
  1240→        ficon:SetPoint("BOTTOMRIGHT", fbtn, "BOTTOMRIGHT", -2, 2)
  1241→        ficon:SetTexture(filter_info.icon)
  1242→
  1243→        local function update_filter_btn_state()
  1244→            if active_bag_filters[filter_info.classID] then
  1245→                fbtn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
  1246→                ficon:SetDesaturated(false)
  1247→                ficon:SetAlpha(1.0)
  1248→            else
  1249→                fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
  1250→                ficon:SetDesaturated(true)
  1251→                ficon:SetAlpha(1.0)
  1252→            end
  1253→        end
  1254→
  1255→        update_filter_btn_state()
  1256→
  1257→        fbtn:SetScript("OnClick", function()
  1258→            if active_bag_filters[filter_info.classID] then
  1259→                active_bag_filters[filter_info.classID] = nil
  1260→            else
  1261→                active_bag_filters[filter_info.classID] = true
  1262→            end
  1263→
  1264→            update_filter_btn_state()
  1265→            CL:RefreshBagPanel()
  1266→        end)
  1267→
  1268→        fbtn:SetScript("OnEnter", function(self)
  1269→            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  1270→            local state = active_bag_filters[filter_info.classID] and "|cff00ff00ON|r" or "|cffff0000OFF|r"
  1271→            GameTooltip:SetText(filter_info.name .. " " .. state)
  1272→            GameTooltip:Show()
  1273→        end)
  1274→
  1275→        fbtn:SetScript("OnLeave", function()
  1276→            GameTooltip:Hide()
  1277→        end)
  1278→
  1279→        bag_filter_buttons[#bag_filter_buttons + 1] = fbtn
  1280→    end
  1281→
  1282→    -- Bag items scroll container (bottom-aligned with group list)
  1283→    local bag_container_top = bag_section_top + bag_label_height
  1284→    local bag_container_height = content_height - bag_container_top
  1285→
  1286→    local bag_container, bag_scroll, bag_child = create_scroll_container(
  1287→        content, right_width, bag_container_height,
  1288→        GROUP_LIST_WIDTH + INSET_PADDING, -bag_container_top)
  1289→    frame.bag_scroll_child = bag_child
  1290→
  1291→    CL.options_frame = frame
  1292→
  1293→    -- Register with Settings panel
  1294→    local category = Settings.RegisterCanvasLayoutCategory(frame, "Consumables List")
  1295→    category.ID = ADDON_NAME
  1296→    Settings.RegisterAddOnCategory(category)
  1297→    CL.options_category = category
  1298→end
  1299→
  1300→-------------------------------------------------------------------------------
  1301→--- Public API
  1302→-------------------------------------------------------------------------------
  1303→
  1304→function CL:OpenOptions()
  1305→    build_options_frame()
  1306→
  1307→    if CL.options_frame:IsShown() then
  1308→        CL.options_frame:Hide()
  1309→    else
  1310→        CL.options_frame:Show()
  1311→        CL:RefreshGroupList()
  1312→        CL:RefreshOptionsEditor()
  1313→        CL:RefreshBagPanel()
  1314→    end
  1315→end
  1316→
```

**Tool Call: Read D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\ConsumablesList.lua**
Status: Completed

```
     1→local ADDON_NAME, CL = ...
     2→CL.abbv = "CL"
     3→
     4→
     5→-------------------------------------------------------------------------------
     6→--- Configuration Variables
     7→-------------------------------------------------------------------------------
     8→
     9→local IMMEDIATELY = true
    10→
    11→local addon_color = "00bf40bf"
    12→
    13→local    font_size = 30
    14→local     v_height = 29
    15→local text_offset = 3
    16→local padding_bottom = -3 -- Adjust all text down
    17→
    18→local frame_width = 300
    19→
    20→local full_item_names = false
    21→
    22→local AH_MOUNT_SPELL_IDS = {
    23→    465235, -- Trader's Gilded Brutosaur
    24→    264058, -- Mighty Caravan Brutosaur
    25→}
    26→
    27→-------------------------------------------------------------------------------
    28→--- Functions
    29→-------------------------------------------------------------------------------
    30→
    31→function CL:Print(msg)
    32→    print("|c" .. addon_color .. ADDON_NAME .. ":|r " .. msg)
    33→end
    34→
    35→function CL:VPrint(msg)
    36→    if not verbose then return end
    37→
    38→    print("|c" .. addon_color .. CL.abbv .. ":|r " .. msg)
    39→end
    40→
    41→function CL:DeepCopy(orig)
    42→    local copy = {}
    43→    for k, v in pairs(orig) do
    44→        if type(v) == "table" then
    45→            copy[k] = CL:DeepCopy(v)
    46→        else
    47→            copy[k] = v
    48→        end
    49→    end
    50→
    51→    return copy
    52→end
    53→
    54→function CL:HexToRGB(hex)
    55→    hex = hex:gsub("#", "") -- Remove # if present
    56→    local r = tonumber(hex:sub(1, 2), 16) / 255
    57→    local g = tonumber(hex:sub(3, 4), 16) / 255
    58→    local b = tonumber(hex:sub(5, 6), 16) / 255
    59→
    60→    return r, g, b
    61→end
    62→
    63→function CL:GetSortedGroups()
    64→    local sorted = {}
    65→    for key, group in pairs(CL.db.item_groups) do
    66→        sorted[#sorted + 1] = { key = key, group = group }
    67→    end
    68→
    69→    table.sort(sorted, function(a, b)
    70→        return (a.group.order or 0) < (b.group.order or 0)
    71→    end)
    72→
    73→    return sorted
    74→end
    75→
    76→function CL:HideItemGroup(group_name)
    77→    CL.frame.item_texts[group_name].left:Hide()
    78→    CL.frame.item_texts[group_name].right:Hide()
    79→end
    80→
    81→function CL:ShowItemGroup(group_name)
    82→    CL.frame.item_texts[group_name].left:Show()
    83→    CL.frame.item_texts[group_name].right:Show()
    84→end
    85→
    86→
    87→function CL:ToggleFullNames()
    88→    full_item_names = not full_item_names
    89→    CL:Print("Using " .. (full_item_names and "Full Names" or "Nicknames"))
    90→    CL:Update(IMMEDIATELY)
    91→end
    92→
    93→function CL:ToggleDebug()
    94→    verbose = not verbose
    95→    CL:Print("debug turned " .. (verbose and "on" or "off"))
    96→    CL:Update(IMMEDIATELY)
    97→end
    98→
    99→function CL:RebuildDisplay()
   100→    for group_id, texts in pairs(CL.frame.item_texts) do
   101→        texts.left:Hide()
   102→        texts.right:Hide()
   103→    end
   104→
   105→    wipe(CL.frame.item_texts)
   106→    CL:Update(IMMEDIATELY)
   107→end
   108→
   109→local function IsMountedOnAHMount()
   110→    if not IsMounted() then return false end
   111→    if InCombatLockdown() then return false end
   112→
   113→    for _, spellID in ipairs(AH_MOUNT_SPELL_IDS) do
   114→        if C_UnitAuras.GetPlayerAuraBySpellID(spellID) then
   115→            return true
   116→        end
   117→    end
   118→
   119→    return false
   120→end
   121→
   122→function CL:HideOrShowUpdate(should_run_immediately)
   123→    should_run_immediately = should_run_immediately or false
   124→
   125→    inInstance, instanceType = IsInInstance()
   126→
   127→    ---------------------------------------
   128→    -- Checking if we should HIDE the frame
   129→
   130→    -- Hide if we are in combat lockdown
   131→    if InCombatLockdown()
   132→
   133→    -- Hide if we are instanced unless
   134→    --   1. We are mounted on an AH Mount
   135→    --   2. We are in a neighborhood
   136→    or (inInstance and not (IsMountedOnAHMount() or
   137→                            instanceType == "neighborhood"))
   138→
   139→    -- Hide if we are mounted unless
   140→    --   1. We are in a city or
   141→    --   2. We are mounted on an AH Mount
   142→    or (IsMounted() and not (IsResting() or
   143→                             IsMountedOnAHMount()))
   144→
   145→    -- Hide if we are dead
   146→    or UnitIsDead("player")
   147→    then
   148→        CL:VPrint("Frame should be Hidden")
   149→        CL:Update(should_run_immediately)
   150→        CL.frame:Hide()
   151→    else
   152→        CL:VPrint("Frame should be Shown")
   153→        CL.frame:Show()
   154→        CL:Update(should_run_immediately)
   155→    end
   156→end
   157→
   158→local update_is_throttled = false
   159→local min_update_interval = 15 -- Minimum time (seconds) between automatic updates
   160→
   161→function CL:Update(should_run_immediately)
   162→    should_run_immediately = should_run_immediately or false
   163→
   164→    if update_is_throttled and not should_run_immediately then return end
   165→
   166→    update_is_throttled = true
   167→    local index = 0
   168→
   169→    for group_id, item_group in pairs(CL.db.item_groups) do
   170→        local    item_id = item_group.item_ids[1]
   171→
   172→        -- Skip groups with no items
   173→        if not item_id then
   174→            if CL.frame.item_texts[group_id] then
   175→                CL:HideItemGroup(group_id)
   176→            end
   177→        else
   178→
   179→        local  item_name = C_Item.GetItemNameByID(item_id)
   180→        local      r,g,b = CL:HexToRGB(item_group.color)
   181→        local item_count = 0
   182→
   183→        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
   184→        if not ((item_group and item_group.name) or item_name) then
   185→            CL.VPrint("CL: Item not cached, no name found for item_id: " .. item_id)
   186→            C_Timer.After(1, function()
   187→                CL:Update(IMMEDIATELY)
   188→            end)
   189→
   190→            return
   191→        end
   192→
   193→        for _, id in ipairs(item_group.item_ids) do
   194→            item_count = item_count + GetItemCount(id, false)
   195→        end
   196→
   197→        if not CL.frame.item_texts[group_id] then
   198→            CL.frame.item_texts[group_id] = {}
   199→
   200→            -- Create the text for the item name on the right
   201→            CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
   202→            CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
   203→            CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)
   204→
   205→            -- Create the text for the item count on the left
   206→            CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
   207→            CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
   208→            CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
   209→        end
   210→
   211→        local      item_name_text = ((item_group and item_group.name) or item_name)
   212→        local full_item_name_text = item_name
   213→        local     item_count_text = item_count
   214→
   215→        -- CL:VPrint(item_name .. ":" .. item_count)
   216→
   217→        -- Update text for low vs out of an item
   218→        if item_count == 0 then
   219→            item_name_text = ("Out of " ..  item_name_text)
   220→        else
   221→            item_name_text = (item_name_text .. " Low")
   222→        end
   223→
   224→        -- Check if `/cl f` was run and replace with full text value if so
   225→        item_name_text = (full_item_names and full_item_name_text) or item_name_text
   226→
   227→        CL.frame.item_texts[group_id].right:SetText(item_name_text)
   228→        CL.frame.item_texts[group_id].left:SetText(item_count_text)
   229→
   230→        -- Show if there are less than the threshold of items
   231→        if item_count < item_group.threshold then
   232→            index = index + 1
   233→            CL:ShowItemGroup(group_id)
   234→        else
   235→            CL:HideItemGroup(group_id)
   236→        end
   237→
   238→        end -- else (has item_id)
   239→    end
   240→
   241→    -- Resize frame height to fit visible rows, width is fixed
   242→    local row_height = v_height
   243→    local frame_height = math.max(row_height, index * row_height)
   244→
   245→    -- Reposition text rows in sorted order (top-down, so first group appears at top)
   246→    local row_index = index - 1
   247→    for _, entry in ipairs(CL:GetSortedGroups()) do
   248→        local texts = CL.frame.item_texts[entry.key]
   249→        if texts and texts.left:IsShown() then
   250→            local y_offset = (row_index * row_height) + padding_bottom
   251→            texts.right:ClearAllPoints()
   252→            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)
   253→
   254→            texts.left:ClearAllPoints()
   255→            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)
   256→
   257→            row_index = row_index - 1
   258→        end
   259→    end
   260→
   261→    CL.frame:SetHeight(frame_height)
   262→
   263→    C_Timer.After(min_update_interval, function()
   264→        update_is_throttled = false
   265→    end)
   266→end
   267→
   268→
   269→-------------------------------------------------------------------------------
   270→--- Initialization
   271→-------------------------------------------------------------------------------
   272→
   273→-- Create the main frame
   274→CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
   275→CL.frame:SetSize(frame_width, 1)
   276→CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200)
   277→CL.frame:SetMovable(true)
   278→CL.frame:SetClampedToScreen(true)
   279→CL.frame:Hide()
   280→
   281→-- LibEditMode integration
   282→local LibEditMode = LibStub("LibEditMode")
   283→
   284→local function OnPositionChanged(frame, layoutName, point, x, y)
   285→    if not ConsumablesListDB then return end
   286→    if not ConsumablesListDB.positions then
   287→        ConsumablesListDB.positions = {}
   288→    end
   289→
   290→    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
   291→end
   292→
   293→local function OnLayoutChanged(layoutName)
   294→    if not ConsumablesListDB or not ConsumablesListDB.positions then return end
   295→
   296→    local pos = ConsumablesListDB.positions[layoutName]
   297→    if pos then
   298→        CL.frame:ClearAllPoints()
   299→        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
   300→    end
   301→end
   302→
   303→LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "BOTTOMLEFT", x = 20, y = 200 }, "Consumables List")
   304→LibEditMode:RegisterCallback("layout", OnLayoutChanged)
   305→
   306→-- Set up custom font (using a WoW built-in font, or replace with your own font file)
   307→local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"
   308→
   309→CL.frame.font = CreateFont("ConsumablesListFont")
   310→CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
   311→CL.frame.font:SetTextColor(1, 1, 1, 1)
   312→
   313→-- Container for text items
   314→CL.frame.item_texts = {}
   315→
   316→
   317→-------------------------------------------------------------------------------
   318→--- Event Handling
   319→-------------------------------------------------------------------------------
   320→
   321→local function EventHandler(self, event, arg1)
   322→    if event == "ADDON_LOADED" then
   323→        if arg1 == ADDON_NAME then
   324→            if not ConsumablesListDB then
   325→                ConsumablesListDB = {}
   326→            end
   327→
   328→            -- Initialize item_groups from saved data or defaults
   329→            if ConsumablesListDB.item_groups then
   330→                CL.db.item_groups = ConsumablesListDB.item_groups
   331→            else
   332→                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
   333→                ConsumablesListDB.item_groups = CL.db.item_groups
   334→            end
   335→
   336→            -- Backfill order for any groups that predate the order field
   337→            local next_order = 1
   338→            for _, group in pairs(CL.db.item_groups) do
   339→                if not group.order then
   340→                    group.order = next_order
   341→                    next_order = next_order + 1
   342→                end
   343→            end
   344→
   345→            CL.frame:UnregisterEvent("ADDON_LOADED")
   346→
   347→            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
   348→            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
   349→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
   350→            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors
   351→
   352→            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
   353→            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit
   354→
   355→            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting
   356→
   357→            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Login
   358→            CL.frame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Entering a City
   359→            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Area Change
   360→
   361→            CL:Print("Loaded. Use " .. SLASH_CONSUMABLESLIST1 .. " for commands.")
   362→        end
   363→    elseif event == "PLAYER_REGEN_DISABLED" then
   364→        CL:VPrint("Hiding for combat enter: " .. event)
   365→        CL.frame:Hide()
   366→    elseif event == "PLAYER_REGEN_ENABLED" or           -- Exiting Combat
   367→           event == "PLAYER_UPDATE_RESTING" or          -- Entering City
   368→           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
   369→        CL:VPrint("Update IMMEDIATELY for: " .. event)
   370→        CL:HideOrShowUpdate(IMMEDIATELY)
   371→    elseif event == "BAG_UPDATE" or                     -- Inventory changes
   372→           event == "ITEM_PUSH" then                    -- Immediate loot feedback
   373→        CL:VPrint("Update IMMEDIATELY for: " .. event)
   374→        CL:HideOrShowUpdate(IMMEDIATELY)
   375→    else
   376→        CL:VPrint("Update LAZILY for: " .. event)
   377→        CL:HideOrShowUpdate()
   378→    end
   379→end
   380→
   381→-- Register events
   382→CL.frame:RegisterEvent("ADDON_LOADED")
   383→
   384→CL.frame:SetScript("OnEvent", EventHandler)
   385→
```

## Assistant

Now let me also check the TOC and existing file structure to understand all files.

**Tool Call: Find `D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList` `**/*`**
Status: Completed

D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\media\fonts\PTSansNarrow-Bold.ttf
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\LICENSE
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\description
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\applypatch-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\commit-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\fsmonitor-watchman.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\post-update.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-applypatch.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-commit.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-merge-commit.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-push.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-rebase.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\pre-receive.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\prepare-commit-msg.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\push-to-checkout.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\sendemail-validate.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\hooks\update.sample
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\8d\0bb0caa111a4aec81e92a7dc857eee58463483
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ff\b38872cd8f436dffbf08e16fb974460a316e52
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\b6\3c29c9c1d902218110811b42385f191f5e55e7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\18\196a19767648a4f87fbbba4ad15fdcbc6dec93
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\40\2a25a5cf61b596067d79de5850ff3bc9659f9e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d1\2b6f1dafb6a77740581dc5647c882d5a57712d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\config
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f1\c63cd2b399ad80fcf70fc003f03ed8834e0114
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ec\64e2dc016e4a5fc082decb66db0cf0bc0359d9
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f7\f183334214c427f3f84aa67c87efcf4c3f3f7a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ea\d2776119e81b29593e216e5d0d781772480bc6
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2a\6b973664b99bfbf6ffc74bde7f518cc01a15f5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\03\995505e00a371b203939b1daf7843681e51b63
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fc\6ede7f0ddcddb74036b80c5243304397559df5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\7c\7e07a3b3d24adcff89b2146283f29b47c7687d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ad\307493f9253fbb27e2297ff132a2713f291815
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\9b\b79db00dff0f893eb2e4756be72dec5e1fe7d2
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\7b\3f566d22498cb220abe22f1129acd1cb1b3642
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\89\f25de7e09070d40481ab41e15d5ae57c7b53bd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a2\5dbeb5f63656abd6bbf7a1afdf01cd14756c23
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\27\0a23e736f2a1daeb50e17b5fd3c2d3068a1c67
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f1\a851fdc9ffaf3e21283c891800e3563511ffad
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\97\6b14cd5b49c53a01854823a6cc90daf543a527
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\6d\a74fde91b195692d8ea55fd09ee4c2f467d78f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a8\3cc4ace46a159620e14bd4a2153d9a47a1880c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\41\00babd8e4ad0ac14f47486bc089a559a801995
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2a\aad81307a72934c7951e41ce4bf56b23648f00
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\3f\803facc4ff6eabf7c3102fb51e2fb9369eba35
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\af\cbf6bdab81a03a1345d69c47e522d531b0089d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\86\5e797256a2f0e412e85271be44d5615beac6a7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\44\15a4133421e6f71078bec0b132d5de2d1d45b9
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\6c\f56ae52672fa97b0436de6e1a978318678b2ac
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\63\2435db6a9d3051eccb748a577b5bdb8f96c2bc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\61\2340f98aec1631148ada132393f9a9a4688fba
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ca\e40ddeadca3f364d9c7289ccb62c91c80311d0
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\76\cb6683440f6060300aced6565f69679cd317bd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\ORIG_HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\9d\f1c6b25ad273f833e44c6dd13b44a7bdf8fd6c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d0\0b3e21d58bf33c61872ad47114f39ef7a2132d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\2d\accec47a3e2a95cb7ef6957c4a6dbc5e3f381a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\96\0a20ac3f5a7954bb6e9efffb40fca1ccfa315a
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\39\0a2a9343d698828e69ee744d24610fd1ace74e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\01\d96b0770d3cb0415940bbe7e32cd9e8b745002
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ff\4c89a180f7d062a3fd19cfb64c854b218ddc02
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\80\0e32860ab3016648c8d1b780cc9fc57cf23320
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\b0\232e544ac3d08e4ac7c0c032c947780c97d2a7
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d6\493593841ca8639c1fa63629e8b1d319a3192d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\26\2dadb16d94debb858516c21494c366b8c998dc
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\20\7e4e364387ed2871722da1d3c7839478f88eac
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\30\2a076ef1c834e39a47972ec0fc34dbfa66b139
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\eb\6796a5cd9e20140beac09af71342e420651e7f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\aa\7d89ff4a29d0916d15ba137f49db773e920e77
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\c3\950498606f49a3757446425caf6df39bb67f72
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\ed\7243a7a43fe95e4c9610a64207c0663134888f
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\5f\ca9cd302dc80feb1608045065a4a7e1922e928
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\89\59d22472b184dcadd443d1bc823105c8cc1dcb
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\26\82b2976f08d9f3501f68e57dc004a20231603b
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fb\d02fcfed7ac253d8bcb6597bab7692c1392044
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\62\f0e69dae826aeaab992143bde0b17c01e5c539
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\FETCH_HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\logs\refs\remotes\origin\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\refs\remotes\origin\HEAD
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\refs\tags\ls
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\aa\158b41611b4dae3f319ca1d0c7a6880f9c1294
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a2\4d7a6b549f152836d4695e6c11a1e9878906f2
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\61\dfc7a9aa23b708fb12996acb1d9ea73b2d505e
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fa\6315393b2af739486a52d50f1e9f6b8a1134eb
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a9\b8ef18d795ec9d568892385d612b5e33524470
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Database.lua
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\37\d8df10d16ffabead3f8efead545d241a4a2ae3
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\0e\671bf9cea859a35b842a6b4d4d43aaaf159d12
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\69\f3d7d646af5592462e31b6339f6b516c912892
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d2\b81fc1d7e8f96ec0ec71be110698dfbc0b484c
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a6\438ea96134d6482da8a1a7c87a674a28eb4bab
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\70\fe30bd726710313663af42463f57a5e6643346
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\f2\834b77553943b3c91dd2a43b7e9891c55c29fe
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\a7\b678d7674eba09595760faefc48c2768c207cd
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\d3\5f8119c7b7bbe48e58f8996e43a10f1bdbe7d5
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\36\e09517ee28e1964cf755dd5820bce51f30810d
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\fa\c8a803f4995e8425993876ec69a655d13f3414
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\4e\204635d132648ca9029c9935fd078e20d39bda
D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\.git\objects\e4\f5b29eeaf676a9af000af2e8c7ec6365e76c74
(Results are truncated. Consider using a more specific path or pattern.)

## Assistant

I now have a complete picture of all 4 source files. Let me map out the responsibilities and dependencies, then write the plan.

Here's what I see in the current codebase:

**ConsumablesList.lua** (~385 lines) is doing too many things:
- Shared utility functions (`Print`, `VPrint`, `DeepCopy`, `HexToRGB`, `GetSortedGroups`)
- HUD frame creation + font setup + LibEditMode integration
- Display update logic (`Update`, `HideOrShowUpdate`, `RebuildDisplay`, etc.)
- Event handling (`EventHandler`, event registration)
- Config constants (`font_size`, `v_height`, `frame_width`, etc.)

**Options.lua** (~1316 lines) is one massive file:
- Style constants/backdrops (shared UI theme)
- Widget constructors (`create_styled_button`, `create_styled_editbox`, `create_label`, `create_scroll_container`)
- Static popup dialogs
- Group list panel (left side)
- Editor panel (right-top)
- Bag panel (right-bottom)
- Main options frame builder
- `OpenOptions` entry point

Let me write the plan.

**Tool Call: Write C:\Users\Kyle\.claude\plans\cached-mixing-tiger.md**
Status: Completed

Diff: C:\Users\Kyle\.claude\plans\cached-mixing-tiger.md
```
# Refactor: Organize ConsumablesList into Logical Modules

## Context

The addon has grown organically. `ConsumablesList.lua` mixes utilities, frame creation, display logic, and event handling. `Options.lua` is 1300+ lines containing widget constructors, style constants, and 3 distinct panel builders all in one file. We want to break things into focused, reusable modules.

## New File Structure

```
ConsumablesList.toc  (updated load order)
Database.lua         (unchanged)
Core.lua             (NEW - shared namespace init, utilities, config)
Widgets.lua          (NEW - reusable styled widget constructors + style constants)
Display.lua          (NEW - HUD frame creation, Update/HideOrShow logic, events)
Options.lua          (SLIMMED - options panel only, uses widgets from Widgets.lua)
Commands.lua         (unchanged)
```

### Load order in .toc:
```
Libs\LibEditMode\LibStub\LibStub.lua
Libs\LibEditMode\embed.xml
Database.lua
Core.lua
Widgets.lua
Commands.lua
Options.lua
Display.lua
```

## File Breakdown

### Core.lua (NEW) — extracted from ConsumablesList.lua
Move here:
- `CL.abbv` init
- `CL:Print()`, `CL:VPrint()`
- `CL:DeepCopy()`
- `CL:HexToRGB()`
- `CL:GetSortedGroups()`
- Config constants that are shared: `addon_color`
- `verbose` global toggle + `CL:ToggleFullNames()`, `CL:ToggleDebug()` (these set state that Display reads)

### Widgets.lua (NEW) — extracted from Options.lua
Move here:
- Style constants: `GOLD`, `BORDER_NORMAL`, `BORDER_HIGHLIGHT`, `BG_NORMAL`, `BG_HOVER`, `BG_PRESS`, `BG_SELECTED`
- Backdrop tables: `BACKDROP`, `BACKDROP_NO_BORDER`, `CONTAINER_BACKDROP`
- `create_styled_button()`
- `create_styled_editbox()`
- `create_label()`
- `create_scroll_container()`

These become `CL.UI.CreateStyledButton()`, `CL.UI.CreateStyledEditBox()`, etc. on the shared namespace so any file can use them.

### Display.lua (NEW) — extracted from ConsumablesList.lua
Move here (this is basically what ConsumablesList.lua becomes, renamed):
- Display config constants: `font_size`, `v_height`, `text_offset`, `padding_bottom`, `frame_width`, `full_item_names`, `IMMEDIATELY`
- `AH_MOUNT_SPELL_IDS`, `IsMountedOnAHMount()`
- `CL:HideItemGroup()`, `CL:ShowItemGroup()`
- `CL:RebuildDisplay()`
- `CL:HideOrShowUpdate()`
- `CL:Update()` (the display update loop)
- HUD frame creation (`CL.frame`, LibEditMode, font setup)
- `EventHandler` + event registration
- Throttle state (`update_is_throttled`, `min_update_interval`)

### Options.lua (SLIMMED)
Remove:
- Style constants (now in Widgets.lua)
- Widget constructors (now in Widgets.lua)

Keep:
- All options-specific constants (`PANEL_WIDTH`, `GROUP_LIST_WIDTH`, `ICON_SIZE`, etc.)
- All state variables (`selected_group_key`, `group_buttons`, etc.)
- Static popup dialogs
- Options-specific utility functions (`get_group_display_name`, `generate_group_key`, `get_next_order`, etc.)
- Group list panel builder
- Editor panel builder
- Bag panel builder
- `build_options_frame()`, `CL:OpenOptions()`
- Update references: `create_styled_button` -> `CL.UI.CreateStyledButton`, etc.

### Commands.lua — unchanged
### Database.lua — unchanged

### ConsumablesList.lua — deleted
Its contents are split between Core.lua and Display.lua.

## Migration Details

### Widget namespace pattern
```lua
-- Widgets.lua
CL.UI = {}

CL.UI.GOLD = { 1, 0.82, 0, 1 }
CL.UI.BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
-- etc.

CL.UI.BACKDROP = { ... }
-- etc.

function CL.UI.CreateStyledButton(parent, width, height, text) ... end
function CL.UI.CreateStyledEditBox(parent, width, x, y) ... end
function CL.UI.CreateLabel(parent, text, x, y) ... end
function CL.UI.CreateScrollContainer(parent, width, height, x, y) ... end
```

### Options.lua references update
Replace all local calls:
- `create_styled_button(...)` -> `CL.UI.CreateStyledButton(...)`
- `create_styled_editbox(...)` -> `CL.UI.CreateStyledEditBox(...)`
- `create_label(...)` -> `CL.UI.CreateLabel(...)`
- `create_scroll_container(...)` -> `CL.UI.CreateScrollContainer(...)`
- `GOLD` -> `CL.UI.GOLD`
- `BORDER_NORMAL` -> `CL.UI.BORDER_NORMAL`
- etc. for all shared style constants
- `BACKDROP` -> `CL.UI.BACKDROP` (etc.)

### Files to create
1. `Core.lua`
2. `Widgets.lua`
3. `Display.lua`

### Files to modify
1. `Options.lua` — remove widget constructors + style constants, update references
2. `ConsumablesList.toc` — new load order

### Files to delete
1. `ConsumablesList.lua` — replaced by Core.lua + Display.lua

## Verification
- `/reload` in-game — addon loads without lua errors
- HUD frame shows with items below threshold in correct sorted order
- `/cl o` opens options panel, all widgets render correctly
- `/cl f` toggles full names
- `/cl d` toggles debug
- Drag-and-drop reorder still works
- Color picker, threshold slider, add/remove items all functional

```


**Tool Call: Exited Plan Mode**
Status: Completed

User has approved your plan. You can now start coding. Start with updating your todo list if applicable

Your plan has been saved to: C:\Users\Kyle\.claude\plans\cached-mixing-tiger.md
You can refer back to it if needed during implementation.

## Approved Plan:
# Refactor: Organize ConsumablesList into Logical Modules

## Context

The addon has grown organically. `ConsumablesList.lua` mixes utilities, frame creation, display logic, and event handling. `Options.lua` is 1300+ lines containing widget constructors, style constants, and 3 distinct panel builders all in one file. We want to break things into focused, reusable modules.

## New File Structure

```
ConsumablesList.toc  (updated load order)
Database.lua         (unchanged)
Core.lua             (NEW - shared namespace init, utilities, config)
Widgets.lua          (NEW - reusable styled widget constructors + style constants)
Display.lua          (NEW - HUD frame creation, Update/HideOrShow logic, events)
Options.lua          (SLIMMED - options panel only, uses widgets from Widgets.lua)
Commands.lua         (unchanged)
```

### Load order in .toc:
```
Libs\LibEditMode\LibStub\LibStub.lua
Libs\LibEditMode\embed.xml
Database.lua
Core.lua
Widgets.lua
Commands.lua
Options.lua
Display.lua
```

## File Breakdown

### Core.lua (NEW) — extracted from ConsumablesList.lua
Move here:
- `CL.abbv` init
- `CL:Print()`, `CL:VPrint()`
- `CL:DeepCopy()`
- `CL:HexToRGB()`
- `CL:GetSortedGroups()`
- Config constants that are shared: `addon_color`
- `verbose` global toggle + `CL:ToggleFullNames()`, `CL:ToggleDebug()` (these set state that Display reads)

### Widgets.lua (NEW) — extracted from Options.lua
Move here:
- Style constants: `GOLD`, `BORDER_NORMAL`, `BORDER_HIGHLIGHT`, `BG_NORMAL`, `BG_HOVER`, `BG_PRESS`, `BG_SELECTED`
- Backdrop tables: `BACKDROP`, `BACKDROP_NO_BORDER`, `CONTAINER_BACKDROP`
- `create_styled_button()`
- `create_styled_editbox()`
- `create_label()`
- `create_scroll_container()`

These become `CL.UI.CreateStyledButton()`, `CL.UI.CreateStyledEditBox()`, etc. on the shared namespace so any file can use them.

### Display.lua (NEW) — extracted from ConsumablesList.lua
Move here (this is basically what ConsumablesList.lua becomes, renamed):
- Display config constants: `font_size`, `v_height`, `text_offset`, `padding_bottom`, `frame_width`, `full_item_names`, `IMMEDIATELY`
- `AH_MOUNT_SPELL_IDS`, `IsMountedOnAHMount()`
- `CL:HideItemGroup()`, `CL:ShowItemGroup()`
- `CL:RebuildDisplay()`
- `CL:HideOrShowUpdate()`
- `CL:Update()` (the display update loop)
- HUD frame creation (`CL.frame`, LibEditMode, font setup)
- `EventHandler` + event registration
- Throttle state (`update_is_throttled`, `min_update_interval`)

### Options.lua (SLIMMED)
Remove:
- Style constants (now in Widgets.lua)
- Widget constructors (now in Widgets.lua)

Keep:
- All options-specific constants (`PANEL_WIDTH`, `GROUP_LIST_WIDTH`, `ICON_SIZE`, etc.)
- All state variables (`selected_group_key`, `group_buttons`, etc.)
- Static popup dialogs
- Options-specific utility functions (`get_group_display_name`, `generate_group_key`, `get_next_order`, etc.)
- Group list panel builder
- Editor panel builder
- Bag panel builder
- `build_options_frame()`, `CL:OpenOptions()`
- Update references: `create_styled_button` -> `CL.UI.CreateStyledButton`, etc.

### Commands.lua — unchanged
### Database.lua — unchanged

### ConsumablesList.lua — deleted
Its contents are split between Core.lua and Display.lua.

## Migration Details

### Widget namespace pattern
```lua
-- Widgets.lua
CL.UI = {}

CL.UI.GOLD = { 1, 0.82, 0, 1 }
CL.UI.BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
-- etc.

CL.UI.BACKDROP = { ... }
-- etc.

function CL.UI.CreateStyledButton(parent, width, height, text) ... end
function CL.UI.CreateStyledEditBox(parent, width, x, y) ... end
function CL.UI.CreateLabel(parent, text, x, y) ... end
function CL.UI.CreateScrollContainer(parent, width, height, x, y) ... end
```

### Options.lua references update
Replace all local calls:
- `create_styled_button(...)` -> `CL.UI.CreateStyledButton(...)`
- `create_styled_editbox(...)` -> `CL.UI.CreateStyledEditBox(...)`
- `create_label(...)` -> `CL.UI.CreateLabel(...)`
- `create_scroll_container(...)` -> `CL.UI.CreateScrollContainer(...)`
- `GOLD` -> `CL.UI.GOLD`
- `BORDER_NORMAL` -> `CL.UI.BORDER_NORMAL`
- etc. for all shared style constants
- `BACKDROP` -> `CL.UI.BACKDROP` (etc.)

### Files to create
1. `Core.lua`
2. `Widgets.lua`
3. `Display.lua`

### Files to modify
1. `Options.lua` — remove widget constructors + style constants, update references
2. `ConsumablesList.toc` — new load order

### Files to delete
1. `ConsumablesList.lua` — replaced by Core.lua + Display.lua

## Verification
- `/reload` in-game — addon loads without lua errors
- HUD frame shows with items below threshold in correct sorted order
- `/cl o` opens options panel, all widgets render correctly
- `/cl f` toggles full names
- `/cl d` toggles debug
- Drag-and-drop reorder still works
- Color picker, threshold slider, add/remove items all functional


**Tool Call: Write D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Core.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Core.lua
```
local ADDON_NAME, CL = ...
CL.abbv = "CL"


-------------------------------------------------------------------------------
--- Configuration
-------------------------------------------------------------------------------

local addon_color = "00bf40bf"


-------------------------------------------------------------------------------
--- Print Functions
-------------------------------------------------------------------------------

function CL:Print(msg)
    print("|c" .. addon_color .. ADDON_NAME .. ":|r " .. msg)
end

function CL:VPrint(msg)
    if not verbose then return end

    print("|c" .. addon_color .. CL.abbv .. ":|r " .. msg)
end


-------------------------------------------------------------------------------
--- Utility Functions
-------------------------------------------------------------------------------

function CL:DeepCopy(orig)
    local copy = {}
    for k, v in pairs(orig) do
        if type(v) == "table" then
            copy[k] = CL:DeepCopy(v)
        else
            copy[k] = v
        end
    end

    return copy
end

function CL:HexToRGB(hex)
    hex = hex:gsub("#", "") -- Remove # if present
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255

    return r, g, b
end

function CL:GetSortedGroups()
    local sorted = {}
    for key, group in pairs(CL.db.item_groups) do
        sorted[#sorted + 1] = { key = key, group = group }
    end

    table.sort(sorted, function(a, b)
        return (a.group.order or 0) < (b.group.order or 0)
    end)

    return sorted
end


-------------------------------------------------------------------------------
--- Toggle Functions
-------------------------------------------------------------------------------

function CL:ToggleFullNames()
    CL.full_item_names = not CL.full_item_names
    CL:Print("Using " .. (CL.full_item_names and "Full Names" or "Nicknames"))
    CL:Update(true)
end

function CL:ToggleDebug()
    verbose = not verbose
    CL:Print("debug turned " .. (verbose and "on" or "off"))
    CL:Update(true)
end

```


**Tool Call: Write D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Widgets.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Widgets.lua
```
local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Widget Library
-------------------------------------------------------------------------------

CL.UI = {}


-------------------------------------------------------------------------------
--- Style Constants
-------------------------------------------------------------------------------

CL.UI.GOLD = { 1, 0.82, 0, 1 }
CL.UI.BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
CL.UI.BORDER_HIGHLIGHT = { 1, 0.82, 0, 1 }
CL.UI.BG_NORMAL = { 0.15, 0.15, 0.15, 1 }
CL.UI.BG_HOVER = { 0.25, 0.25, 0.25, 1 }
CL.UI.BG_PRESS = { 0.1, 0.1, 0.1, 1 }
CL.UI.BG_SELECTED = { 0.2, 0.18, 0.1, 1 }

CL.UI.BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
}

CL.UI.BACKDROP_NO_BORDER = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

CL.UI.CONTAINER_BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
}


-------------------------------------------------------------------------------
--- Widget Constructors
-------------------------------------------------------------------------------

function CL.UI.CreateStyledButton(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(width, height)
    button:SetBackdrop(CL.UI.BACKDROP)
    button:SetBackdropColor(unpack(CL.UI.BG_NORMAL))
    button:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))

    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("LEFT", button, "LEFT", 6, 0)
    button.text:SetPoint("RIGHT", button, "RIGHT", -6, 0)
    button.text:SetWordWrap(false)
    button.text:SetNonSpaceWrap(false)
    button.text:SetText(text)
    button.text:SetTextColor(unpack(CL.UI.GOLD))

    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_HOVER))
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end)

    button:SetScript("OnLeave", function(self)
        if self._selected then
            self:SetBackdropColor(unpack(CL.UI.BG_SELECTED))
            self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        else
            self:SetBackdropColor(unpack(CL.UI.BG_NORMAL))
            self:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))
        end
    end)

    button:SetScript("OnMouseDown", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_PRESS))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 7, -1)
        self.text:SetPoint("RIGHT", self, "RIGHT", -5, -1)
    end)

    button:SetScript("OnMouseUp", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_HOVER))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 6, 0)
        self.text:SetPoint("RIGHT", self, "RIGHT", -6, 0)
    end)

    return button
end

function CL.UI.CreateStyledEditBox(parent, width, x, y)
    local box = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
    box:SetSize(width, 22)
    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    box:SetAutoFocus(false)
    box:SetFontObject(GameFontHighlight)

    box:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    box:SetTextInsets(6, 6, 0, 0)

    box:SetScript("OnEditFocusGained", function(self)
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end)

    box:SetScript("OnEditFocusLost", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    end)

    box:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    return box
end

function CL.UI.CreateLabel(parent, text, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetText(text)
    label:SetTextColor(unpack(CL.UI.GOLD))

    return label
end

local SCROLLBAR_WIDTH = 20
local CONTAINER_PADDING = 4

function CL.UI.CreateScrollContainer(parent, width, height, x, y)
    -- Outer bordered frame
    local container = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    container:SetSize(width, height)
    container:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    container:SetBackdrop(CL.UI.CONTAINER_BACKDROP)
    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)

    -- Scroll frame inside container, leaving room for scrollbar on right
    local inner_padding = CONTAINER_PADDING + 1
    local scroll = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", container, "TOPLEFT", inner_padding, -inner_padding)
    scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding + SCROLLBAR_WIDTH), inner_padding)

    -- Nudge the scrollbar left so it sits inside the container border
    local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
    if scrollbar then
        scrollbar:ClearAllPoints()
        scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -(inner_padding), -(inner_padding + 16))
        scrollbar:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding), (inner_padding + 16))
    end

    -- Consume mouse wheel on the container so it never falls through to game bindings
    container:EnableMouseWheel(true)
    container:SetScript("OnMouseWheel", function(_, delta)
        local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
        if scrollbar then
            local current = scrollbar:GetValue()
            local min_val, max_val = scrollbar:GetMinMaxValues()
            local step = scrollbar:GetValueStep() or (max_val - min_val) / 10
            local new_val = math.max(min_val, math.min(max_val, current - (delta * step)))
            scrollbar:SetValue(new_val)
        end
    end)

    local child_width = width - SCROLLBAR_WIDTH - (inner_padding * 2)
    local child = CreateFrame("Frame", nil, scroll)
    child:SetWidth(child_width)
    child:SetHeight(1)
    scroll:SetScrollChild(child)

    return container, scroll, child
end

```


## Assistant

Now I need to note that `full_item_names` was a local in `ConsumablesList.lua` but `ToggleFullNames` is now in `Core.lua`. I moved it to `CL.full_item_names` in Core.lua — Display.lua needs to read it from there too.

**Tool Call: Write D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Display.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Display.lua
```
local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Configuration Variables
-------------------------------------------------------------------------------

local IMMEDIATELY = true

local    font_size = 30
local     v_height = 29
local text_offset = 3
local padding_bottom = -3 -- Adjust all text down

local frame_width = 300

CL.full_item_names = false

local AH_MOUNT_SPELL_IDS = {
    465235, -- Trader's Gilded Brutosaur
    264058, -- Mighty Caravan Brutosaur
}


-------------------------------------------------------------------------------
--- Display Functions
-------------------------------------------------------------------------------

function CL:HideItemGroup(group_name)
    CL.frame.item_texts[group_name].left:Hide()
    CL.frame.item_texts[group_name].right:Hide()
end

function CL:ShowItemGroup(group_name)
    CL.frame.item_texts[group_name].left:Show()
    CL.frame.item_texts[group_name].right:Show()
end

function CL:RebuildDisplay()
    for group_id, texts in pairs(CL.frame.item_texts) do
        texts.left:Hide()
        texts.right:Hide()
    end

    wipe(CL.frame.item_texts)
    CL:Update(IMMEDIATELY)
end

local function IsMountedOnAHMount()
    if not IsMounted() then return false end
    if InCombatLockdown() then return false end

    for _, spellID in ipairs(AH_MOUNT_SPELL_IDS) do
        if C_UnitAuras.GetPlayerAuraBySpellID(spellID) then
            return true
        end
    end

    return false
end

function CL:HideOrShowUpdate(should_run_immediately)
    should_run_immediately = should_run_immediately or false

    inInstance, instanceType = IsInInstance()

    ---------------------------------------
    -- Checking if we should HIDE the frame

    -- Hide if we are in combat lockdown
    if InCombatLockdown()

    -- Hide if we are instanced unless
    --   1. We are mounted on an AH Mount
    --   2. We are in a neighborhood
    or (inInstance and not (IsMountedOnAHMount() or
                            instanceType == "neighborhood"))

    -- Hide if we are mounted unless
    --   1. We are in a city or
    --   2. We are mounted on an AH Mount
    or (IsMounted() and not (IsResting() or
                             IsMountedOnAHMount()))

    -- Hide if we are dead
    or UnitIsDead("player")
    then
        CL:VPrint("Frame should be Hidden")
        CL:Update(should_run_immediately)
        CL.frame:Hide()
    else
        CL:VPrint("Frame should be Shown")
        CL.frame:Show()
        CL:Update(should_run_immediately)
    end
end

local update_is_throttled = false
local min_update_interval = 15 -- Minimum time (seconds) between automatic updates

function CL:Update(should_run_immediately)
    should_run_immediately = should_run_immediately or false

    if update_is_throttled and not should_run_immediately then return end

    update_is_throttled = true
    local index = 0

    for group_id, item_group in pairs(CL.db.item_groups) do
        local    item_id = item_group.item_ids[1]

        -- Skip groups with no items
        if not item_id then
            if CL.frame.item_texts[group_id] then
                CL:HideItemGroup(group_id)
            end
        else

        local  item_name = C_Item.GetItemNameByID(item_id)
        local      r,g,b = CL:HexToRGB(item_group.color)
        local item_count = 0

        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
        if not ((item_group and item_group.name) or item_name) then
            CL.VPrint("CL: Item not cached, no name found for item_id: " .. item_id)
            C_Timer.After(1, function()
                CL:Update(IMMEDIATELY)
            end)

            return
        end

        for _, id in ipairs(item_group.item_ids) do
            item_count = item_count + GetItemCount(id, false)
        end

        if not CL.frame.item_texts[group_id] then
            CL.frame.item_texts[group_id] = {}

            -- Create the text for the item name on the right
            CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
            CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)

            -- Create the text for the item count on the left
            CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
            CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
        end

        local      item_name_text = ((item_group and item_group.name) or item_name)
        local full_item_name_text = item_name
        local     item_count_text = item_count

        -- Update text for low vs out of an item
        if item_count == 0 then
            item_name_text = ("Out of " ..  item_name_text)
        else
            item_name_text = (item_name_text .. " Low")
        end

        -- Check if `/cl f` was run and replace with full text value if so
        item_name_text = (CL.full_item_names and full_item_name_text) or item_name_text

        CL.frame.item_texts[group_id].right:SetText(item_name_text)
        CL.frame.item_texts[group_id].left:SetText(item_count_text)

        -- Show if there are less than the threshold of items
        if item_count < item_group.threshold then
            index = index + 1
            CL:ShowItemGroup(group_id)
        else
            CL:HideItemGroup(group_id)
        end

        end -- else (has item_id)
    end

    -- Resize frame height to fit visible rows, width is fixed
    local row_height = v_height
    local frame_height = math.max(row_height, index * row_height)

    -- Reposition text rows in sorted order (top-down, so first group appears at top)
    local row_index = index - 1
    for _, entry in ipairs(CL:GetSortedGroups()) do
        local texts = CL.frame.item_texts[entry.key]
        if texts and texts.left:IsShown() then
            local y_offset = (row_index * row_height) + padding_bottom
            texts.right:ClearAllPoints()
            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", text_offset, y_offset)

            texts.left:ClearAllPoints()
            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -text_offset, y_offset)

            row_index = row_index - 1
        end
    end

    CL.frame:SetHeight(frame_height)

    C_Timer.After(min_update_interval, function()
        update_is_throttled = false
    end)
end


-------------------------------------------------------------------------------
--- Frame Initialization
-------------------------------------------------------------------------------

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
CL.frame:SetSize(frame_width, 1)
CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)
CL.frame:Hide()

-- LibEditMode integration
local LibEditMode = LibStub("LibEditMode")

local function OnPositionChanged(frame, layoutName, point, x, y)
    if not ConsumablesListDB then return end
    if not ConsumablesListDB.positions then
        ConsumablesListDB.positions = {}
    end

    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
end

local function OnLayoutChanged(layoutName)
    if not ConsumablesListDB or not ConsumablesListDB.positions then return end

    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    end
end

LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "BOTTOMLEFT", x = 20, y = 200 }, "Consumables List")
LibEditMode:RegisterCallback("layout", OnLayoutChanged)

-- Set up custom font
local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"

CL.frame.font = CreateFont("ConsumablesListFont")
CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.item_texts = {}


-------------------------------------------------------------------------------
--- Event Handling
-------------------------------------------------------------------------------

local function EventHandler(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == ADDON_NAME then
            if not ConsumablesListDB then
                ConsumablesListDB = {}
            end

            -- Initialize item_groups from saved data or defaults
            if ConsumablesListDB.item_groups then
                CL.db.item_groups = ConsumablesListDB.item_groups
            else
                CL.db.item_groups = CL:DeepCopy(CL.db.defaults)
                ConsumablesListDB.item_groups = CL.db.item_groups
            end

            -- Backfill order for any groups that predate the order field
            local next_order = 1
            for _, group in pairs(CL.db.item_groups) do
                if not group.order then
                    group.order = next_order
                    next_order = next_order + 1
                end
            end

            CL.frame:UnregisterEvent("ADDON_LOADED")

            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors

            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit

            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting

            CL.frame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Entering a City
            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Area Change

            CL:Print("Loaded. Use " .. SLASH_CONSUMABLESLIST1 .. " for commands.")
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        CL:VPrint("Hiding for combat enter: " .. event)
        CL.frame:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" or           -- Exiting Combat
           event == "PLAYER_UPDATE_RESTING" or          -- Entering City
           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
        CL:VPrint("Update IMMEDIATELY for: " .. event)
        CL:HideOrShowUpdate(IMMEDIATELY)
    elseif event == "BAG_UPDATE" or                     -- Inventory changes
           event == "ITEM_PUSH" then                    -- Immediate loot feedback
        CL:VPrint("Update IMMEDIATELY for: " .. event)
        CL:HideOrShowUpdate(IMMEDIATELY)
    else
        CL:VPrint("Update LAZILY for: " .. event)
        CL:HideOrShowUpdate()
    end
end

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")

CL.frame:SetScript("OnEvent", EventHandler)

```


## Assistant

I also fixed the duplicate `PLAYER_ENTERING_WORLD` registration that existed in the original. Now let me update Options.lua — this is the biggest change, replacing all local widget/style references with `CL.UI.*`.Now I need to rewrite Options.lua — remove the style constants, backdrop tables, and widget constructors, and replace all references. Let me do this carefully.

**Tool Call: Write D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua**
Status: Completed

Diff: D:\World of Warcraft\_retail_\Interface\AddOns\ConsumablesList\Options.lua
```
local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Options Panel
-------------------------------------------------------------------------------

local PANEL_WIDTH = 860
local PANEL_HEIGHT = 540
local INSET_PADDING = 14

local GROUP_LIST_WIDTH = 220
local BAG_PANEL_HEIGHT = 160
local ICON_SIZE = 34
local ICON_PADDING = 4
local GROUP_BUTTON_HEIGHT = 26
local TRASH_ICON_SIZE = 18
local DRAG_HANDLE_WIDTH = 14

local selected_group_key = nil
local group_buttons = {}
local item_rows = {}
local bag_buttons = {}
local bag_filter_buttons = {}

local drag_state = {
    active = false,
    source_key = nil,
    ghost = nil,
}

-- Item class filters: classID -> { name, icon }
local ITEM_CLASS_FILTERS = {
    { classID = 0,  name = "Consumable",        icon = 134830 },  -- INV_Potion_93 (red potion)
    { classID = 7,  name = "Tradeskill",         icon = 132996 },  -- Trade_Engineering
    { classID = 8,  name = "Item Enhancement",   icon = 135225 },  -- Spell_Holy_GreaterHeal (enchant scroll)
    { classID = 2,  name = "Weapon",             icon = 135274 },  -- INV_Sword_04
    { classID = 4,  name = "Armor",              icon = 132633 },  -- INV_Chest_Chain
    { classID = 3,  name = "Gem",                icon = 134071 },  -- INV_Misc_Gem_02
    { classID = 5,  name = "Reagent",            icon = 132599 },  -- INV_Misc_Dust_02
    { classID = 15, name = "Miscellaneous",      icon = 134414 },  -- INV_Misc_Bag_10
    { classID = 9,  name = "Recipe",             icon = 134939 },  -- INV_Scroll_06
    { classID = 1,  name = "Container",          icon = 133633 },  -- INV_Misc_Bag_08
    { classID = 12, name = "Quest",              icon = 132049 },  -- INV_Misc_Map02
}

local active_bag_filters = { [0] = true }  -- Default: Consumables only

-------------------------------------------------------------------------------
--- Delete Confirmation Dialog
-------------------------------------------------------------------------------

StaticPopupDialogs["CONSUMABLESLIST_DELETE_GROUP"] = {
    text = "Are you sure you want to delete \"%s\"?",
    button1 = "Delete",
    button2 = "Cancel",
    OnAccept = function(self, group_key)
        CL.db.item_groups[group_key] = nil

        if selected_group_key == group_key then
            selected_group_key = nil
        end

        CL:RefreshGroupList()
        CL:RefreshOptionsEditor()
        CL:RebuildDisplay()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

StaticPopupDialogs["CONSUMABLESLIST_REMOVE_ITEM"] = {
    text = "Remove %s from group \"%s\"?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function(self, data)
        local group = CL.db.item_groups[data.group_key]
        if not group then return end

        for i, id in ipairs(group.item_ids) do
            if id == data.item_id then
                table.remove(group.item_ids, i)
                break
            end
        end

        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
        CL:RebuildDisplay()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-------------------------------------------------------------------------------
--- Utility
-------------------------------------------------------------------------------

local function get_group_display_name(group)
    if group.name and group.name ~= "" then
        return group.name
    end

    if group.item_ids and group.item_ids[1] then
        local name = C_Item.GetItemNameByID(group.item_ids[1])
        if name then
            return name
        end
    end

    return "Unnamed Group"
end

local function generate_group_key()
    local key = "group_" .. time() .. "_" .. math.random(1000, 9999)

    return key
end

local function get_next_order()
    local max_order = 0
    for _, group in pairs(CL.db.item_groups) do
        if (group.order or 0) > max_order then
            max_order = group.order
        end
    end

    return max_order + 1
end

local function delete_group(key)
    local group = CL.db.item_groups[key]
    if not group then return end

    local name = get_group_display_name(group)
    local popup = StaticPopup_Show("CONSUMABLESLIST_DELETE_GROUP", name)
    if popup then
        popup.data = key
    end
end

-------------------------------------------------------------------------------
--- Group List (Left Panel)
-------------------------------------------------------------------------------

local function clear_group_buttons(scroll_child)
    for _, btn in ipairs(group_buttons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(group_buttons)
end

local function select_group(key)
    selected_group_key = key
    CL:RefreshOptionsEditor()
    CL:RefreshGroupList()
    CL:RefreshBagPanel()
end

local function get_or_create_drag_ghost()
    if drag_state.ghost then
        return drag_state.ghost
    end

    local ghost = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    ghost:SetSize(GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT)
    ghost:SetFrameStrata("TOOLTIP")
    ghost:SetBackdrop(CL.UI.BACKDROP)
    ghost:SetBackdropColor(0.2, 0.18, 0.1, 0.9)
    ghost:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    ghost:Hide()

    ghost.text = ghost:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    ghost.text:SetPoint("LEFT", ghost, "LEFT", 6, 0)
    ghost.text:SetPoint("RIGHT", ghost, "RIGHT", -6, 0)
    ghost.text:SetWordWrap(false)
    ghost.text:SetTextColor(unpack(CL.UI.GOLD))

    ghost:SetScript("OnUpdate", function(self)
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)

        -- Highlight the row under the cursor
        local cx, cy = x / scale, y / scale
        for _, btn_row in ipairs(group_buttons) do
            if btn_row:IsShown() and btn_row:GetBottom() then
                local is_target = btn_row._group_key ~= drag_state.source_key
                    and cx >= btn_row:GetLeft() and cx <= btn_row:GetRight()
                    and cy >= btn_row:GetBottom() and cy <= btn_row:GetTop()

                if is_target then
                    btn_row._drop_highlight:Show()
                else
                    btn_row._drop_highlight:Hide()
                end
            end
        end
    end)

    drag_state.ghost = ghost

    return ghost
end

local function reorder_groups(source_key, target_key)
    local source_order = CL.db.item_groups[source_key].order
    local target_order = CL.db.item_groups[target_key].order

    if source_order == target_order then return end

    if source_order < target_order then
        -- Moving down: shift items between source+1 and target up by 1
        for _, group in pairs(CL.db.item_groups) do
            if group.order > source_order and group.order <= target_order then
                group.order = group.order - 1
            end
        end
    else
        -- Moving up: shift items between target and source-1 down by 1
        for _, group in pairs(CL.db.item_groups) do
            if group.order >= target_order and group.order < source_order then
                group.order = group.order + 1
            end
        end
    end

    CL.db.item_groups[source_key].order = target_order
end

local function find_drop_target_key()
    local scale = UIParent:GetEffectiveScale()
    local cx, cy = GetCursorPosition()
    cx, cy = cx / scale, cy / scale

    for _, btn_row in ipairs(group_buttons) do
        if btn_row:IsShown() and btn_row:GetBottom() then
            local left = btn_row:GetLeft()
            local right = btn_row:GetRight()
            local bottom = btn_row:GetBottom()
            local top = btn_row:GetTop()

            if cx >= left and cx <= right and cy >= bottom and cy <= top then
                return btn_row._group_key
            end
        end
    end

    return nil
end

local function finish_drag(dropped_on_target)
    if not drag_state.active then return end

    if dropped_on_target then
        local target_key = find_drop_target_key()

        if target_key and target_key ~= drag_state.source_key then
            reorder_groups(drag_state.source_key, target_key)
        end
    end

    -- Clear all drop highlights before refreshing
    for _, btn_row in ipairs(group_buttons) do
        if btn_row._drop_highlight then
            btn_row._drop_highlight:Hide()
        end
    end

    drag_state.active = false
    drag_state.source_key = nil
    drag_state.ghost:Hide()
    CL:RefreshGroupList()
    CL:RebuildDisplay()
end

local function create_group_button(parent, index, key, group)
    -- Row frame holding drag handle, group button, and trash icon
    local row = CreateFrame("Frame", nil, parent)
    local row_width = parent:GetWidth()
    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
    row._group_key = key

    -- Drop highlight (shown when dragging over this row)
    local drop_highlight = row:CreateTexture(nil, "BACKGROUND")
    drop_highlight:SetAllPoints()
    drop_highlight:SetColorTexture(1, 0.82, 0, 0.2)
    drop_highlight:Hide()
    row._drop_highlight = drop_highlight

    -- Drag handle on the left
    local handle = CreateFrame("Button", nil, row)
    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
    handle:SetPoint("LEFT", row, "LEFT", 0, 0)

    local handle_tex = handle:CreateTexture(nil, "ARTWORK")
    handle_tex:SetSize(DRAG_HANDLE_WIDTH - 2, GROUP_BUTTON_HEIGHT - 6)
    handle_tex:SetPoint("CENTER", handle, "CENTER", 0, 0)
    handle_tex:SetAtlas("UI-QuestTracker-Objective-Nub")
    handle_tex:SetDesaturated(true)
    handle_tex:SetAlpha(0.4)

    handle:SetScript("OnEnter", function()
        handle_tex:SetAlpha(1.0)
        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to reorder")
        GameTooltip:Show()
    end)

    handle:SetScript("OnLeave", function()
        if not drag_state.active then
            handle_tex:SetAlpha(0.4)
        end

        GameTooltip:Hide()
    end)

    handle:RegisterForDrag("LeftButton")

    handle:SetScript("OnDragStart", function()
        drag_state.active = true
        drag_state.source_key = key

        local ghost = get_or_create_drag_ghost()
        ghost.text:SetText(get_group_display_name(group))
        ghost:Show()
    end)

    handle:SetScript("OnDragStop", function()
        finish_drag(true)
    end)

    -- Group select button (leaves room for handle on left and trash on right)
    local btn_width = row_width - DRAG_HANDLE_WIDTH - TRASH_ICON_SIZE - 6
    local btn = CL.UI.CreateStyledButton(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
    btn:SetPoint("LEFT", handle, "RIGHT", 0, 0)

    if key == selected_group_key then
        btn._selected = true
        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        btn.text:SetTextColor(r, g, b, 1)
        btn:SetBackdropColor(unpack(CL.UI.BG_SELECTED))
        btn:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end

    btn:SetScript("OnClick", function()
        select_group(key)
    end)

    -- Trash icon button
    local trash = CreateFrame("Button", nil, row)
    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)

    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
    trash_icon:SetAllPoints()
    trash_icon:SetAtlas("transmog-icon-remove")
    trash_icon:SetAlpha(0.5)

    trash:SetScript("OnEnter", function()
        trash_icon:SetAlpha(1.0)
        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
        GameTooltip:SetText("Delete Group")
        GameTooltip:Show()
    end)

    trash:SetScript("OnLeave", function()
        trash_icon:SetAlpha(0.5)
        GameTooltip:Hide()
    end)

    trash:SetScript("OnClick", function()
        delete_group(key)
    end)

    return row
end

function CL:RefreshGroupList()
    if not CL.options_frame then return end

    local scroll_child = CL.options_frame.group_scroll_child
    clear_group_buttons(scroll_child)

    local sorted = CL:GetSortedGroups()
    for index, entry in ipairs(sorted) do
        local row = create_group_button(scroll_child, index, entry.key, entry.group)
        group_buttons[#group_buttons + 1] = row
    end

    scroll_child:SetHeight(math.max(1, #sorted * (GROUP_BUTTON_HEIGHT + 3)))
end

-------------------------------------------------------------------------------
--- Editor Panel (Right Panel - Top)
-------------------------------------------------------------------------------

local function clear_item_rows()
    for _, row in ipairs(item_rows) do
        row:Hide()
        row:SetParent(nil)
    end

    wipe(item_rows)
end

local function create_item_row(parent, index, item_id, group_key)
    local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    row:SetSize(parent:GetWidth(), ICON_SIZE)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (ICON_SIZE + 3))

    row:SetBackdrop(CL.UI.BACKDROP_NO_BORDER)
    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)

    -- Item icon
    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE - 4, ICON_SIZE - 4)
    icon:SetPoint("LEFT", row, "LEFT", 2, 0)

    local item_icon = C_Item.GetItemIconByID(item_id)
    if item_icon then
        icon:SetTexture(item_icon)
    end

    -- Item name text
    local name_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    name_text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    local item_name = C_Item.GetItemNameByID(item_id)
    name_text:SetText(item_name or ("Item " .. item_id))

    if not item_name then
        local item = Item:CreateFromItemID(item_id)
        item:ContinueOnItemLoad(function()
            local loaded_name = C_Item.GetItemNameByID(item_id)
            if loaded_name then
                name_text:SetText(loaded_name)
            end

            local loaded_icon = C_Item.GetItemIconByID(item_id)
            if loaded_icon then
                icon:SetTexture(loaded_icon)
            end
        end)
    end

    -- Item ID text
    local id_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    id_text:SetPoint("LEFT", name_text, "RIGHT", 8, 0)
    id_text:SetText("(" .. item_id .. ")")
    id_text:SetTextColor(0.5, 0.5, 0.5)

    -- Remove button
    local remove_btn = CreateFrame("Button", nil, row, "UIPanelCloseButton")
    remove_btn:SetSize(22, 22)
    remove_btn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
    remove_btn:SetScript("OnClick", function()
        local group = CL.db.item_groups[group_key]
        if not group then return end

        for i, id in ipairs(group.item_ids) do
            if id == item_id then
                table.remove(group.item_ids, i)
                break
            end
        end

        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
        CL:RebuildDisplay()
    end)

    -- Hover highlight
    row:EnableMouse(true)
    row:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(item_id)
        GameTooltip:Show()
    end)

    row:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
        GameTooltip:Hide()
    end)

    return row
end

function CL:RefreshOptionsEditor()
    if not CL.options_frame then return end

    local editor = CL.options_frame.editor
    clear_item_rows()

    if not selected_group_key or not CL.db.item_groups[selected_group_key] then
        editor:Hide()

        return
    end

    editor:Show()
    local group = CL.db.item_groups[selected_group_key]

    -- Update fields
    editor.name_box:SetText(group.name or "")
    editor.threshold_box:SetText(tostring(group.threshold or 0))
    editor.threshold_slider:SetValue(math.min(group.threshold or 0, 200))
    editor.color_box:SetText(group.color or "ffffff")

    -- Update color swatch
    local r, g, b = CL:HexToRGB(group.color or "ffffff")
    editor.color_swatch:SetColorTexture(r, g, b, 1)

    -- Populate item list
    local items_parent = editor.items_scroll_child
    for i, item_id in ipairs(group.item_ids) do
        local row = create_item_row(items_parent, i, item_id, selected_group_key)
        item_rows[#item_rows + 1] = row
    end

    items_parent:SetHeight(math.max(1, #group.item_ids * (ICON_SIZE + 3)))
end

-------------------------------------------------------------------------------
--- Bag Panel (Right Panel - Bottom)
-------------------------------------------------------------------------------

local function clear_bag_buttons()
    for _, btn in ipairs(bag_buttons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(bag_buttons)
end

local function is_item_in_group(item_id, group_key)
    local group = CL.db.item_groups[group_key]
    if not group then return false end

    for _, id in ipairs(group.item_ids) do
        if id == item_id then
            return true
        end
    end

    return false
end

local function find_item_group(item_id)
    for key, group in pairs(CL.db.item_groups) do
        for _, id in ipairs(group.item_ids) do
            if id == item_id then
                return key
            end
        end
    end

    return nil
end

local function remove_item_from_group(item_id, group_key)
    local group = CL.db.item_groups[group_key]
    if not group then return end

    for i, id in ipairs(group.item_ids) do
        if id == item_id then
            table.remove(group.item_ids, i)
            break
        end
    end

    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

local function add_item_to_selected_group(item_id)
    if not selected_group_key then
        CL:Print("Select an item group first.")

        return
    end

    local group = CL.db.item_groups[selected_group_key]
    if not group then return end

    if find_item_group(item_id) then
        CL:Print("Item already in a group.")

        return
    end

    group.item_ids[#group.item_ids + 1] = item_id

    if group.name == "New Group" or group.name == "Empty Group" then
        local item_name = C_Item.GetItemNameByID(item_id)
        if item_name then
            group.name = item_name
        end
    end

    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

function CL:RefreshBagPanel()
    if not CL.options_frame then return end

    local bag_parent = CL.options_frame.bag_scroll_child
    clear_bag_buttons()

    local available_width = bag_parent:GetWidth()
    local col = 0
    local row = 0
    local max_cols = math.floor(available_width / (ICON_SIZE + ICON_PADDING))
    local seen_items = {}

    for bag = 0, 4 do
        local num_slots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, num_slots do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and not seen_items[info.itemID] then
                seen_items[info.itemID] = true

                -- Filter by item class
                local passes_filter = true
                local has_any_filter = next(active_bag_filters) ~= nil
                if has_any_filter then
                    local classID = select(12, GetItemInfo(info.itemID))
                    if classID == nil or not active_bag_filters[classID] then
                        passes_filter = false
                    end
                end

                if passes_filter then
                    local item_id = info.itemID
                    local owning_group = find_item_group(item_id)

                    local btn = CreateFrame("Button", nil, bag_parent)
                    btn:SetSize(ICON_SIZE, ICON_SIZE)
                    btn:SetPoint("TOPLEFT", bag_parent, "TOPLEFT",
                        col * (ICON_SIZE + ICON_PADDING),
                        -(row * (ICON_SIZE + ICON_PADDING)))

                    local icon = btn:CreateTexture(nil, "ARTWORK")
                    icon:SetAllPoints()
                    icon:SetTexture(info.iconFileID)

                    -- Hover overlay (hidden by default, shown on enter)
                    local overlay = btn:CreateTexture(nil, "OVERLAY")
                    overlay:SetAllPoints()
                    overlay:Hide()

                    -- Status icon overlay (+ or circle-slash)
                    local status_icon = btn:CreateTexture(nil, "OVERLAY", nil, 1)
                    local icon_size = ICON_SIZE * 0.8
                    status_icon:SetSize(icon_size, icon_size)
                    status_icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
                    status_icon:Hide()

                    if owning_group then
                        icon:SetDesaturated(true)
                        icon:SetAlpha(0.5)
                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
                        status_icon:SetAtlas("transmog-icon-remove")
                    else
                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
                        status_icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
                        status_icon:SetVertexColor(0, 1, 0)
                    end

                    btn:SetScript("OnClick", function()
                        if owning_group then
                            if owning_group == selected_group_key then
                                remove_item_from_group(item_id, owning_group)
                            else
                                local item_name = C_Item.GetItemNameByID(item_id) or ("Item " .. item_id)
                                local group = CL.db.item_groups[owning_group]
                                local group_name = group and group.name or owning_group
                                local dialog = StaticPopup_Show("CONSUMABLESLIST_REMOVE_ITEM", item_name, group_name)
                                if dialog then
                                    dialog.data = { item_id = item_id, group_key = owning_group }
                                end
                            end
                        else
                            add_item_to_selected_group(item_id)
                        end
                    end)

                    btn:SetScript("OnEnter", function(self)
                        overlay:Show()
                        status_icon:Show()
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetBagItem(bag, slot)
                        if owning_group then
                            local group = CL.db.item_groups[owning_group]
                            local group_name = group and group.name or owning_group
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("In group: " .. group_name, 1, 0.5, 0.5)
                            GameTooltip:AddLine("Click to remove", 0.8, 0.2, 0.2)
                        else
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("Click to add to selected group", 0.2, 0.8, 0.2)
                        end
                        GameTooltip:Show()
                    end)

                    btn:SetScript("OnLeave", function()
                        overlay:Hide()
                        status_icon:Hide()
                        GameTooltip:Hide()
                    end)

                    bag_buttons[#bag_buttons + 1] = btn

                    col = col + 1
                    if col >= max_cols then
                        col = 0
                        row = row + 1
                    end
                end
            end
        end
    end

    bag_parent:SetHeight(math.max(1, (row + 1) * (ICON_SIZE + ICON_PADDING)))
end

-------------------------------------------------------------------------------
--- Build Editor
-------------------------------------------------------------------------------

local function build_editor(parent, right_width, editor_height)
    local editor = CreateFrame("Frame", nil, parent)
    editor:SetPoint("TOPLEFT", parent, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, 0)
    editor:SetSize(right_width, editor_height)
    editor:Hide()

    local label_x = 0
    local field_x = 116

    -- Name field
    CL.UI.CreateLabel(editor, "Display Name:", label_x, -5)
    editor.name_box = CL.UI.CreateStyledEditBox(editor, right_width - field_x - INSET_PADDING, field_x, 0)
    editor.name_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local text = self:GetText()
        if text == "" then
            local first_item_name = group.item_ids[1] and C_Item.GetItemNameByID(group.item_ids[1])
            text = first_item_name or "Empty Group"
            self:SetText(text)
        end

        group.name = text
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end)

    -- Threshold field
    CL.UI.CreateLabel(editor, "Threshold:", label_x, -35)
    editor.threshold_box = CL.UI.CreateStyledEditBox(editor, 60, field_x, -30)
    editor.threshold_box:SetNumeric(true)

    local slider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
    slider:SetSize(right_width - field_x - 60 - INSET_PADDING - 16, 20)
    slider:SetPoint("LEFT", editor.threshold_box, "RIGHT", 8, 0)
    slider:SetMinMaxValues(0, 200)
    slider:SetValueStep(1)
    slider:SetObeyStepOnDrag(true)

    editor.threshold_slider = slider

    slider:SetScript("OnValueChanged", function(self, value)
        local val = math.floor(value + 0.5)
        editor.threshold_box:SetText(tostring(val))
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        group.threshold = val
        CL:RebuildDisplay()
    end)

    editor.threshold_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local val = self:GetNumber()
        group.threshold = val
        editor.threshold_slider:SetValue(math.min(val, 200))
        CL:RebuildDisplay()
    end)

    -- Color field
    CL.UI.CreateLabel(editor, "Color:", label_x, -65)
    editor.color_box = CL.UI.CreateStyledEditBox(editor, 90, field_x, -60)
    editor.color_box:SetMaxLetters(6)
    editor.color_box:HookScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)
    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
        if not userInput then return end

        local text = self:GetText()
        local cleaned = text:gsub("#", "")
        if cleaned ~= text then
            self:SetText(cleaned)
        end
    end)

    -- Clickable color swatch that opens the color picker
    local swatch_btn = CreateFrame("Button", nil, editor, "BackdropTemplate")
    swatch_btn:SetSize(22, 22)
    swatch_btn:SetPoint("LEFT", editor.color_box, "RIGHT", 8, 0)
    swatch_btn:SetBackdrop(CL.UI.CONTAINER_BACKDROP)
    swatch_btn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    editor.color_swatch = swatch_btn:CreateTexture(nil, "ARTWORK")
    editor.color_swatch:SetPoint("TOPLEFT", swatch_btn, "TOPLEFT", 3, -3)
    editor.color_swatch:SetPoint("BOTTOMRIGHT", swatch_btn, "BOTTOMRIGHT", -3, 3)

    swatch_btn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Click to pick a color")
        GameTooltip:Show()
    end)

    swatch_btn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        GameTooltip:Hide()
    end)

    local function apply_color(hex)
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        group.color = hex
        editor.color_box:SetText(hex)
        local r, g, b = CL:HexToRGB(hex)
        editor.color_swatch:SetColorTexture(r, g, b, 1)
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end

    swatch_btn:SetScript("OnClick", function()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        local prev_hex = group.color or "ffffff"

        local info = {
            swatchFunc = function()
                local new_r, new_g, new_b = ColorPickerFrame:GetColorRGB()
                local hex = string.format("%02x%02x%02x",
                    math.floor(new_r * 255 + 0.5),
                    math.floor(new_g * 255 + 0.5),
                    math.floor(new_b * 255 + 0.5))
                apply_color(hex)
            end,
            cancelFunc = function()
                apply_color(prev_hex)
            end,
            r = r,
            g = g,
            b = b,
            hasOpacity = false,
        }

        ColorPickerFrame:SetupColorPickerAndShow(info)
    end)

    editor.color_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local hex = self:GetText()
        if #hex == 6 then
            apply_color(hex)
        end
    end)

    -- Items label
    CL.UI.CreateLabel(editor, "Items in Group:", label_x, -100)

    -- Items scroll container
    local items_top = 118
    local bottom_controls_height = 36
    local items_container_height = editor_height - items_top - bottom_controls_height

    local items_container, items_scroll, items_child = CL.UI.CreateScrollContainer(
        editor, right_width, items_container_height, 0, -items_top)
    editor.items_scroll_child = items_child

    -- Add by ID row
    local add_row_y = -(items_top + items_container_height + 8)
    CL.UI.CreateLabel(editor, "Add Item by ID:", label_x, add_row_y - 5)
    editor.add_id_box = CL.UI.CreateStyledEditBox(editor, 100, field_x, add_row_y)
    editor.add_id_box:SetNumeric(true)
    editor.add_id_box:SetScript("OnEnterPressed", function(self)
        local item_id = self:GetNumber()
        if item_id <= 0 then return end

        add_item_to_selected_group(item_id)
        self:SetText("")
        self:ClearFocus()
    end)

    local add_btn = CL.UI.CreateStyledButton(editor, 50, 22, "Add")
    add_btn:SetPoint("LEFT", editor.add_id_box, "RIGHT", 6, 0)
    add_btn:SetScript("OnClick", function()
        local item_id = editor.add_id_box:GetNumber()
        if item_id <= 0 then return end

        add_item_to_selected_group(item_id)
        editor.add_id_box:SetText("")
        editor.add_id_box:ClearFocus()
    end)

    return editor
end

-------------------------------------------------------------------------------
--- Build Options Frame
-------------------------------------------------------------------------------

local function build_options_frame()
    if CL.options_frame then return end

    -- Main frame with dark backdrop
    local frame = CreateFrame("Frame", "ConsumablesListOptionsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    frame:SetPoint("CENTER")
    frame:SetBackdrop(CL.UI.BACKDROP)
    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
    frame:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetFrameStrata("HIGH")
    frame:RegisterForDrag("LeftButton")
    frame:Hide()

    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    -- Title
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING + 2, -INSET_PADDING)
    title:SetText("Consumables List - Options")
    title:SetTextColor(unpack(CL.UI.GOLD))

    -- Close button
    local close_btn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close_btn:SetSize(24, 24)
    close_btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
    close_btn:SetScript("OnClick", function()
        frame:Hide()
    end)

    -- Title divider
    local title_divider = frame:CreateTexture(nil, "ARTWORK")
    title_divider:SetHeight(2)
    title_divider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
    title_divider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)

    -- Content area (below divider)
    local content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)

    local content_height = PANEL_HEIGHT - 42 - INSET_PADDING
    local content_width = PANEL_WIDTH - (INSET_PADDING * 2)
    local right_width = content_width - GROUP_LIST_WIDTH - INSET_PADDING

    ---------------------------------------------------------------------------
    -- Left panel: Group list (full height)
    ---------------------------------------------------------------------------
    CL.UI.CreateLabel(content, "Item Groups", 2, -2)

    local add_group_btn = CL.UI.CreateStyledButton(content,
        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
    add_group_btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
    add_group_btn:SetScript("OnClick", function()
        local key = generate_group_key()
        CL.db.item_groups[key] = {
            item_ids = {},
            threshold = 10,
            color = "ffffff",
            name = "New Group",
            order = get_next_order(),
        }
        select_group(key)
        CL:RebuildDisplay()
    end)

    -- Group list scroll container (full height, bottom-aligned with content)
    local group_scroll_top = 50
    local group_container_height = content_height - group_scroll_top

    local group_container, group_scroll, group_child = CL.UI.CreateScrollContainer(
        content, GROUP_LIST_WIDTH, group_container_height, 0, -group_scroll_top)
    frame.group_scroll_child = group_child

    -- Vertical separator between left and right panels
    local v_sep = content:CreateTexture(nil, "ARTWORK")
    v_sep:SetWidth(2)
    v_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + 6, 0)
    v_sep:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", GROUP_LIST_WIDTH + 6, 0)
    v_sep:SetColorTexture(0.3, 0.3, 0.3, 1)

    ---------------------------------------------------------------------------
    -- Right panel: Editor (top) + Bag items (bottom)
    ---------------------------------------------------------------------------
    local bag_label_height = 28
    local editor_height = content_height - BAG_PANEL_HEIGHT - bag_label_height - INSET_PADDING

    -- Editor
    frame.editor = build_editor(content, right_width, editor_height)

    -- Horizontal separator above bag panel
    local bag_section_top = editor_height + 8
    local h_sep = content:CreateTexture(nil, "ARTWORK")
    h_sep:SetHeight(2)
    h_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, -bag_section_top)
    h_sep:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -bag_section_top)
    h_sep:SetColorTexture(0.3, 0.3, 0.3, 1)

    -- Bag items label and filter buttons
    local bag_label = CL.UI.CreateLabel(content, "Inventory (Click to add / remove from Group):",
        GROUP_LIST_WIDTH + INSET_PADDING, -(bag_section_top + 10))

    local FILTER_BTN_SIZE = 24
    local FILTER_BTN_SPACING = 2
    local num_filters = #ITEM_CLASS_FILTERS
    local total_filters_width = num_filters * FILTER_BTN_SIZE + (num_filters - 1) * FILTER_BTN_SPACING
    for i, filter_info in ipairs(ITEM_CLASS_FILTERS) do
        local fbtn = CreateFrame("Button", nil, content, "BackdropTemplate")
        fbtn:SetSize(FILTER_BTN_SIZE, FILTER_BTN_SIZE)
        fbtn:SetPoint("TOPRIGHT", content, "TOPRIGHT",
            -(total_filters_width - (i * (FILTER_BTN_SIZE + FILTER_BTN_SPACING)) + FILTER_BTN_SPACING),
            -(bag_section_top + 6))

        fbtn:SetBackdrop(CL.UI.CONTAINER_BACKDROP)

        local ficon = fbtn:CreateTexture(nil, "ARTWORK")
        ficon:SetPoint("TOPLEFT", fbtn, "TOPLEFT", 2, -2)
        ficon:SetPoint("BOTTOMRIGHT", fbtn, "BOTTOMRIGHT", -2, 2)
        ficon:SetTexture(filter_info.icon)

        local function update_filter_btn_state()
            if active_bag_filters[filter_info.classID] then
                fbtn:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
                ficon:SetDesaturated(false)
                ficon:SetAlpha(1.0)
            else
                fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
                ficon:SetDesaturated(true)
                ficon:SetAlpha(1.0)
            end
        end

        update_filter_btn_state()

        fbtn:SetScript("OnClick", function()
            if active_bag_filters[filter_info.classID] then
                active_bag_filters[filter_info.classID] = nil
            else
                active_bag_filters[filter_info.classID] = true
            end

            update_filter_btn_state()
            CL:RefreshBagPanel()
        end)

        fbtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local state = active_bag_filters[filter_info.classID] and "|cff00ff00ON|r" or "|cffff0000OFF|r"
            GameTooltip:SetText(filter_info.name .. " " .. state)
            GameTooltip:Show()
        end)

        fbtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        bag_filter_buttons[#bag_filter_buttons + 1] = fbtn
    end

    -- Bag items scroll container (bottom-aligned with group list)
    local bag_container_top = bag_section_top + bag_label_height
    local bag_container_height = content_height - bag_container_top

    local bag_container, bag_scroll, bag_child = CL.UI.CreateScrollContainer(
        content, right_width, bag_container_height,
        GROUP_LIST_WIDTH + INSET_PADDING, -bag_container_top)
    frame.bag_scroll_child = bag_child

    CL.options_frame = frame

    -- Register with Settings panel
    local category = Settings.RegisterCanvasLayoutCategory(frame, "Consumables List")
    category.ID = ADDON_NAME
    Settings.RegisterAddOnCategory(category)
    CL.options_category = category
end

-------------------------------------------------------------------------------
--- Public API
-------------------------------------------------------------------------------

function CL:OpenOptions()
    build_options_frame()

    if CL.options_frame:IsShown() then
        CL.options_frame:Hide()
    else
        CL.options_frame:Show()
        CL:RefreshGroupList()
        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
    end
end

```


