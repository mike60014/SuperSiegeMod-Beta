-- lua\StalemateSequence.lua

class 'StalemateSequence'

if Server then
    
    local function Polar2Cartesian(origin, distance, height, theta)
        return Vector(distance * math.sin(theta), height, distance * math.cos(theta)) + origin
    end
    
    local function FindClearOrbitArea(targetPoint, distance, height, arcSweep)
        
        -- check kStalemateNumAnglesToCheck sample points in a circle around the targetPoint, cache the result
        -- of the traces, then search for enough consecutive successful traces to contain arcSweep radians,
        -- make a table of all the possible angles, then pick a random one.  Return true and the sweep.  If a
        -- suitable sweep isn't found, return false and the table of trace results, so we have the data to
        -- fall-back on a static camera as a very very last result.
        
        local traceResult = {}
        local radPerIndex = (math.pi * 2) / kStalemateNumAnglesToCheck
        for i=0, kStalemateNumAnglesToCheck-1 do -- zero based!!!
            local theta = i * radPerIndex
            local camPoint = Polar2Cartesian(targetPoint, distance, height, theta)
            local trace = Shared.TraceRay(targetPoint, camPoint, CollisionRep.Move, PhysicsMask.Movement, EntityFilterAll())
            if trace.fraction == 1 then -- successful trace
                traceResult[i] = true
                
            else -- obstruction
                traceResult[i] = false
            end
        end
        
        -- # of consecutive trace points required at minimum for arcSweep radians to be contained within
        -- if a clear arc is much larger than arcSweep, there will be several suitable arcs contained inside it,
        -- we take this into account.  We loop around the circle more than 360 degrees to ensure that all arcs are
        -- accounted for (eg. an arc between 359 degrees and 2 degrees would be discounted otherwise).
        local suitableArcs = {} -- 'true' for starting indexes of arcs found to be suitable.
        local minIndicesPerArc = math.ceil(arcSweep / radPerIndex) + 1 -- +1 for a little extra room.
        local startIndex = nil
        for i=0, (kStalemateNumAnglesToCheck-1) + minIndicesPerArc do -- zero based!!!
            if traceResult[i] == true then
                if not startIndex then
                    startIndex = i
                end
            else
                if startIndex then
                    while (i - startIndex) >= minIndicesPerArc do
                        suitableArcs[startIndex % kStalemateNumAnglesToCheck] = true
                        startIndex = startIndex + 1
                    end
                    
                    startIndex = nil
                end
            end
        end
        if startIndex then  -- the loop terminated mid-arc, due to the circle being completed, rather than
                            -- encountering an obstacle
            local i = (kStalemateNumAnglesToCheck-1) + minIndicesPerArc
            while (i - startIndex) >= minIndicesPerArc do
                suitableArcs[startIndex % kStalemateNumAnglesToCheck] = true
                startIndex = startIndex + 1
            end
        end
        
        -- if we haven't had any suitable arcs, return false with the table of traces, for something to fall back on.
        -- if the traceResult table has no suitable traces, return nil.
        if #suitableArcs == 0 then
            for i=1, #traceResult do
                if traceResult[i] == true then
                    return false, traceResult -- not a typo, return entire table if there's any redeeming data in it.
                end
            end
            
            return false, nil
        end
        
        -- if we did find a suitable arc, return true and a random one from the table.
        local factor = 2
        local pick = nil
        for index, _ in pairs(suitableArcs) do
            if not pick then
                pick = index
            else
                if math.random() < (1/factor) then -- each arc has an equal chance of being picked
                    pick = index
                    factor = factor + 1
                end
            end
        end
        return true, pick
    end
    
    local function FindSuitableCameraArc(targetPoint, duration, speed)
        
        if not targetPoint then
            return 0, nil, nil
        end
        
        -- we've got a table of different settings, in descending order of preferred-ness.  Search through each
        -- pairing of settings to find a suitable camera position.  Suitable means it can animate in a smooth arc
        -- for the given duration (at a set speed) without penetrating the terrain or any object with "move"
        -- collision.
        
        local traceTables = {}
        
        for settingsIndex=1, #kStalemateIdealDistance do
            local distance = kStalemateIdealDistance[settingsIndex]
            local height = kStalemateIdealHeightOffset[settingsIndex]
            
            local arcSweep = (speed * duration) / distance -- measure in radians this arc sweeps
            local angularVelocity = speed / distance
            
            -- we need to find a slice of this circle that is unobstructed that covers arcSweep radians.
            local result, extra = FindClearOrbitArea(targetPoint, distance, height, arcSweep)
            
            if result == false then
                -- couldn't find any clear arcs.
                if extra ~= nil then -- there were some clear traces, so store them later to use as a last resort.
                    traceTables[settingsIndex] = extra
                end
            else
                -- successfully found an arc.  Return 'extra' value is the starting index of the chosen arc.
                return angularVelocity, extra, settingsIndex
            end
            
        end
        
        -- if we made it to here, then none of the height/distance settings resulted in even a single usable camera arc.
        -- We're getting desperate, so we'll look for stationary camera positions from the traces to use.
        for settingsIndex=1, #kStalemateIdealDistance do
            
            local traces = traceTables[settingsIndex]
            local pickedTrace = nil
            local factor = 2
            if traces then -- might be nil if no traces were successful
                for traceIndex=0, #traces-1 do -- zero based!!!
                    if traces[traceIndex] == true then -- pick a random trace from the successful traces -- if any!
                        if not pickedTrace then
                            pickedTrace = traceIndex
                        else
                            if math.random() < (1/factor) then
                                pickedTrace = traceIndex
                                factor = factor + 1
                            end
                        end
                    end
                end
            end
            
            if pickedTrace then
                return 0, pickedTrace, settingsIndex
            end
            
        end
        
        -- This should really never happen...  If we did make it this far, it means there have been absolutely ZERO
        -- successful traces.  At this point, let's just give up on finding a good observation point for this position.
        return 0, nil, nil
    end
    
    local function GetTeamStuffNearPosition(teamNumber, position, range)
        
        -- returns a table of all the entities (except command structure) owned by a team within
        -- a given radius of the given point.
        local teamEnts = GetEntitiesWithMixinForTeam("Live", teamNumber)
        local ents = {}
        local rangeSq = range*range
        for _, ent in pairs(teamEnts) do
            if (not ent:isa("CommandStructure")) and (not ent:isa("PowerPoint")) and ent:GetIsAlive()
            and (ent:GetOrigin()-position):GetLengthSquared() <= rangeSq then
                table.insert(ents, ent)
            end
        end
        
        -- Get powernodes for marine team
        if teamNumber == kMarineTeamType then
            local powerPoints = EntityListToTable(Shared.GetEntitiesWithClassname("PowerPoint"))
            for _, ent in pairs(powerPoints) do
                if (ent:GetOrigin()-position):GetLengthSquared() <= rangeSq then
                    table.insert(ents, ent)
                end
            end
        end
        
        return ents
        
    end
    
    local function GetTeamsRoomStuff(teamNumber, locationName)
    
        -- returns a table of all the entities (except command structures) owned by a team in the
        -- specified location.  Also returns the number of command structures in the room, so we
        -- can take the apppropriate action.
        local teamEnts = GetEntitiesWithMixinForTeam("Live", teamNumber)
        local inRoomEnts = {}
        local csCount = 0
        for _,ent in pairs(teamEnts) do
            if ent:isa("CommandStructure") and ent:GetIsAlive() and ent:GetLocationName() == locationName then
                csCount = csCount + 1
            elseif not ent:isa("PowerPoint") then
                if ent.GetLocationName and ent:GetLocationName() == locationName then
                    table.insert(inRoomEnts, ent)
                end
            end
        end
        
        -- Get powernodes for marine team
        if teamNumber == kMarineTeamType then
            local powerPoints = EntityListToTable(Shared.GetEntitiesWithClassname("PowerPoint"))
            for _, ent in pairs(powerPoints) do
                if ent:GetLocationName() == locationName then
                    table.insert(inRoomEnts, ent)
                end
            end
        end
        
        return inRoomEnts, csCount
        
    end
    
    function GetStalemateSequenceActive()
        if not gStalemateSequence then
            return false
        end
        
        if not gStalemateSequence.stalemateStartTime then
            return false
        end
        
        return true
    end
    
    function GetStalemateSequence()
        if not gStalemateSequence then
            gStalemateSequence = StalemateSequence()
        end
        return gStalemateSequence
    end

    function DoStalemateSequence(concedingTeam)
        
        gStalemateSequence = StalemateSequence()
        
        -- logout commanders
        GetGamerules():LogoutCommanders()
        
        -- Compile a list of structures we'll focus on during the stalemate sequence.
        -- We'll show the conceding team's command structure being destroyed, along
        -- with everything else in the room.  If they have multiple command structures
        -- we'll flip through each one being destroyed, along with the rooms contents
        -- and any players of that team left in the room.
        local structures = GetEntitiesForTeam("CommandStructure", concedingTeam:GetTeamNumber())
        gStalemateSequence.stalemateRooms = {}
        for _, s in pairs(structures) do
            table.insert(gStalemateSequence.stalemateRooms, s:GetLocationName())
        end
        
        -- We'll show the stalemate sequences to (non-bot) players of both teams, as well as spectators.
        gStalemateSequence.stalemateClientIds = {}
        local function collectPlayer(player)
            local client = player:GetClient()
            if client and (not client:GetIsVirtual()) then
                table.insert(gStalemateSequence.stalemateClientIds, player:GetClient():GetId())
            end
        end
        
        GetGamerules():GetTeam(kTeam1Index):ForEachPlayer(collectPlayer)
        GetGamerules():GetTeam(kTeam2Index):ForEachPlayer(collectPlayer)
        GetGamerules():GetTeam(kSpectatorIndex):ForEachPlayer(collectPlayer)
        
        GetGamerules():GetTeam(kTeam1Index):ClearRespawnQueue()
        GetGamerules():GetTeam(kTeam2Index):ClearRespawnQueue()
        
        gStalemateSequence.stalemateStartTime = Shared.GetTime() -- start it immediately
        gStalemateSequence.concedingTeamNum = concedingTeam:GetTeamNumber()
        
    end
    
    function StalemateSequence:AddPlayer(player)
        
        -- ignore bots
        if player:GetClient():GetIsVirtual() then
            return
        end
        
        -- attempt to add client id to table of client ids that are observing stalemate sequence.
        -- if it was already in the table, break off and do nothing.
        local wasAdded = table.insertunique(self.stalemateClientIds, player:GetClient():GetId())
        if not wasAdded then
            return
        end
        
        -- add player into stalemate sequence
        player:StartStalemateSequence(self.settings)
        
    end
    
    local function KillIfNotRecycled(ent)
        if HasMixin(ent, "Recycle") and ent:GetIsRecycled() then
            return
        end
        
        ent:Kill()
    end
    
    function StalemateSequence:UpdateStalemateSequence()
        
        local now = Shared.GetTime()
        
        if not self.stalemateRooms then
            return
        end
        
        if not self.stalemateClientIds then
            return
        end
        
        if not self.stalemateStartTime then
            return
        end
        
        -- kill command structure and room stuff if it's at the proper time
        if self.csKillTime and self.csKillTime <= now then
            self.csKillTime = nil
            
            local commandStructure = Shared.GetEntity(self.csCommandStructureId)
            -- kill room stuff... in the rare event there's more than one command structure in a room (eg discovery),
            -- just kill stuff in a large radius around the command structure.  Clear the room with the other CS.
            local stuffInRoom, csCount = GetTeamsRoomStuff(self.concedingTeamNum, self.csRoomName)
            if csCount <= 1 then
                -- kill everyting in the room belonging to this team.
                for _,ent in pairs(stuffInRoom) do
                    if ent:isa("PowerPoint") then
                        if commandStructure and commandStructure:isa("CommandStation") then
                            -- Only destroy power nodes if the marines stalemated.
                            KillIfNotRecycled(ent)
                        end
                    elseif HasMixin(ent, "Live") and ent:GetIsAlive() then
                        KillIfNotRecycled(ent)
                    end
                end
            else
                -- just kill the stuff in a large radius around cc.  This is a rare circumstance where there's more
                -- than one TP in a room, and they're occupied.
                local stuffNearTp = GetTeamStuffNearPosition(self.concedingTeamNum, self.csTechPoint:GetOrigin(), 15)
                for _,ent in pairs(stuffNearTp) do
                    KillIfNotRecycled(ent)
                end
            end
            
            -- kill command station
            if commandStructure and HasMixin(commandStructure, "Live") and commandStructure:GetIsAlive() then
                KillIfNotRecycled(commandStructure)
            end
        end
        
        local montageStartTime = self.stalemateStartTime + kStalemateTimeBeforeMontage
        local montageEndTime = montageStartTime + kStalemateMontageDuration
        
        -- start stalemate sequence after a certain amount of time has elapsed.
        if now > montageStartTime then
            
            if not self.stalemateNextUpdateTime or now > self.stalemateNextUpdateTime then
            
                if #self.stalemateRooms == 0 then -- stalemate sequence is over, end the sequence.
                    self.stalemateStartTime = nil
                    self.stalemateRooms = nil
                    gStalemateSequence = nil
                    for _,clientId in ipairs(self.stalemateClientIds) do
                        local client = Server.GetClientById(clientId)
                        if client then
                            local player = client:GetControllingPlayer()
                            if player then
                                player:ClearStalemateSequence()
                            end
                        end
                    end
                else -- still some structures left to destroy
                    local montageRemaining = montageEndTime - now
                    local mPerStruct = montageRemaining / #self.stalemateRooms
                    
                    self.csRoomName = self.stalemateRooms[1]
                    self.csCommandStructureId = nil
                    self.csTechPoint = nil
                    self.csKillTime = now + (mPerStruct*0.25)
                    
                    local targetPoint = nil
                    local techPoints = EntityListToTable(Shared.GetEntitiesWithClassname("TechPoint"))
                    local factor = 1
                    for i=1, #techPoints do
                        if techPoints[i]:GetLocationName() == self.csRoomName then
                            if (factor == 1) or (math.random() < (1/factor)) then
                                local attached = techPoints[i]:GetAttached()
                                if attached and HasMixin(attached, "Live") and attached:GetIsAlive() and ( not (HasMixin(attached, "Recycle") and attached:GetIsRecycled())) then
                                    factor = factor + 1
                                    targetPoint = attached:GetEngagementPoint()
                                    self.csCommandStructureId = attached:GetId()
                                end
                                self.csTechPoint = techPoints[i]
                            end
                        end
                    end
                    
                    table.remove(self.stalemateRooms, 1)
                    
                    -- find a suitable camera arc to animate along
                    local speed = kStalemateIdealCameraSpeed
                    if #self.stalemateRooms == 0 then
                        -- if it's the last structure, it'll have a lot of extra time on the end
                        mPerStruct = mPerStruct + kStalemateTimeAfterMontage
                        speed = speed/2 -- slower than others
                    end
                    
                    local angularVelocity, result, settingsIndex = FindSuitableCameraArc(targetPoint, mPerStruct, speed)
                    if result then
                        local startAngle = result * ((2*math.pi)/kStalemateNumAnglesToCheck)
                        self.settings = { -- store settings in self so we can access them at any time, ie for late-joining players
                            startAngle = startAngle,
                            angularVelocity = angularVelocity,
                            targetPoint = targetPoint,
                            startTime = now,
                            settingsIndex = settingsIndex,
                        }
                        
                        for _,clientId in ipairs(self.stalemateClientIds) do
                            local client = Server.GetClientById(clientId)
                            if client then
                                local player = client:GetPlayer()
                                if player then
                                    player:StartStalemateSequence(self.settings)
                                end
                            end
                        end
                        
                        self.stalemateNextUpdateTime = now + mPerStruct
                    else
                        -- if result is nil, we couldn't find any suitable camera positions to show this tech point
                        -- being destroyed.  Therefore, we'll just skip it.
                        self.stalemateNextUpdateTime = nil
                    end
                end
            end
        end
    end
end
