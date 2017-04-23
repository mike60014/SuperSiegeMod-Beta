Script.Load("lua/InsightNetworkMessages_Client.lua")
Script.Load("lua/NetworkMessages_Client.lua")


function OnVoteStalemateCast(message)
    local text = string.format(Locale.ResolveString("VOTE_STALEMATE_BROADCAST"), message.voterName, message.votesMoreNeeded)
    ChatUI_AddSystemMessage(text)
end

function OnTeamsStalemate(message)
        ChatUI_AddSystemMessage(Locale.ResolveString("TEAM_MARINES_STALEMATE"))
        ChatUI_AddSystemMessage(Locale.ResolveString("TEAM_ALIENS_STALEMATE"))
end

Client.HookNetworkMessage("VoteStalemateCast", OnVoteStalemateCast)
Client.HookNetworkMessage("TeamsStalemate", OnTeamsStalemate)