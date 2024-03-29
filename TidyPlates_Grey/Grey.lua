-----------------------------------------------------
-- Tidy Plates Grey
-----------------------------------------------------
local Theme = {}
local CopyTable = TidyPlatesUtility.copyTable

local defaultArtPath = "Interface\\Addons\\TidyPlates_Grey"
--local font =					defaultArtPath.."\\LiberationSans-Regular.ttf"
--local font = "Interface\\Addons\\TidyPlatesHub\\shared\\AccidentalPresidency.ttf"
--local font = "Interface\\Addons\\TidyPlates\\media\\DefaultFont.ttf"
local font =					"FONTS\\ARIALN.TTF"

local nameplate_verticalOffset = -5
local castBar_verticalOffset = -6 -- Adjust Cast Bar distance
local EmptyTexture = "Interface\\Addons\\TidyPlatesHub\\shared\\Empty"

-- Non-Latin Font Bypass
local NonLatinLocales = { ["ruRU"] = true, ["koKR"] = true, ["zhCN"] = true, ["zhTW"] = true, }
if NonLatinLocales[GetLocale()] == true then font = NAMEPLATE_FONT end

local StyleDefault = {}

StyleDefault.hitbox = { width = 140, height = 35, }

StyleDefault.highlight = {
	texture =					defaultArtPath.."\\Highlight",
}

