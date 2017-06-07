GreaterPaladinHeader = _G["GreaterPaladinFrame"]
GreaterPaladinAuto = CreateFrame("Button", "GreaterPaladinAutoBtn", GreaterPaladinHeader, "SecureActionButtonTemplate, GreaterPaladinButtonTemplate")
GreaterPaladinAuto:RegisterForClicks("LeftButtonDown", "RightButtonDown")
local x = -100
local y = -100
local point = "TOPLEFT"
local pointOpposite = "BOTTOMLEFT"
GreaterPaladinHeader2 = _G["GreaterPaladinFrame"]
GreaterPaladinAuto2 = CreateFrame("Button", "GreaterPaladinAutoBtn2", GreaterPaladinHeader2, "SecureActionButtonTemplate, GreaterPaladinButtonTemplate")
local x2 = -100
local y2 = -130
GreaterPaladinHeader3 = _G["GreaterPaladinFrame"]
GreaterPaladinAuto3 = CreateFrame("Button", "GreaterPaladinAutoBtn3", GreaterPaladinHeader3, "SecureActionButtonTemplate, GreaterPaladinButtonTemplate")
local x3 = -100
local y3 = -160

local total = 0
local function onUpdate(self,elapsed)
	total = total + 1
	if(total > GetFramerate()) then
		GreaterPaladin()
		total = 0
	end
end

ColMissingBuff     = {r = 1.0, g = 0.0, b = 0.0, t = 0.5}
ColPlayerDead      = {r = 1.5, g = 1.5, b = 1.5, t = 0.5}
ColRunningOut      = {r = 1.0, g = 1.0, b = 0.5, t = 0.5}
ColHasBuff         = {r = 0.0, g = 0.7, b = 0.0, t = 0.5}
 

function CreateFrames()
	GreaterPaladinAuto:ClearAllPoints()
	GreaterPaladinAuto:SetPoint(point, GreaterPaladinHeader, "CENTER", x, y)
	GreaterPaladinAuto:SetAttribute("type", "spell")
	GreaterPaladinAuto:SetAttribute("unit1", "player")
	GreaterPaladinAuto:SetScript("OnUpdate", onUpdate)
	
	GreaterPaladinAuto2:ClearAllPoints()
	GreaterPaladinAuto2:SetPoint(point, GreaterPaladinHeader2, "CENTER", x2, y2)
	GreaterPaladinAuto2:SetAttribute("type", "spell")
	GreaterPaladinAuto2:SetAttribute("unit1", "player")
	
	GreaterPaladinAuto3:ClearAllPoints()
	GreaterPaladinAuto3:SetPoint(point, GreaterPaladinHeader3, "CENTER", x3, y3)
	GreaterPaladinAuto3:SetAttribute("type", "spell")
	GreaterPaladinAuto3:SetAttribute("unit1", "player")	
	local PlayerClass = UnitClass("player");
	local CurrentSpec = GetSpecialization();
	if(PlayerClass == "Paladin" and CurrentSpec ~= 3) then
		GreaterPaladinAuto:Hide()
		GreaterPaladinAuto2:Hide()
		GreaterPaladinAuto3:Hide()
	end
end

