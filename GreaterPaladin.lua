function GreaterPaladin()
  local PlayerClass = UnitClass("player");
  local CurrentSpec = GetSpecialization();
  local CurrentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None";
  
  if(PlayerClass == "Paladin" and CurrentSpecName == "Retribution") then
	print("Greetings fellow arbiter of justice!");
	local SpecFlag = 1;
  elseif(PlayerClass ~= "Paladin")
	print("You are not a Paladin!");
	return
  else
	print("You are not currently retribution!");
	return
   end
  
  if(SpecFlag == 1) then
  local partysize = GetNumGroupMembers();
  if(partysize = 0) then print("Bless You!")
  else print("Bless the Group!")
  end
  
end