

		
---------------------------------------------------------------------------------------------------------
local LocalVars
local Theme = {}
local OnInitializeWidgets = TidyPlatesHubFunctions.OnInitializeWidgets
local SetMultistyle = TidyPlatesHubFunctions.SetMultistyle
local ApplyFontCustomization = TidyPlatesHubFunctions.ApplyFontCustomization
local ApplyStyleCustomization = TidyPlatesHubFunctions.ApplyStyleCustomization
local EnableWatchers = TidyPlatesHubFunctions.EnableWatchers

-- Style Management
---------------------------------------------------------------------------------------------------------
local VariableReference = {}
local StyleList = {"Blizzard"}													-- Pre-populated with self-contained artwork
local StyleTree = {["Blizzard"] = {"BlizzardDefault", "BlizzardHeadline"}}
local StyleWidgets = {}

function AddTidyPlatesHubStyle(name, normalStyleTable, headlineStyleTable, widgetConfigTable)
	if name and normalStyleTable and headlineStyleTable and widgetConfigTable then
		TidyPlatesHubModes.ArtStyles[#TidyPlatesHubModes.ArtStyles + 1] = { text = name, notCheckable = 1 }
		StyleList[#StyleList + 1] = name
		Theme[name.."Default"] = normalStyleTable
		Theme[name.."Headline"] = headlineStyleTable
		StyleWidgets[name] = widgetConfigTable
		StyleTree[name] = {name.."Default", name.."Headline"}
	end
end

-- Theme Functions
---------------------------------------------------------------------------------------------------------
local function OnCreateNameplate(plate)
	local WidgetConfig = StyleWidgets[StyleList[LocalVars.ArtDefault]]
	OnInitializeWidgets(plate, WidgetConfig)
end

local function ApplyCustomization(theme)
	if LocalVars then
		local style = StyleList[LocalVars.ArtDefault]
		if style then
			EnableWatchers()
			ApplyStyleCustomization(theme[StyleTree[style][1]])
			ApplyFontCustomization(theme[StyleTree[style][2]])
			TidyPlates:ForceUpdate()
		end
	end
end

local function OnApplyThemeCustomization(theme)				-- Called when you change something in the Hub panel
	if theme then		
		if VariableReference[theme] then
			ApplyCustomization(theme)
		end
	end
end

local function OnActivateTheme(theme)		-- Called when themes are changed, or loaded when entering the game
	if theme then
		local name = VariableReference[theme]
		
		if name then
			LocalVars = TidyPlatesHubFunctions.UseVariables(name)
			ApplyCustomization(theme)
		end
	end
end

local function SetStyle(unit)
	return StyleTree[StyleList[LocalVars.ArtDefault]][SetMultistyle(unit)]
end

local function ShowHubPanel()
	ShowTidyPlatesHubDamagePanel()
end

-- Theme Function Assignment
------------------------------------------------------------------------------------------------------------------------------------
Theme["BlizzardDefault"] = TidyPlates.Template
Theme["BlizzardHeadline"] = TidyPlates.Template

-- General Theme Functions
Theme.SetNameColor = TidyPlatesHubFunctions.SetNameColor
Theme.SetScale = TidyPlatesHubFunctions.SetScale
Theme.SetAlpha = TidyPlatesHubFunctions.SetAlpha
Theme.SetHealthbarColor = TidyPlatesHubFunctions.SetHealthbarColor
Theme.SetThreatColor = TidyPlatesHubFunctions.SetThreatColor
Theme.SetCastbarColor = TidyPlatesHubFunctions.SetCastbarColor
Theme.SetCustomText = TidyPlatesHubFunctions.SetCustomTextBinary
Theme.SetStyle = SetStyle
Theme.OnActivateTheme = OnActivateTheme -- called by Tidy Plates Core, Theme Loader
Theme.OnApplyThemeCustomization = OnApplyThemeCustomization -- Called By Hub Panel when settings change
Theme.ShowConfigPanel = ShowHubPanel

Theme.OnUpdate = TidyPlatesHubFunctions.OnUpdate			--- Need to have OnUpdate control the widget positions based on the widget Table
Theme.OnContextUpdate = TidyPlatesHubFunctions.OnContextUpdate
Theme.OnInitialize = OnCreateNameplate		-- Need to provide widget positions
	

-- Category Creation 	
------------------------------------------------------------------------------------------------------------------------------------

local function CreateHubTheme(title, reference)	-- formatted title, variable/panel set name
	

	TidyPlatesThemeList[title] = Theme
	VariableReference[Theme] = reference
end

--CreateHubTheme("|cFFFF4400Damage", "Damage")
--CreateHubTheme("|cFF3782D1Tank", "Tank")


--[[
			The internal Hub art will borrow the artwork from Blizzard's own nameplate art.

			Other themes will add their data via a function.  For example:

			Quatre.lua...
			TidyPlatesHub.AddStyle(name, normalStyleTable, headlineStyleTable)
--]]

--[[
	texture		 =				"Interface\\Tooltips\\Nameplate-Border",
	texture		 =				"Interface\\Tooltips\\Nameplate-CastBar-Shield",
	texture		 =				"Interface\\Tooltips\\Nameplate-CastBar.blp",
	texture		 =				"Interface\\Tooltips\\Nameplate-Glow.blp",
	texture		 =				"Interface\\Tooltips\\EliteNameplateIcon.blp",
	texture		 =				"Interface\\TARGETINGFRAME\\UI-StatusBar.blp",
	--]]

