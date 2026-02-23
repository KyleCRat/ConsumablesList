# TODO

## Updates
- Update each group to have enable / disable conditions 
  - Class / Spec
  - Grey out and move to bottom of list if disabled due to conditions
- Update defualts to be reasonble midnight
- Add addon options panel
  - with button to open the cl options
  - Enable / disable whole addon button. Early return basically turns off the entire addon
  - Add sharedMedia Font select, Font size, lineHeight customization
  - Add toggle to use full names instead of group names permanantly
  - Add configuration for the hide / show logic somehow? maybe just simple on top of our defaults rather than?
    - show in neighborhood
    - show when on ah mount

## Refactor
We need to refactor and seperate concerns from the CL.lua file.

## Ideas
- Add secure button frame to the left to show the icon and act like a action bar as well as a list of low items? (probably not as we only show low items)
- Add an action bar frame taht is moveable and sizeable pixel perfect that updates and shows items from the list in a top down fashion so it will always show buttons for the most powerful verison first
