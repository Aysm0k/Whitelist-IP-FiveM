Whitelist = {}

RegisterCommand("rconreloadwl", function(source, args, rawCommand)
    for i = 0, #Whitelist do
        Whitelist[i] = nil
    end

    initWhitelist()
    RconPrint("[Whitelist] Un joueur est entrain de se connecter.")
end, true)


AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
        deferrals.defer()
        local source = source
        ExecuteCommand("rconreloadwl")
        deferrals.update("Collecte de vos informations...")
        Citizen.Wait(300)
        
        local ip = GetPlayerEndpoint(source)
        if not has_value(Whitelist, ip) then
            deferrals.done('Votre IP n\'est pas whitelist. Merci de vous rendre sur notre discord.')
                CancelEvent()
                return
        else 
            deferrals.done()
        end
end)

function initWhitelist()
    MySQL.Async.fetchAll('SELECT ip FROM whitelist', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(Whitelist, tostring(result[i].ip):lower())
        end
    end)
end
        
function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    
    return false
end


MySQL.ready(function()
    initWhitelist()
end)