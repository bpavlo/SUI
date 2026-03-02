local Module = SUI:NewModule("Skins.Frames");

function Module:OnEnable()
  if (SUI:Color()) then
    -- GameMenuFrame.TopEdge etc. are NineSlice-style border children (WotLK/Retail)
    -- In TBC Classic these don't exist on frames
    local frames = {}
    if GameMenuFrame and GameMenuFrame.TopEdge then
      frames[#frames+1] = GameMenuFrame.TopEdge
      frames[#frames+1] = GameMenuFrame.RightEdge
      frames[#frames+1] = GameMenuFrame.BottomEdge
      frames[#frames+1] = GameMenuFrame.LeftEdge
      frames[#frames+1] = GameMenuFrame.TopRightCorner
      frames[#frames+1] = GameMenuFrame.TopLeftCorner
      frames[#frames+1] = GameMenuFrame.BottomLeftCorner
      frames[#frames+1] = GameMenuFrame.BottomRightCorner
    end
    if StaticPopup1 and StaticPopup1.TopEdge then
      frames[#frames+1] = StaticPopup1.TopEdge
      frames[#frames+1] = StaticPopup1.RightEdge
      frames[#frames+1] = StaticPopup1.BottomEdge
      frames[#frames+1] = StaticPopup1.LeftEdge
      frames[#frames+1] = StaticPopup1.TopRightCorner
      frames[#frames+1] = StaticPopup1.TopLeftCorner
      frames[#frames+1] = StaticPopup1.BottomLeftCorner
      frames[#frames+1] = StaticPopup1.BottomRightCorner
    end
    for i, v in ipairs(frames) do
      v:SetVertexColor(unpack(SUI:Color(0.15)))
    end
  end
end
