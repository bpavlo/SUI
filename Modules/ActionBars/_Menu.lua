local Module = SUI:NewModule("ActionBars.Menu");

-- Helper: build a nil-safe list from potentially-nil globals
local function SafeList(...)
  local t = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    if v then t[#t+1] = v end
  end
  return t
end

function Module:OnEnable()
  local db = SUI.db.profile.actionbar

  -- MicroButtonAndBagsBar is WotLK Classic only; bail gracefully on TBC
  if not MicroButtonAndBagsBar then return end

  if (db.style == 'Small') then
    -- MicroMenu
    if SHOW_SPEC_LEVEL and UnitLevel("player") < SHOW_SPEC_LEVEL then
      CharacterMicroButton:ClearAllPoints()
      CharacterMicroButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -205, 5.5)

      local moving
      hooksecurefunc(CharacterMicroButton, "SetPoint", function(self)
        if moving or InCombatLockdown() then return end
        moving = true
        self:ClearAllPoints()
        self:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -205, 5.5)
        moving = nil
      end)
    else
      CharacterMicroButton:ClearAllPoints()
      CharacterMicroButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -230, 5.5)

      local moving
      hooksecurefunc(CharacterMicroButton, "SetPoint", function(self)
        if moving or InCombatLockdown() then return end
        moving = true
        self:ClearAllPoints()
        self:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -230, 5.5)
        moving = nil
      end)
    end

    -- Bag buttons
    MainMenuBarBackpackButton:ClearAllPoints()
    MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -5, 50)

    local BagButtons = SafeList(
      MainMenuBarBackpackButton,
      CharacterBag0Slot,
      CharacterBag1Slot,
      CharacterBag2Slot,
      CharacterBag3Slot,
      MainMenuBarBackpackButton and MainMenuBarBackpackButton.Back,
      CharacterBag0Slot and CharacterBag0Slot.Back,
      CharacterBag1Slot and CharacterBag1Slot.Back,
      CharacterBag2Slot and CharacterBag2Slot.Back,
      CharacterBag3Slot and CharacterBag3Slot.Back,
      KeyRingButton,
      KeyRingButton and KeyRingButton.Back
    )

    for _, frame in pairs(BagButtons) do
      frame:SetScale(0.75)
    end

    local MicroMenu = SafeList(
      CharacterMicroButton,
      SpellbookMicroButton,
      TalentMicroButton,
      AchievementMicroButton,
      QuestLogMicroButton,
      SocialsMicroButton,
      PVPMicroButton,
      LFGMicroButton,
      MainMenuMicroButton,
      HelpMicroButton
    )

    for _, frame in pairs(MicroMenu) do
      frame:SetScale(0.75)
    end
    if LFGMicroButton and PVPMicroButton then
      LFGMicroButton:SetPoint("BOTTOMRIGHT", PVPMicroButton, 26, 0)
    end
    if MainMenuMicroButton and LFGMicroButton then
      MainMenuMicroButton:ClearAllPoints()
      MainMenuMicroButton:SetPoint("BOTTOMRIGHT", LFGMicroButton, 26, 0)
    end

    -- Show/Hide on Mouseover
    if (db.menu.mouseovermicro) then
      -- MicroMenu
      local ignore

      local function setAlphaMicroMenu(b, a)
        if ignore then return end
        ignore = true
        if b:IsMouseOver() then
          b:SetAlpha(1)
        else
          b:SetAlpha(0)
        end
        ignore = nil
      end

      local function showMicroMenu(self)
          for _, v in ipairs(MICRO_BUTTONS) do
              ignore = true
              if _G[v] then _G[v]:SetAlpha(1) end
              ignore = nil
          end
      end
      
      local function hideMicroMenu(self)
          for _, v in ipairs(MICRO_BUTTONS) do
              ignore = true
              if _G[v] then _G[v]:SetAlpha(0) end
              ignore = nil
          end
      end
      
      for _, v in ipairs(MICRO_BUTTONS) do
          v = _G[v]
          if v then
            hooksecurefunc(v, "SetAlpha", setAlphaMicroMenu)
            v:HookScript("OnEnter", showMicroMenu)
            v:HookScript("OnLeave", hideMicroMenu)
            v:SetAlpha(0)
          end
      end
    end

    if (db.menu.mouseoverbags) then
      -- Bags bar
      for _, frame in pairs(BagButtons) do
        frame:SetAlpha(0)
        frame:SetScript('OnEnter', function()
        MainMenuBarBackpackButton:SetAlpha(1)
        CharacterBag0Slot:SetAlpha(1)
        CharacterBag1Slot:SetAlpha(1)
        CharacterBag2Slot:SetAlpha(1)
        CharacterBag3Slot:SetAlpha(1)
        if KeyRingButton then KeyRingButton:SetAlpha(1) end
      end)
      frame:SetScript('OnLeave', function()
        if not (MouseIsOver(frame)) then
          MainMenuBarBackpackButton:SetAlpha(0)
          CharacterBag0Slot:SetAlpha(0)
          CharacterBag1Slot:SetAlpha(0)
          CharacterBag2Slot:SetAlpha(0)
          CharacterBag3Slot:SetAlpha(0)
          if KeyRingButton then KeyRingButton:SetAlpha(0) end
          end
        end)
      end
    end
  end

  if (db.style == 'Retail' or db.style == 'RetailTransparent') then
    -- MicroMenu
    if SHOW_SPEC_LEVEL and UnitLevel("player") < SHOW_SPEC_LEVEL then
      CharacterMicroButton:ClearAllPoints()
      CharacterMicroButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -205, 5.5)

      local moving
      hooksecurefunc(CharacterMicroButton, "SetPoint", function(self)
        if moving or InCombatLockdown() then return end
        moving = true
        self:ClearAllPoints()
        self:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -205, 5.5)
        moving = nil
      end)
    else
      CharacterMicroButton:ClearAllPoints()
      CharacterMicroButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -230, 5.5)

      local moving
      hooksecurefunc(CharacterMicroButton, "SetPoint", function(self)
        if moving or InCombatLockdown() then return end
        moving = true
        self:ClearAllPoints()
        self:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -230, 5.5)
        moving = nil
      end)
    end

    -- Bag buttons
    MainMenuBarBackpackButton:ClearAllPoints()
    MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", MicroButtonAndBagsBar, -5, 50)  

    local BagButtons = SafeList(
      MainMenuBarBackpackButton,
      CharacterBag0Slot,
      CharacterBag1Slot,
      CharacterBag2Slot,
      CharacterBag3Slot,
      MainMenuBarBackpackButton and MainMenuBarBackpackButton.Back,
      CharacterBag0Slot and CharacterBag0Slot.Back,
      CharacterBag1Slot and CharacterBag1Slot.Back,
      CharacterBag2Slot and CharacterBag2Slot.Back,
      CharacterBag3Slot and CharacterBag3Slot.Back,
      KeyRingButton,
      KeyRingButton and KeyRingButton.Back
    )

    for _, frame in pairs(BagButtons) do
      frame:SetScale(0.75)
    end

    local MicroMenu = SafeList(
      CharacterMicroButton,
      SpellbookMicroButton,
      TalentMicroButton,
      AchievementMicroButton,
      QuestLogMicroButton,
      SocialsMicroButton,
      PVPMicroButton,
      LFGMicroButton,
      MainMenuMicroButton,
      HelpMicroButton
    )

    for _, frame in pairs(MicroMenu) do
      frame:SetScale(0.75)
    end
    if LFGMicroButton and PVPMicroButton then
      LFGMicroButton:SetPoint("BOTTOMRIGHT", PVPMicroButton, 26, 0)
    end
    if MainMenuMicroButton and LFGMicroButton then
      MainMenuMicroButton:ClearAllPoints()
      MainMenuMicroButton:SetPoint("BOTTOMRIGHT", LFGMicroButton, 26, 0)
    end

    -- Show/Hide on Mouseover
    if (db.menu.mouseovermicro) then
      -- MicroMenu
      local ignore

      local function setAlphaMicroMenu(b, a)
        if ignore then return end
        ignore = true
        if b:IsMouseOver() then
          b:SetAlpha(1)
        else
          b:SetAlpha(0)
        end
        ignore = nil
      end

      local function showMicroMenu(self)
          for _, v in ipairs(MICRO_BUTTONS) do
              ignore = true
              if _G[v] then _G[v]:SetAlpha(1) end
              ignore = nil
          end
      end
      
      local function hideMicroMenu(self)
          for _, v in ipairs(MICRO_BUTTONS) do
              ignore = true
              if _G[v] then _G[v]:SetAlpha(0) end
              ignore = nil
          end
      end
      
      for _, v in ipairs(MICRO_BUTTONS) do
          v = _G[v]
          if v then
            hooksecurefunc(v, "SetAlpha", setAlphaMicroMenu)
            v:HookScript("OnEnter", showMicroMenu)
            v:HookScript("OnLeave", hideMicroMenu)
            v:SetAlpha(0)
          end
      end
    end

    if (db.menu.mouseoverbags) then
      -- Bags bar
      for _, frame in pairs(BagButtons) do
        frame:SetAlpha(0)
        frame:SetScript('OnEnter', function()
        MainMenuBarBackpackButton:SetAlpha(1)
        CharacterBag0Slot:SetAlpha(1)
        CharacterBag1Slot:SetAlpha(1)
        CharacterBag2Slot:SetAlpha(1)
        CharacterBag3Slot:SetAlpha(1)
        if KeyRingButton then KeyRingButton:SetAlpha(1) end
      end)
      frame:SetScript('OnLeave', function()
        if not (MouseIsOver(frame)) then
          MainMenuBarBackpackButton:SetAlpha(0)
          CharacterBag0Slot:SetAlpha(0)
          CharacterBag1Slot:SetAlpha(0)
          CharacterBag2Slot:SetAlpha(0)
          CharacterBag3Slot:SetAlpha(0)
          if KeyRingButton then KeyRingButton:SetAlpha(0) end
          end
        end)
      end
    end
  end
end
