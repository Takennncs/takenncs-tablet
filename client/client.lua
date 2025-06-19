local QBCore = exports['qb-core']:GetCoreObject()

local guiEnabled, tablet = false, false
local tabletDict, tabletAnim = "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base"
local tabletProp, tabletBone = "prop_cs_tablet", 60309
local tabletOffset, tabletRot = vector3(0.03, 0.002, -0.0), vector3(10.0, 160.0, 0.0)

-- Lisatud mitmed müügikohad
local sellLocations = {
    vector3(36.13, -1000.63, 29.42),
    vector3(141.35, -1057.21, 29.19),
    vector3(-713.63, -886.67, 23.80),
    vector3(-794.65, -963.15, 15.18),
    vector3(-1327.87, -561.08, 30.41),
    vector3(-1581.57, -467.67, 36.03),
    vector3(261.11, 279.51, 105.65),
    vector3(320.26, 98.57, 99.69),
    vector3(-208.02, -1632.36, 33.87),
    vector3(-93.21, -1592.04, 31.61),
    vector3(-13.09, -1531.72, 29.83),
    vector3(-11.91, -1478.34, 30.50),
    vector3(-1.84, -1400.42, 29.27),
    vector3(-1171.45, -901.26, 13.78),
    vector3(-0.93, -1828.14, 25.22),
    vector3(96.65, -1808.06, 27.08),
    vector3(66.38, -1924.31, 21.44),
    vector3(247.15, -1996.54, 20.20),
    vector3(330.99, -2011.65, 22.14),
    vector3(970.00, -191.61, 73.08),
    vector3(837.67, -128.13, 79.34),
    vector3(963.74, -117.48, 74.35),
    vector3(1246.93, -713.00, 62.89),
    vector3(1216.63, -652.28, 64.10),
    vector3(1223.51, -503.07, 66.40),
    vector3(1404.66, -1530.25, 58.32),
    vector3(1348.96, -1554.08, 53.78),
    vector3(1225.25, -1600.42, 52.11)
}

local sellNpc = nil
local isSelling = false
local CurrentItemBeingSold = nil
local currentSellLocation = nil

local function toggleTab(toggle)
    if toggle and not tablet then
        tablet = true
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            Citizen.CreateThread(function()
                RequestAnimDict(tabletDict) while not HasAnimDictLoaded(tabletDict) do Wait(150) end
                RequestModel(tabletProp) while not HasModelLoaded(tabletProp) do Wait(150) end

                local ped = PlayerPedId()
                local obj = CreateObject(tabletProp, 0, 0, 0, true, true, false)
                AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, tabletBone), tabletOffset.x, tabletOffset.y, tabletOffset.z,
                    tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
                SetModelAsNoLongerNeeded(tabletProp)

                while tablet do
                    Wait(100)
                    if not IsEntityPlayingAnim(ped, tabletDict, tabletAnim, 3) then
                        TaskPlayAnim(ped, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                    end
                end

                ClearPedSecondaryTask(ped)
                Wait(450)
                DetachEntity(obj, true, false)
                DeleteEntity(obj)
            end)
        end
    else
        tablet = false
    end
end

local function showTablet()
    SendNUIMessage({ action = "showTablet", data = "anywhere" })
    guiEnabled = true
    SetNuiFocus(true, true)
    toggleTab(true)
end

RegisterNetEvent('takenncs-tablet:client:openTablet', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    for _, item in pairs(PlayerData.items) do
        if item.name == 'selltablet' then
            showTablet()
            requestLeaderboard()
            return
        end
    end
    TriggerEvent('QBCore:Notify', 'Sul pole tabletit inventuuris!', 'error')
end)

RegisterNUICallback("disableFocus", function(_, cb)
    if guiEnabled then
        SetNuiFocus(false, false)
        guiEnabled = false
        toggleTab(false)
    end
    cb({})
end)

local function cleanupNpc()
    if sellNpc and DoesEntityExist(sellNpc) then
        DeleteEntity(sellNpc)
        sellNpc = nil
        isSelling = false
        CurrentItemBeingSold = nil
        currentSellLocation = nil
    end
end
-- Add this variable at the top with other local variables
local blip = nil

