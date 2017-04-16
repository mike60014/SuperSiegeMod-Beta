--Script.Load("lua/Team.lua")

/*
function PlayingTeam:AddSupplyUsed(supplyUsed)
    self.supplyUsed = self.supplyUsed + supplyUsed
    Print("self.supplyUsed is %s", self.supplyUsed)
end
*/


function PlayingTeam:Init(teamName, teamNumber)
	PlayingTeam.Initialize(teamName, teamNumber)
    self.stalemateVoteManager = VoteManager()
    self.stalemateVoteManager:Initialize()
    self.stalemateVoteManager:SetTeamPercentNeeded(kPercentNeededForStalemate)

end

function PlayingTeam:VoteToStalemate(votingPlayer)

    local votingPlayerSteamId = tonumber(Server.GetOwner(votingPlayer):GetUserId())

    if self.stalemateVoteManager:PlayerVotes(votingPlayerSteamId, Shared.GetTime()) then
        PrintToLog("%s cast vote for Stalemate.", votingPlayer:GetName())
        
        -- notify all players on this team
        if Server then

            local vote = self.stalemateVoteManager    

            local netmsg = {
                voterName = votingPlayer:GetName(),
                votesMoreNeeded = vote:GetNumVotesNeeded()-vote:GetNumVotesCast()
            }

            local players = GetEntitiesForTeam("Player", self:GetTeamNumber())

            for index, player in ipairs(players) do
                Server.SendNetworkMessage(player, "VoteStalemateCast", netmsg, false)
            end

        end
    end

end



function PlayingTeam:UpdateVotes()

    PROFILE("PlayingTeam:UpdateVotes")
    
    -- Update with latest team size
    local playercount, _, botcount = self:GetNumPlayers()
    local humancount = playercount - botcount
    self.stalemateVoteManager:SetNumPlayers(humancount)
    
    -- Give up when enough votes
    if self.concedeVoteManager:GetVotePassed() then
    
        self.concedeVoteManager:Reset()
        self.conceded = true
        Server.SendNetworkMessage("Stalemate", { teamNumber = self:GetTeamNumber() })
        
    elseif self.concedeVoteManager:GetVoteElapsed(Shared.GetTime()) then
        self.concedeVoteManager:Reset()
    end

    
end


local kVoteStalemateCastMessage =
{
    voterName = string.format("string (%d)", kMaxNameLength * 4 ),
    votesMoreNeeded = "integer (0 to 85)"
}


Shared.RegisterNetworkMessage("VoteStalemateCast", kVoteStalemateCastMessage)
