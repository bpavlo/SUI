local Module = SUI:NewModule("Skins.UnitFrames");

function Module:OnEnable()
    if (SUI:Color()) then
        -- Build list with nil-safe access for cast bar borders
        -- TBC uses CastingBarFrameBorder (global) instead of CastingBarFrame.Border (child key)
        local frames = {
            PlayerFrameTexture,
            TargetFrameTextureFrameTexture,
            TargetFrameToTTextureFrameTexture,
            PetFrameTexture,
            PartyMemberFrame1Texture,
            PartyMemberFrame2Texture,
            PartyMemberFrame3Texture,
            PartyMemberFrame4Texture,
            PartyMemberFrame1PetFrameTexture,
            PartyMemberFrame2PetFrameTexture,
            PartyMemberFrame3PetFrameTexture,
            PartyMemberFrame4PetFrameTexture,
        }
        -- CastingBarFrame.Border is WotLK; TBC uses CastingBarFrameBorder global
        if CastingBarFrame and CastingBarFrame.Border then
            frames[#frames+1] = CastingBarFrame.Border
        elseif CastingBarFrameBorder then
            frames[#frames+1] = CastingBarFrameBorder
        end
        -- TargetFrameSpellBar.Border is WotLK; TBC uses TargetFrameSpellBarBorder global
        if TargetFrameSpellBar and TargetFrameSpellBar.Border then
            frames[#frames+1] = TargetFrameSpellBar.Border
        elseif TargetFrameSpellBarBorder then
            frames[#frames+1] = TargetFrameSpellBarBorder
        end

        for i, v in ipairs(frames) do
            if v and v.SetVertexColor then
                v:SetVertexColor(unpack(SUI:Color(0.15)))
            end
        end
    end
end
