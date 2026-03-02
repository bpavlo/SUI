local Module = SUI:NewModule("Skins.Friendlist");

function Module:OnEnable()
  if (SUI:Color()) then
    -- FriendsFrame border sub-regions differ between TBC and WotLK Classic
    -- Guard all accesses to avoid nil errors on TBC
    local function colorIfExists(list, colorArgs)
      for _, v in pairs(list) do
        if v and v.SetVertexColor then
          v:SetVertexColor(unpack(colorArgs))
        end
      end
    end

    colorIfExists({
      FriendFrameTopBorder,
      FriendsFrameTopEdge,
      FriendsFrameTopRightCorner,
      FriendsFrameRightEdge,
      FriendsFrameBottomRightCorner,
      FriendsFrameBottomEdge,
      FriendsFrameBottomLeftCorner,
      FriendsFrameLeftEdge,
      FriendsFrameTopLeftCorner,
      FriendsFrameBorderTopEdge,
      FriendsFrameBorderRightEdge,
      FriendsFrameBorderBottomEdge,
      FriendsFrameBorderLeftEdge,
      FriendsFrameBorderTopRightCorner,
      FriendsFrameBorderTopLeftCorner,
      FriendsFrameBorderBottomLeftCorner,
      FriendsFrameBorderBottomRightCorner,
    }, SUI:Color(0.15))

    colorIfExists({
      FriendsFrameBg,
      FriendsFrameTitleBg,
      FriendsFrameInsetTopEdge,
      FriendsFrameInsetTopRightCorner,
      FriendsFrameInsetRightEdge,
      FriendsFrameInsetBottomRightCorner,
      FriendsFrameInsetBottomEdge,
      FriendsFrameInsetBottomLeftCorner,
      FriendsFrameInsetLeftEdge,
      FriendsFrameInsetTopLeftCorner,
    }, SUI:Color())

    colorIfExists({
      FriendsFrameFriendsScrollFrameTop,
      FriendsFrameFriendsScrollFrameMiddle,
      FriendsFrameFriendsScrollFrameBottom,
      FriendsFrameFriendsScrollFrameThumbTexture,
      FriendsFrameFriendsScrollFrameScrollUpButtonNormal,
      FriendsFrameFriendsScrollFrameScrollDownButtonNormal,
      FriendsFrameFriendsScrollFrameScrollUpButtonDisabled,
      FriendsFrameFriendsScrollFrameScrollDownButtonDisabled,
    }, SUI:Color())
  end
end
