# PROShine Traveling Support UDF

The script is intended to help you code easier, by removing the necessity of thousands of ifs and elseifs by replacing it with an algorithm that does the work for you. Basically, using a user-defined table with the path your script needs to take, my Map Traveling Support is intended to move the player to any map inside your path table.

## Example
For an example, I'll show you what I currently use to make my script and Redshkie's All-Catcher compatible:
```lua
t = {
    "Pokecenter Cinnabar",
    "Cinnabar Island",
    "Cinnabar mansion 1",
    "Cinnabar mansion 2",
    "Cinnabar mansion 3",
}

pokecenter = "Pokecenter Cinnabar" -- (*) Compatibility variable settings
catchmap = "Cinnabar mansion 3" -- (*) Compatibility variable settings

logging = true

require 'travelmodule'

function onPathAction()
if getUsablePokemonCount() >= 1 then
    if getMapName() != catchmap then
        moveTo(catchmap)
    elseif getMapName() == catchmap then
        moveToRectangle(minX, minY, maxX, maxY)
    end
else
    if getMapName() != pokecenter then
        moveTo(pokecenter)
    elseif getMapName() == pokecenter then
        usePokecenter()
    end
end
```

(*) Compatibility variable settings are individual variables unrelated to the Traveling Support UDF.


### To-Do List
- Implement an Anti-Mod feature by recording cell changes
- Create algorithm for routes with multiple destination points
- Add support for path exceptions
