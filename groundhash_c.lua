----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(2, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

function GetGroundHash(ped)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local num = StartShapeTestCapsule(pos.x,pos.y,pos.z+4,pos.x,pos.y,pos.z-2.0, 2, 1, ped, 7)
    -- local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(num) -- entityHit returns hash
    local arg1, arg2, arg3, arg4, arg5 = GetShapeTestResult(num) 
    return arg5 -- entityHit
end

RegisterNetEvent('groundhashtool:checkhash', function()
    CreateThread(function()
        local x = 0.90 -- Change draw text location
        local y = 0.03 -- Change draw text location
        hashOn = not hashOn
        while hashOn do
            local hash = GetGroundHash(ped)
            Wait(0)
            -- content, font, colour(rgb), scale, x position, y position
            Draw2DText('Ground Hash:', 4, {77, 203, 195}, 0.4, x + 0.0, y + 0.0)
            Draw2DText(string.format(hash), 4, {255, 255, 255}, 0.4, x + 0.050, y + 0.000)
        end
    end)
end)

CreateThread(function() -- Just adds chat suggestion for commands mostly pointless
    TriggerEvent('chat:addSuggestion', '/checkgroundhash', 'Toggles ground hash draw text')
end)
 
