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

logging = true -- you can set this off if you wouldn't like to log traveling information

require 'travelmodule'

function onPathAction()
if getUsablePokemonCount() >= 1 then
    if getMapName() != "Cinnabar mansion 3" then
        moveTo("Cinnabar mansion 3")
    elseif getMapName() == "Cinnabar mansion 3" then
        moveToGrass()
    end
else
    if getMapName() != "Pokecenter Cinnabar" then
        moveTo("Pokecenter Cinnabar")
    elseif getMapName() == "Pokecenter Cinnabar" then
        usePokecenter()
    end
end
```

(*) Compatibility variable settings are individual variables unrelated to the Traveling Support UDF.


### To-Do List
- Implement an Anti-Mod feature by recording cell changes
- Create algorithm for routes with multiple destination points
- Add support for path exceptions
