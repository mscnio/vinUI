-- SLASH OPTIONEN und CVARS
SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/reload"

SlashCmdList["TOKEN"] = function()
		print("Frage Tokenpreis ab ...")
		C_WowTokenPublic.UpdateMarketPrice()
		C_Timer.After(2,
		function () 
			local tokenpreis = (GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
			print("Tokenpreis: " .. tokenpreis);
		end)
	end;
SLASH_STATS1 = '/tk'



-- FONTS
GameFontNormal:SetFont("Fonts\\FRIZQT__.ttf",12)
GameFontNormalSmall:SetFont("Fonts\\FRIZQT__.ttf",11)
FriendsFont_Normal:SetFont("Fonts\\FRIZQT__.ttf", 12)
FriendsFont_Small:SetFont("Fonts\\FRIZQT__.ttf", 11)

SystemFont_Outline_Small:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")
NumberFontNormal:SetFont("Fonts\\FRIZQT__.ttf", 12, "OUTLINE")
NumberFontNormalSmallGray:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")

Tooltip_Med:SetFont("Fonts\\FRIZQT__.ttf", 12)
Tooltip_Small:SetFont("Fonts\\FRIZQT__.ttf", 11)
GameTooltipHeader:SetFont("Fonts\\FRIZQT__.ttf", 13, "OUTLINE")

-- UNITFRAMES
PlayerFrame:SetScale(1)
TargetFrame:SetScale(1)
PartyMemberFrame1:SetScale(1)
PartyMemberFrame2:SetScale(1)
PartyMemberFrame3:SetScale(1)
PartyMemberFrame4:SetScale(1)

-- GENERIC
--UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
BuffFrame:SetScale(1.1)

-- ToT
--TargetFrameToT:ClearAllPoints()
--TargetFrameToT:SetPoint("LEFT", TargetFrame, "CENTER", 0, 75)
--TargetFrameToT:SetScale(1.2)
--
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, -25)
TargetFrameSpellBar.SetPoint = function() end
TargetFrameSpellBar:SetScale(1.4)

--[[ EXTRAACTIONBUTTON
local n=ExtraActionButton1
n:ClearAllPoints()
n:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
n:SetScale(1)
--]]

--[[ KLASSSENPORTRAITS
UFP = "UnitFramePortrait_Update"
UICC = "Interface\\TargetingFrame\\UI-Classes-Circles"
CIT = CLASS_ICON_TCOORDS
CIT = CLASS_ICON_TCOORDS
hooksecurefunc(UFP,function(self) if self.portrait then local t = CIT[select(2,UnitClass(self.unit))] if t then self.portrait:SetTexture(UICC) self.portrait:SetTexCoord(unpack(t)) end end end)
--]]

-- PRINT WORLDBOSS ID
C_Timer.After(3, 
	function()
		print("World-Boss ID:")
			for k, v in pairs({Drov = 37460, Tarlna = 37462, Rukhmar = 37464})
				do print(format("%s: %s", k, IsQuestFlaggedCompleted(v) and 
					"\124cff00ff00Ja\124r" or "\124cffff0000Nein\124r")) 
			end
	end);

-- PRINT TOKEN PRICE
C_WowTokenPublic.UpdateMarketPrice(); 
C_Timer.After(5,
	function () 
		local tokenpreis = (GetMoneyString(C_WowTokenPublic.GetCurrentMarketPrice()))
		print("Tokenpreis: " .. tokenpreis);
	end); 

-- END
UIErrorsFrame:AddMessage("vinUI geladen.", 75, 0, 130, 53, 5)