SynergyToggleExtended = SynergyToggleExtended or {}
local STE = SynergyToggleExtended

STE.name = "SynergyToggleExtended"
STE.version = "1.0"

local EM = GetEventManager()
local defaults = {
	dd_runebreak = false,
}

function STE.OnPlayerCombatChange(_, inCombat)
	if IsUnitDead("player") then return end

	if inCombat then
		if SynergyToggle.savedVariables.general_conjurersPortal and SynergyToggle.DoesBossExist("врол", "boss1") then
			SynergyToggle.synergies["/esoui/art/icons/malatar_agonizingbolts.dds"] = true
		else
			SynergyToggle.synergies["/esoui/art/icons/malatar_agonizingbolts.dds"] = false
		end
	end
end

local function init()
	local SV = ZO_SavedVars:NewAccountWide('STE_SV', 1, nil, defaults)
	STE.menu.init(SV)

	SynergyToggle.SYNERGYBLACKLIST["/esoui/art/icons/ability_arcanist_004.dds"] = true
	SynergyToggle.synergies["/esoui/art/icons/ability_arcanist_004.dds"] = SV.dd_runebreak

	EVENT_MANAGER:RegisterForEvent(STE.name, EVENT_PLAYER_COMBAT_STATE, STE.OnPlayerCombatChange)
end

function STE.OnAddOnLoaded(_, addonName)
	if addonName ~= STE.name then return end

	init()
	EM:UnregisterForEvent(STE.name, EVENT_ADD_ON_LOADED)
end

EM:RegisterForEvent(STE.name, EVENT_ADD_ON_LOADED, STE.OnAddOnLoaded)
