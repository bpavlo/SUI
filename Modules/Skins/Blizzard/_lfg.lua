local Module = SUI:NewModule("Skins.LFG");

function Module:OnEnable()
  -- LFGListingFrame does not exist in TBC Classic (TBC uses a different LFG tool)
  if not LFGListingFrameFrameBackgroundTop then return end
  if (SUI:Color()) then
    for i, v in ipairs({
      LFGListingFrameFrameBackgroundTop,
      LFGListingFrameFrameBackgroundBottom,
      LFGListingFrameFrameBackgroundTitle,
      LFGListingFrameBg,
      LFGListingFrameBackgroundArt,
      LFGParentFramePortrait,
    }) do
      if v then v:SetVertexColor(unpack(SUI:Color())) end
    end
  end
end
