Script.Load("lua/NetworkMessages.lua")

local kVoteStalemateCastMessage =
{
    voterName = string.format("string (%d)", kMaxNameLength * 4 ),
    votesMoreNeeded = "integer (0 to 64)"
}

local kTeamsStalemateMessage =
{
    teamNumber = string.format("integer (-1 to %d)", kRandomTeamType)
}


Shared.RegisterNetworkMessage("VoteStalemateCast", kVoteStalemateCastMessage)
Shared.RegisterNetworkMessage("TeamsStalemate", kTeamsStalemateMessage)