function UpdateFrame(unit,buff,timeleft)

	if(unit[1])	then
		
		local spellName, _, spellIcon = GetSpellInfo(buff[1])	
		local bufficon = _G["GreaterPaladinAutoBtnBuffIcon"]
		local bufftime= _G["GreaterPaladinAutoBtnTime"]
		local playername = _G["GreaterPaladinAutoBtnText"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText(date("%M:%S", (timeleft[1] - GetTime())))
		playername:SetText(GetUnitName(unit[1]))		
		if(UnitIsDeadOrGhost(GetUnitName(unit[1]))) then
			GreaterPaladinAuto:SetBackdropColor(ColPlayerDead["r"], ColPlayerDead["g"], ColPlayerDead["b"], ColPlayerDead["t"])
			playername:SetText("DEAD")
		else if(timeleft[1] - GetTime() < 900) then
			GreaterPaladinAuto:SetBackdropColor(ColRunningOut["r"], ColRunningOut["g"], ColRunningOut["b"], ColRunningOut["t"])
							
		else
			GreaterPaladinAuto:SetBackdropColor(ColHasBuff["r"], ColHasBuff["g"], ColHasBuff["b"], ColHasBuff["t"])
			end
		end	
	else 
		spellName, _, spellIcon = GetSpellInfo(74009)	
		local bufficon = _G["GreaterPaladinAutoBtnBuffIcon"]
		local bufftime= _G["GreaterPaladinAutoBtnTime"]
		local playername = _G["GreaterPaladinAutoBtnText"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText("00:00")
		playername:SetText("NEED TO BUFF")
		GreaterPaladinAuto:SetBackdropColor(ColMissingBuff["r"], ColMissingBuff["g"], ColMissingBuff["b"], ColMissingBuff["t"])
	end
	
	
	if(unit[2]) then
	
		spellName, _, spellIcon = GetSpellInfo(buff[2])	
		bufficon = _G["GreaterPaladinAutoBtn2BuffIcon"]
		bufftime = _G["GreaterPaladinAutoBtn2Time"]
		playername = _G["GreaterPaladinAutoBtn2Text"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText(date("%M:%S", (timeleft[2] - GetTime())))
		playername:SetText(GetUnitName(unit[2]))		
		if(UnitIsDeadOrGhost(GetUnitName(unit[2]))) then
			GreaterPaladinAuto2:SetBackdropColor(ColPlayerDead["r"], ColPlayerDead["g"], ColPlayerDead["b"], ColPlayerDead["t"])
			playername:SetText("DEAD")
		else if(timeleft[2] - GetTime() < 900) then
			GreaterPaladinAuto2:SetBackdropColor(ColRunningOut["r"], ColRunningOut["g"], ColRunningOut["b"], ColRunningOut["t"])
							
		else
			GreaterPaladinAuto2:SetBackdropColor(ColHasBuff["r"], ColHasBuff["g"], ColHasBuff["b"], ColHasBuff["t"])
			end
		end	
	else 
		spellName, _, spellIcon = GetSpellInfo(74009)	
		local bufficon = _G["GreaterPaladinAutoBtn2BuffIcon"]
		local bufftime = _G["GreaterPaladinAutoBtn2Time"]
		local playername = _G["GreaterPaladinAutoBtn2Text"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText("00:00")
		playername:SetText("NEED TO BUFF")
		GreaterPaladinAuto2:SetBackdropColor(ColMissingBuff["r"], ColMissingBuff["g"], ColMissingBuff["b"], ColMissingBuff["t"])
	end
	if(unit[3]) then
	
		spellName, _, spellIcon = GetSpellInfo(buff[3])	
		bufficon = _G["GreaterPaladinAutoBtn3BuffIcon"]
		bufftime= _G["GreaterPaladinAutoBtn3Time"]
		playername = _G["GreaterPaladinAutoBtn3Text"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText(date("%M:%S", (timeleft[3] - GetTime())))
		playername:SetText(GetUnitName(unit[3]))		
		if(UnitIsDeadOrGhost(GetUnitName(unit[3]))) then
			GreaterPaladinAuto3:SetBackdropColor(ColPlayerDead["r"], ColPlayerDead["g"], ColPlayerDead["b"], ColPlayerDead["t"])
			playername:SetText("DEAD")
		else if(timeleft[3] - GetTime() < 900) then
			GreaterPaladinAuto3:SetBackdropColor(ColRunningOut["r"], ColRunningOut["g"], ColRunningOut["b"], ColRunningOut["t"])
							
		else
			GreaterPaladinAuto3:SetBackdropColor(ColHasBuff["r"], ColHasBuff["g"], ColHasBuff["b"], ColHasBuff["t"])
			end
		end	
	else 
		spellName, _, spellIcon = GetSpellInfo(74009)	
		local bufficon = _G["GreaterPaladinAutoBtn3BuffIcon"]
		local bufftime= _G["GreaterPaladinAutoBtn3Time"]
		local playername = _G["GreaterPaladinAutoBtn3Text"]
		bufficon:SetTexture(spellIcon)
		bufftime:SetText("00:00")
		playername:SetText("NEED TO BUFF")
		GreaterPaladinAuto3:SetBackdropColor(ColMissingBuff["r"], ColMissingBuff["g"], ColMissingBuff["b"], ColMissingBuff["t"])
	end
end

--Performs actual check on players.
--Returns number of blessings, name of player and arrays containing list of buffs and time remaining
function BlessingsOnPlayer(unit)
	local BCount = 0
	local UnitList = {}
	local BuffList = {}
	local TimeRem  = {}
	local name, _, _, _, _, duration, expires, caster, _, _, spellID = UnitBuff(unit,"Greater Blessing of Might")
	if caster == "player" then  
		BCount = BCount + 1
		table.insert(UnitList, unit)
		table.insert(BuffList, name)
		table.insert(TimeRem, expires)
	end
	name, _, _, _, _, duration, expires, caster, _, _, spellID = UnitBuff(unit,"Greater Blessing of Wisdom")
    if caster == "player" then  
		BCount = BCount + 1
		table.insert(UnitList, unit)
		table.insert(BuffList, name)
		table.insert(TimeRem, expires)
	end
	name, _, _, _, _, duration, expires, caster, _, _, spellID = UnitBuff(unit,"Greater Blessing of Kings")
    if caster == "player" then  
		BCount = BCount + 1
		table.insert(UnitList, unit)
		table.insert(BuffList, name)
		table.insert(TimeRem, expires)
	end		
	return BCount, UnitList, BuffList, TimeRem
end

--Runs through group members to check if they have blessings
function CheckGroup(GrpType)
	local unitarr, buffarr, timearr = {}
	local unitarr1, buffarr1, timearr1 = {}
	local BCount, BCount1 = 0
	for i = 1, GetNumGroupMembers()+1, 1 
	do 
		if(BCount > 0) then BCount1, unitarr1, buffarr1, timearr1 = BlessingsOnPlayer(GrpType .. i) 
		else BCount, unitarr, buffarr, timearr = BlessingsOnPlayer(GrpType .. i) 
		end
		if(BCount1 and BCount1 > 0) then
			BCount = BCount + BCount1
			for j = 1, BCount1+1, 1
			do
				table.insert(unitarr, unitarr1[j])
				table.insert(buffarr, buffarr1[j])
				table.insert(timearr, timearr1[j])		
			end
			BCount1 = 0;
		end		
	end
	if(BCount ~=3 and GrpType == "party") then
		BCount1, unitarr1, buffarr1, timearr1 = BlessingsOnPlayer("player")
		if(BCount1 and BCount1 > 0) then
			BCount = BCount + BCount1
			for j = 1, BCount1+1, 1
			do
				table.insert(unitarr, unitarr1[j])
				table.insert(buffarr, buffarr1[j])
				table.insert(timearr, timearr1[j])		
			end
			BCount1 = 0;
		end		
	end
	return BCount, unitarr, buffarr, timearr
end


--Main Function
--Checks player class/spec, then parses group for buff list

function GreaterPaladin()
	local PlayerClass = UnitClass("player");
	local CurrentSpec = GetSpecialization();
	local blessingcount, unitarr, buffarr, timearr
	if(PlayerClass == "Paladin" and CurrentSpec == 3) then
		SpecFlag = 1;
	elseif(PlayerClass ~= "Paladin") then
		SpecFlag = 0;
		return;
	else
		SpecFlag = 0;
		return;
	end  
	if(SpecFlag == 1) then
		partysize = GetNumGroupMembers();
		if(partysize == 0) then
			blessingcount, unitarr, buffarr, timearr = BlessingsOnPlayer("player")  
		else if(UnitInParty("player") and not UnitInRaid("player")) then
			blessingcount, unitarr, buffarr, timearr = CheckGroup("party")
		else
			blessingcount, unitarr, buffarr, timearr = CheckGroup("raid")
			end  
		end 
	end
	UpdateFrame(unitarr, buffarr, timearr) 
end
   
SLASH_GREATERPALADIN1, SLASH_GREATERPALADIN2 = '/gp', '/GreaterPaladin';
function SlashCmdList.GREATERPALADIN(msg, editBox)
	if GreaterPaladinAuto:IsShown() then
		GreaterPaladinAuto:Hide()
		GreaterPaladinAuto2:Hide()
		GreaterPaladinAuto3:Hide()
	else
		GreaterPaladinAuto:Show()
		GreaterPaladinAuto2:Show()
		GreaterPaladinAuto3:Show()
	end
end
  
local spec  = CreateFrame("FRAME", "FooAddonFrame")
spec:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
local function SpecChange(self, event, ...)
	local PlayerClass = UnitClass("player");
	local CurrentSpec = GetSpecialization();
	if(PlayerClass == "Paladin" and CurrentSpec == 3) then
		GreaterPaladinAuto:Show()
		GreaterPaladinAuto2:Show()
		GreaterPaladinAuto3:Show()
	else
		GreaterPaladinAuto:Hide()
		GreaterPaladinAuto2:Hide()
		GreaterPaladinAuto3:Hide()
	end
end
spec:SetScript("OnEvent", SpecChange);	

local frame = CreateFrame("FRAME", "FooAddonFrame");
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventHandler(self, event, ...)
	local PlayerClass = UnitClass("player");
	local CurrentSpec = GetSpecialization();
	if(PlayerClass == "Paladin") then
		CreateFrames()
	end
end
frame:SetScript("OnEvent", eventHandler);


	
	
	
	
	
	
	
	
	