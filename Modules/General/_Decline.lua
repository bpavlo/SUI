local Module = SUI:NewModule("General.Decline");

function Module:OnEnable()
  local db = SUI.db.profile.general.automation.decline
  if (db) then
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("DUEL_REQUESTED")
    -- Pet Battles don't exist in TBC; only register if available
    if C_PetBattles then
      frame:RegisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED")
    end
    frame:SetScript("OnEvent", function(self, event, name)
      if event == "DUEL_REQUESTED" then
        CancelDuel()
        StaticPopup_Hide("DUEL_REQUESTED")
      elseif event == "PET_BATTLE_PVP_DUEL_REQUESTED" and C_PetBattles then
        C_PetBattles.CancelPVPDuel()
        StaticPopup_Hide("PET_BATTLE_PVP_DUEL_REQUESTED")
      end
    end)
  end
end