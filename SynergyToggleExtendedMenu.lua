SynergyToggleExtended = SynergyToggleExtended or {}
local STE = SynergyToggleExtended

STE.menu = {}
local STE_M = STE.menu

local LAM = LibAddonMenu2

local function constructPanel()
	local panel = {
		type = "panel",
		name = "Synergy Toggle Extended",
		displayName = "Synergy Toggle Extended",
		author = "wnkbll",
		version = STE.version,
		slashCommand = "/ste",
		registerForRefresh = true,
		registerForDefaults = true,
	}

	return panel
end

local function constructOptions(SV)
	local options = {
		{
			type = "checkbox",
			name = "|t35:35:/esoui/art/icons/ability_arcanist_004.dds|t Runebreak",
			getFunc = function() return SV.dd_runebreak end,
			setFunc = function(value)
						SV.dd_runebreak = value
						SynergyToggle.synergies["/esoui/art/icons/ability_arcanist_004.dds"] = value
					  end,
		}
	}

	return options
end

function STE_M.init(SV)
	local name = STE.name .. "Menu"

	local panel, options = constructPanel(), constructOptions(SV)
    LAM:RegisterAddonPanel(name, panel)
    LAM:RegisterOptionControls(name, options)
end
