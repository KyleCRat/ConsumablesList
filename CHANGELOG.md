# Changelog

## [12.0.5-3] - 2026-05-01
- Add Auctionator shopping list integration

## [12.0.5-2] - 2026-04-10

### Fixes
- Fix `shouldRunImmediately` not being passed through `ShowFrame`/`HideFrame`, so throttle bypass now works correctly
- Replace hand-rolled `DeepCopy` with Blizzard's built-in `CopyTable()`
- Add value labels to Settings panel sliders (Font Size, Line Height)
