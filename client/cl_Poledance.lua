lib.locale()

local PoleDancing = false

for i = 1, #Config.PoleDance do
    local PoleDance = lib.zones.sphere({
        coords = Config.PoleDance[i].coords,
        radius = Config.PoleDance[i].radius,
        debug = Config.Debug,
        inside = function()
            if IsControlJustReleased(0, 38) then
                if Config.Debug then
                    print('You pressed E to poledance')
                end
                if not PoleDancing then
                    PoleDancing = true
                    print('true')
                    lib.requestAnimDict('mini@strip_club@pole_dance@pole_dance'..Config.PoleDance[i].type)
                    local scene = NetworkCreateSynchronisedScene(Config.PoleDance[i].coords, vector3(0.0, 0.0, 0.0), 2, false, false, 1065353216, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance'..Config.PoleDance[i].type, 'pd_dance_0'..Config.PoleDance[i].type, 1.5, -4.0, 1, 1, 1148846080, 0)
                    NetworkStartSynchronisedScene(scene)
                    --LoadDict('mini@strip_club@pole_dance@pole_dance' .. Config.PoleDance[i].type)
                    --local scene = NetworkCreateSynchronisedScene(Config.PoleDance[i].coords, vector3(0.0, 0.0, 0.0), 2, false, false, 1065353216, 0, 1.3)
                    --NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance' .. Config.PoleDance[i].type, 'pd_dance_0' .. Config.PoleDance[i].type, 1.5, -4.0, 1, 1, 1148846080, 0)
                    --NetworkStartSynchronisedScene(scene)
                    TextUIShow(locale("cancel_poledance"))
                    Citizen.Wait(50000)
                    TextUIHide()
                else
                    if Config.debug then
                        print('you tried dance when you dancing')
                    end
                end
            end
            if PoleDancing then
                if IsControlJustReleased(0, 74) then
                    ClearPedTasks(PlayerPedId())
                    PoleDancing = false
                    TextUIHide()
                end
            end
        end,
        onEnter = function()
            if Config.Debug then
                print('You was in PolyZone')
            end
            TextUIShow(locale("start_poledance"))
        end,
        onExit = function()
            TextUIHide()
        end
    })
end