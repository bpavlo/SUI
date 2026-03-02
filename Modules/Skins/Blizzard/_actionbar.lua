local Module = SUI:NewModule("Skins.ActionBar");

function Module:OnEnable()
  if (SUI:Color()) then
    -- Build list of textures to color, guarding for nil globals
    local barTextures = {}
    local function addIfExists(obj)
      if obj then barTextures[#barTextures+1] = obj end
    end

    addIfExists(SlidingActionBarTexture0)
    addIfExists(SlidingActionBarTexture1)
    addIfExists(MainMenuBarTexture0)
    addIfExists(MainMenuBarTexture1)
    addIfExists(MainMenuBarTexture2)
    addIfExists(MainMenuBarTexture3)
    addIfExists(MainMenuMaxLevelBar0)
    addIfExists(MainMenuMaxLevelBar1)
    addIfExists(MainMenuMaxLevelBar2)
    addIfExists(MainMenuMaxLevelBar3)
    addIfExists(MainMenuXPBarTexture0)
    addIfExists(MainMenuXPBarTexture1)
    addIfExists(MainMenuXPBarTexture2)
    addIfExists(MainMenuXPBarTexture3)
    addIfExists(MainMenuXPBarTexture4)
    -- ReputationWatchBar sub-objects may differ between TBC and WotLK
    if ReputationWatchBar and ReputationWatchBar.StatusBar then
      addIfExists(ReputationWatchBar.StatusBar.WatchBarTexture0)
      addIfExists(ReputationWatchBar.StatusBar.WatchBarTexture1)
      addIfExists(ReputationWatchBar.StatusBar.WatchBarTexture2)
      addIfExists(ReputationWatchBar.StatusBar.WatchBarTexture3)
    end

    for i, v in pairs(barTextures) do
      v:SetVertexColor(unpack(SUI:Color(0.15)))
    end

    local endCaps = {}
    addIfExists = function(obj) if obj then endCaps[#endCaps+1] = obj end end
    addIfExists(MainMenuBarLeftEndCap)
    addIfExists(MainMenuBarRightEndCap)
    addIfExists(StanceBarLeft)
    addIfExists(StanceBarMiddle)
    addIfExists(StanceBarRight)

    for i, v in pairs(endCaps) do
      v:SetVertexColor(unpack(SUI:Color()))
    end

    if ActionBarUpButton then
      for i, v in pairs({
        ActionBarUpButton:GetRegions(),
      }) do
        v:SetVertexColor(unpack(SUI:Color()))
      end
    end

    if ActionBarDownButton then
      for i, v in pairs({
        ActionBarDownButton:GetRegions()
      }) do
        v:SetVertexColor(unpack(SUI:Color()))
      end
    end

    -- RetailUIArtFrame is WotLK Classic only
    if (SUI.db.profile.actionbar.style == 'Retail' or SUI.db.profile.actionbar.style == 'RetailTransparent') then
      if RetailUIArtFrame and RetailUIStatusBars and MicroButtonAndBagsBarTexture then
        if (SUI:Color()) then
          local retailTextures = {}
          local function addRetail(obj) if obj then retailTextures[#retailTextures+1] = obj end end
          addRetail(RetailUIArtFrame.BackgroundLarge)
          addRetail(RetailUIArtFrame.BackgroundSmall)
          addRetail(MicroButtonAndBagsBarTexture)
          addRetail(RetailUIStatusBars.SingleBarLarge)
          addRetail(RetailUIStatusBars.SingleBarSmall)
          for i, v in pairs(retailTextures) do
            v:SetVertexColor(unpack(SUI:Color(0.15)))
          end
        end
      end
    end
  end
end
