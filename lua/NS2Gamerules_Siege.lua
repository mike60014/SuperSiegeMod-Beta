
Script.Load("lua/NS2Gamerules.lua")
--class "NS2GamerulesSiege" (Gamerules)

local networkVars = {}

function NS2Gamerules:GetWarmUpPlayerLimit()
	return 10
end

function NS2Gamerules:KillEnemiesNearCommandStructureInPreGame(timePassed)
--Someday?
end

if Server then

    function NS2Gamerules:UpdateStalemateSequence()
        local seq = GetStalemateSequence()
        if seq then
            seq:UpdateStalemateSequence()
        end
    end
	
	
end


class "VoteStalemate" (Gamerules)

VoteStalemate.kMapName = "VoteStalemate"

function VoteStalemate:CastVoteByPlayer(voteTechId, player)
	if voteTechId == kTechId.VoteStalemate then
		if self:VotingStalemateVoteAllowed() then
			local team = player:GetTeam()
			if team.VoteToStalemate then
				team:VoteToStalemate(player)
			end
		end
	end
end

function VoteStalemate:VotingStalemateVoteAllowed()
    return PlayerUI_GetGameStartTime() > 0 and Shared.GetTime() - PlayerUI_GetGameStartTime() > kMinTimeBeforeStalemate
end


Shared.LinkClassToMap("VoteStalemate", VoteStalemate.kMapName, networkVars)
--Shared.LinkClassToMap("VoteStalemate", kTechId.VoteStalemate, {})
