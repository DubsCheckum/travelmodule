xname = "Traveling Module (UDF)"
xauthor = "SCode"
xdescription = "This is a traveling module to make scripting easier."

locindex = 0
endlocindex = 0
z = 0
doonce = true
loadcredits = true
if logging == nil then
	logging = true
end

function moveTo(endlocation)
	if z==0 or z != endlocation then
		doonce = true
	end
	if loadcredits == true then
		log("   > Using '" .. xname .. "' by " .. xauthor)
		log("   > " .. xdescription)
		loadcredits = false
	end
	playalocation = getMapName()
	for i=1,#t,1 do
		if t[i] == playalocation and t[i] == endlocation then
			log("Arrived at destioantion!")
			return 0
		elseif t[i] == playalocation then
			locindex = i
		elseif t[i] == endlocation then
			endlocindex = i			
		end
	end
	if locindex == 0 then
		fatal("   > (!) Teleported by mod or path incorrectly configured!")
	else
	z = endlocation
	if logging == true and doonce == true then
	log ("-------------------------------------------------")
	log ("Map ID: " .. locindex .. ") " .. playalocation)
	log ("                     ↓")
	log ("Map ID: " .. endlocindex .. ") " .. endlocation)
	log ("-------------------------------------------------")
	doonce = false
	end
	log("Maps left until destination: " .. math.abs(endlocindex - locindex))
	
	if (endlocindex - 1 == locindex) or (endlocindex + 1 == locindex) then
		moveToMap(endlocation)
	elseif endlocindex == locindex then
		return 1
	elseif endlocindex > locindex then
		moveToMap(t[locindex+1])
	elseif endlocindex < locindex then
		moveToMap(t[locindex-1])
	end
	end
end