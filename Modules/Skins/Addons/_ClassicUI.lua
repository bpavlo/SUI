local Skin = SUI:NewModule("Skins.ClassicUI");

function Skin:OnEnable()
  local ClassicUI = IsAddOnLoaded("ClassicUI")
  if not (ClassicUI) then return end
  -- MainMenuBarArtFrameBackground sub-objects are WotLK Classic only
  if not MainMenuBarArtFrameBackground or not MainMenuBarArtFrameBackground.BackgroundLarge2 then return end
  if (SUI:Color()) then
    for i, v in pairs({
      MainMenuBarArtFrameBackground.BackgroundLarge2,
      MainMenuBarArtFrameBackground.BagsArt,
      MainMenuBarArtFrameBackground.MicroButtonArt,
    }) do
      if v then v:SetVertexColor(unpack(SUI:Color(0.15))) end
    end
  end
end