StyleDefault.healthborder = {
	texture		 =				defaultArtPath.."\\RegularBorder",
	glowtexture =					defaultArtPath.."\\Highlight",
	--texture =					defaultArtPath.."\\EliteBorder",
	width = 128,
	height = 64,
	x = 0,
	y = nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.eliteicon = {
	texture = defaultArtPath.."\\EliteIcon",
	width = 14,
	height = 14,
	x = -51,
	y = 17,
	anchor = "CENTER",
	show = true,
}

StyleDefault.target = {
	texture = defaultArtPath.."\\TargetBox",
	width = 128,
	height = 64,
	x = 0,
	y = nameplate_verticalOffset,
	anchor = "CENTER",
	show = true,
}

StyleDefault.threatborder = {
	texture =			defaultArtPath.."\\RegularThreat",
	width = 128,
	height = 64,
	x = 0,
	y = nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.castborder = {
	texture =					defaultArtPath.."\\CastStoppable",
	width = 128,
	height = 64,
	x = 0,
	y = 0 +castBar_verticalOffset+nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.castnostop = {
	texture = 				defaultArtPath.."\\CastNotStoppable",
	width = 128,
	height = 64,
	x = 0,
	y = 0+castBar_verticalOffset+nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.name = {
	typeface =					font,
	size = 9,
	width = 100,
	height = 10,
	x = 0,
	y = 6+nameplate_verticalOffset,
	align = "LEFT",
	anchor = "LEFT",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
}

StyleDefault.level = {
	typeface =					font,
	size = 9,
	width = 25,
	height = 10,
	x = 36,
	y = 6+nameplate_verticalOffset,
	align = "RIGHT",
	anchor = "CENTER",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
}

StyleDefault.healthbar = {
	texture =					 defaultArtPath.."\\Statusbar",
	backdrop = 				EmptyTexture,
	--backdrop = 				defaultArtPath.."\\Statusbar",
	height = 12,
	width = 101,
	x = 0,
	y = 15+nameplate_verticalOffset,
	anchor = "CENTER",
	orientation = "HORIZONTAL",
}

StyleDefault.castbar = {
	texture =					defaultArtPath.."\\Statusbar",
	backdrop = 				EmptyTexture,
	--backdrop = 				defaultArtPath.."\\Statusbar",
	height = 12,
	width = 99,
	x = 0,
	y = -8+castBar_verticalOffset+nameplate_verticalOffset,
	anchor = "CENTER",
	orientation = "HORIZONTAL",
}

StyleDefault.customtext = {
	typeface =					font,
	size = 9,
	width = 97,
	height = 10,
	x = 0,
	y = 15.5+nameplate_verticalOffset,
	align = "RIGHT",
	anchor = "CENTER",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
	show = true,
}

StyleDefault.spelltext = {
	typeface =					font,
	size = 8,
	width = 100,
	height = 10,
	x = 1,
	y = castBar_verticalOffset-8+nameplate_verticalOffset,
	align = "LEFT",
	anchor = "CENTER",
	vertical = "BOTTOM",
	shadow = true,
	flags = "NONE",
	show = true,
}

StyleDefault.spellicon = {
	width = 18,
	height = 18,
	x = 62,
	y = -8+castBar_verticalOffset+nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.raidicon = {
	width = 20,
	height = 20,
	x = -35,
	y = 12+nameplate_verticalOffset,
	anchor = "TOP",
}

StyleDefault.skullicon = {
	width = 14,
	height = 14,
	x = 44,
	y = 8+nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.frame = {
	width = 101,
	height = 45,
	x = 0,
	y = 0+nameplate_verticalOffset,
	anchor = "CENTER",
}

StyleDefault.threatcolor = {
	LOW = {r = .6, g = 1, b = 0, a = 1,},
	MEDIUM = {r = .6, g = 1, b = 0, a = 1,},
	HIGH = {r = 1, g = 0, b = 0, a= 1,},  }

	
-- No-Bar Style		(6.2)
local StyleTextOnly = CopyTable(StyleDefault)
StyleTextOnly.threatborder.texture = EmptyTexture
StyleTextOnly.healthborder.texture = EmptyTexture
StyleTextOnly.healthborder.y = nameplate_verticalOffset - 7
StyleTextOnly.healthbar.texture = EmptyTexture
StyleTextOnly.healthbar.backdrop = EmptyTexture
StyleTextOnly.eliteicon.texture = EmptyTexture
--StyleTextOnly.name.flags = "OUTLINE"
StyleTextOnly.name.align = "CENTER"
StyleTextOnly.name.anchor = "CENTER"
StyleTextOnly.name.size = 12
StyleTextOnly.name.y = 12
StyleTextOnly.name.x = 0
StyleTextOnly.name.width = 200
StyleTextOnly.customtext.align = "CENTER"
--StyleTextOnly.customtext.flags = "OUTLINE"
StyleTextOnly.customtext.size = 8
StyleTextOnly.customtext.y = 3
StyleTextOnly.customtext.x = 0
StyleTextOnly.level.show = false
StyleTextOnly.skullicon.show = false
StyleTextOnly.eliteicon.show = false
StyleTextOnly.highlight.texture = "Interface\\Addons\\TidyPlatesHub\\shared\\Highlight"
StyleTextOnly.target.texture = "Interface\\Addons\\TidyPlatesHub\\shared\\Target"
StyleTextOnly.target.y = nameplate_verticalOffset - 8
StyleTextOnly.target.height = 66

local WidgetConfig = {}
WidgetConfig.ClassIcon = { anchor = "TOP" , x = -32 ,y = 7 }
--WidgetConfig.TotemIcon = { anchor = "TOP" , x = -28 ,y = 12 }
WidgetConfig.TotemIcon = { anchor = "TOP" , x = 0 ,y = 10 }
WidgetConfig.ThreatLineWidget = { anchor =  "CENTER", x = 0 ,y = 18 }
WidgetConfig.ThreatWheelWidget = { anchor =  "CENTER", x = 31 ,y = 23 } -- "CENTER", plate, 30, 18
WidgetConfig.ComboWidget = { anchor = "CENTER" , x = 0 ,y = 24 }
WidgetConfig.RangeWidget = { anchor = "CENTER" , x = 0 ,y = 12 }
WidgetConfig.DebuffWidget = { anchor = "CENTER" , x = 15 ,y = 32 }
if (UnitClassBase("player") == "Druid") or (UnitClassBase("player") == "Rogue") then
	WidgetConfig.DebuffWidgetPlus = { anchor = "CENTER" , x = 15 ,y = 38 }
end

local DamageThemeName = "Grey/|cFFFF4400Damage"
local TankThemeName = "Grey/|cFF3782D1Tank"

Theme["Default"] = StyleDefault
Theme["NameOnly"] = StyleTextOnly			

SLASH_GREYTANK1 = '/greytank'
SlashCmdList['GREYTANK'] = ShowTidyPlatesHubTankPanel

SLASH_GREYDPS1 = '/greydps'
SlashCmdList['GREYDPS'] = ShowTidyPlatesHubDamagePanel


---------------------------------------------
-- Tidy Plates Hub Integration
---------------------------------------------

TidyPlatesThemeList[DamageThemeName] = Theme
local LocalVars = TidyPlatesHubDamageVariables

local ApplyThemeCustomization = TidyPlatesHubFunctions.ApplyThemeCustomization

local function ApplyDamageCustomization()
	ApplyThemeCustomization(Theme)
end

local function OnInitialize(plate)
	TidyPlatesHubFunctions.OnInitializeWidgets(plate, WidgetConfig)
end

local function OnActivateTheme(themeTable)
		if Theme == themeTable then
			LocalVars = TidyPlatesHubFunctions:UseDamageVariables()
			ApplyDamageCustomization()
		end
end

Theme.SetNameColor = TidyPlatesHubFunctions.SetNameColor
Theme.SetScale = TidyPlatesHubFunctions.SetScale
Theme.SetAlpha = TidyPlatesHubFunctions.SetAlpha
Theme.SetHealthbarColor = TidyPlatesHubFunctions.SetHealthbarColor
Theme.SetThreatColor = TidyPlatesHubFunctions.SetThreatColor
Theme.SetCastbarColor = TidyPlatesHubFunctions.SetCastbarColor
Theme.SetCustomText = TidyPlatesHubFunctions.SetCustomText
Theme.OnUpdate = TidyPlatesHubFunctions.OnUpdate
Theme.OnContextUpdate = TidyPlatesHubFunctions.OnContextUpdate
Theme.ShowConfigPanel = ShowTidyPlatesHubDamagePanel
Theme.SetStyle = TidyPlatesHubFunctions.SetStyleBinary
Theme.SetCustomText = TidyPlatesHubFunctions.SetCustomTextBinary
Theme.OnInitialize = OnInitialize		-- Need to provide widget positions
Theme.OnActivateTheme = OnActivateTheme -- called by Tidy Plates Core, Theme Loader
Theme.OnApplyThemeCustomization = ApplyDamageCustomization -- Called By Hub Panel

do
	local TankTheme = CopyTable(Theme)
	TidyPlatesThemeList[TankThemeName] = TankTheme
	
	local function ApplyTankCustomization()
		ApplyThemeCustomization(TankTheme)
	end

	local function OnActivateTheme(themeTable)
		if TankTheme == themeTable then
			LocalVars = TidyPlatesHubFunctions:UseTankVariables()
			ApplyTankCustomization()
		end
	end
	
	TankTheme.OnActivateTheme = OnActivateTheme -- called by Tidy Plates Core, Theme Loader
	TankTheme.OnApplyThemeCustomization = ApplyTankCustomization -- Called By Hub Panel
	TankTheme.ShowConfigPanel = ShowTidyPlatesHubTankPanel
end

