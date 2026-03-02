local Module = SUI:NewModule("Misc.Classportrait");

function Module:OnEnable()
  -- Guard: UnitFramePortrait_Update may not exist in all client versions
  if not UnitFramePortrait_Update then return end

  local db = SUI.db.profile.unitframes.portrait
  if (db == 'ClassIcon') then
    local TEXTURE_NAME = "Interface\\AddOns\\SUI\\Media\\Textures\\ClassPortraits\\%s.tga"
    hooksecurefunc("UnitFramePortrait_Update", function(self)
      if not self or not self.portrait or not self.unit then return end
      if UnitIsPlayer(self.unit) then
        local _, class = UnitClass(self.unit)
        if class then
          self.portrait:SetTexture(TEXTURE_NAME:format(class))
        end
      end
    end)
  end
end