-- Modify the sellStart event to store the blip in the variable
RegisterNetEvent('takenncs-tablet:sellStart', function(itemName)
    if isSelling then
        TriggerEvent('QBCore:Notify', 'Sale is already in progress!', 'error')
        return
    end

    isSelling = true
    CurrentItemBeingSold = itemName

    -- Randomly select a sales location
    currentSellLocation = sellLocations[math.random(#sellLocations)]

    -- Add blip for the sales location and store it
    if blip then RemoveBlip(blip) end -- Remove existing blip if any
    blip = AddBlipForCoord(currentSellLocation)
    SetBlipSprite(blip, 500)
    SetBlipColour(blip, 2)
    SetBlipScale(blip, 0.9)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Buyer')
    EndTextCommandSetBlipName(blip)

    lib.requestModel('a_m_m_business_01')
    sellNpc = CreatePed(0, 'a_m_m_business_01', currentSellLocation.x, currentSellLocation.y, currentSellLocation.z - 1.0, 0.0, false, true)
    FreezeEntityPosition(sellNpc, true)
    SetEntityInvincible(sellNpc, true)
    SetBlockingOfNonTemporaryEvents(sellNpc, true)

    exports.ox_target:addLocalEntity(sellNpc, {
        {
            name = 'sell_drug_items',
            icon = 'fas fa-dollar-sign',
            label = 'Sell suspicious items',
            onSelect = function()
                if not isSelling then
                    TriggerEvent('QBCore:Notify', 'You haven\'t started a sale!', 'error')
                    return
                end
                TriggerEvent('takenncs-tablet:doSale')
            end
        }
    })

    TriggerEvent('QBCore:Notify', 'Sale started! Go to the location on the map.', 'success')
end)

-- Modify the cleanupNpc function to also remove the blip
local function cleanupNpc()
    if sellNpc and DoesEntityExist(sellNpc) then
        DeleteEntity(sellNpc)
        sellNpc = nil
    end
    if blip then
        RemoveBlip(blip)
        blip = nil
    end
    isSelling = false
    CurrentItemBeingSold = nil
    currentSellLocation = nil
end

RegisterNetEvent('takenncs-tablet:doSale', function()
    if not isSelling or not CurrentItemBeingSold then
        TriggerEvent('QBCore:Notify', 'Sul ei ole müüki alustatud!', 'error')
        return
    end

    local success = lib.progressBar({
        duration = 4000,
        label = 'Tehing käib...',
        canCancel = false,
        disable = { move = true, car = true, combat = true }
    })

    if success then
        RequestAnimDict("mp_common")
        while not HasAnimDictLoaded("mp_common") do Wait(10) end
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, -8.0, 2000, 49, 0, false, false, false)

        TriggerServerEvent('takenncs-tablet:finishSale', CurrentItemBeingSold)
        cleanupNpc()
    else
        TriggerEvent('QBCore:Notify', 'Tehing katkestati!', 'error')
    end
end)

RegisterNUICallback("startDrugSale", function(data, cb)
    local itemToSell = data.item
    if not itemToSell then
        TriggerEvent('QBCore:Notify', 'Puudub müügi objekt!', 'error')
        cb({})
        return
    end

    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.items then
        TriggerEvent('QBCore:Notify', 'Inventuur puudub!', 'error')
        cb({})
        return
    end

    local hasItem = false

    for _, item in pairs(PlayerData.items) do
        local amount = item.amount or item.count or 0
        if item and item.name == itemToSell and amount > 0 then
            hasItem = true
            break
        end
    end

    if hasItem then
        TriggerEvent("takenncs-tablet:sellStart", itemToSell)
    else
        TriggerEvent('QBCore:Notify', 'Sul ei ole seda eset müügiks!', 'error')
    end

    cb({})
end)

function requestLeaderboard()
    QBCore.Functions.TriggerCallback('takenncs-tablet:getLeaderboard', function(data)
        SendNUIMessage({
            action = 'updateLeaderboard',
            leaderboard = data
        })
    end)
end

function tableContains(tbl, val)
    for _, v in pairs(tbl) do
        if v == val then return true end
    end
    return false
end
-- Shop (buy)
