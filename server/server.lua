local QBCore = exports['qb-core']:GetCoreObject()

-- Andmebaasi loomine
MySQL.ready(function()
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS drug_sales_leaderboard (
            id INT AUTO_INCREMENT PRIMARY KEY,
            identifier VARCHAR(64) NOT NULL UNIQUE,
            playerName VARCHAR(50) NOT NULL,
            points INT DEFAULT 0,
            soldItems INT DEFAULT 0,
            lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        )
    ]], {}, function()
        print("[selltablet] @takenncs Tableti süsteem edukalt aktiveeritud!")
    end)
end)

local function updateLeaderboard(identifier, playerName, pointsToAdd, itemsSold)
    if not identifier or identifier == "" then
        print("[selltablet] VIGA: identifier on tühi või nil, leaderboardit ei uuendata.")
        return
    end

    MySQL.query('SELECT * FROM drug_sales_leaderboard WHERE identifier = ?', {identifier}, function(result)
        if result and result[1] then
            MySQL.execute('UPDATE drug_sales_leaderboard SET points = points + ?, soldItems = soldItems + ?, lastUpdated = CURRENT_TIMESTAMP WHERE identifier = ?', 
                {pointsToAdd, itemsSold, identifier}, function(affectedRows)
                    print("[selltablet] Leaderboard uuendatud, mõjutatud read: " .. tostring(affectedRows))
                end)
        else
            MySQL.execute('INSERT INTO drug_sales_leaderboard (identifier, playerName, points, soldItems) VALUES (?, ?, ?, ?)', 
                {identifier, playerName, pointsToAdd, itemsSold}, function(insertId)
                    print("[selltablet] Leaderboardi uus kirje lisatud, ID: " .. tostring(insertId))
                end)
        end
    end)
end

-- Leaderboardi andmete tagastamine
QBCore.Functions.CreateCallback('takenncs-tablet:getLeaderboard', function(source, cb)
    MySQL.query('SELECT playerName, points, soldItems FROM drug_sales_leaderboard ORDER BY points DESC LIMIT 10', {}, function(result)
        cb(result or {})
    end)
end)

-- Itemi kasutamine (avab tableti)
QBCore.Functions.CreateUseableItem('selltablet', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('takenncs-tablet:client:openTablet', source)
    end
end)

-- Müügi alustamine
QBCore.Functions.CreateCallback('takenncs-tablet:startDrugSale', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then 
        cb({ success = false, message = "Mängijat ei leitud" })
        return
    end

    local sellableItems = {
        "phone", "coke_bag", "meth_bag", "lsd_bottle",
        "stolencoffee", "stolencomputer", "stolenmicrowave", "stolenmusic",
        "stolenpsp", "stolentv", "toiteblokk", "videokaart",
        "stolenmonitor", "stolenshoes", "stolenlawnmower", "stolenhandbag",
        "stolengameboy", "stolendrill", "stolenlamp", "stolenradio"
    }
    for _, itemName in ipairs(sellableItems) do
        local item = Player.Functions.GetItemByName(itemName)
        if item and item.amount > 0 then
            TriggerClientEvent('takenncs-tablet:sellStart', source, itemName)
            cb({ success = true, message = "Müük alustatud!" })
            return
        end
    end

    cb({ success = false, message = "Sul pole müüdavat eset!" })
end)

-- Müügi lõpetamine
RegisterServerEvent('takenncs-tablet:finishSale')
AddEventHandler('takenncs-tablet:finishSale', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        print("[selltablet] Müüja ei leitud serverist.")
        return
    end

    local identifier = Player.PlayerData.citizenid or Player.PlayerData.identifier or Player.PlayerData.license
    if not identifier or identifier == "" then
        print("[selltablet] VIGA: Mängija identifier on tühi või nil, ei saa leaderboardi uuendada.")
        return
    end

    local sellableItems = {
        phone = {points = 50, cash = 100, label = "Telefon"},
        coke_bag = {points = 100, cash = 250, label = "Kokaiinipakk"},
        meth_bag = {points = 120, cash = 275, label = "Metamfetamiini pakk"},
        lsd_bottle = {points = 150, cash = 300, label = "LSD pudel"},
        stolenbrokengoods = {points = 150, cash = 300, label = "Katkine telefon (P)"},
        stolencomputer = {points = 150, cash = 300, label = "Arvuti (P)"},
        stolenmicrowave = {points = 150, cash = 300, label = "Mikrolaineahi (P)"},
        stolenmusic = {points = 150, cash = 300, label = "Muusikakeskus (P)"},
        stolenpsp = {points = 150, cash = 300, label = "PSP (P)"},
        stolentv = {points = 150, cash = 300, label = "Televiisor (P)"},
        toiteblokk = {points = 150, cash = 300, label = "Toiteplokk (P)"},
        videokaart = {points = 150, cash = 300, label = "Nvidia 1080TI (P)"},
        stolenmonitor = {points = 150, cash = 300, label = "Monitor (P)"},
        stolenshoes = {points = 150, cash = 300, label = "Jordan 4 (P)"},
        stolenlawnmower = {points = 150, cash = 300, label = "Lawn Mower (P)"},
        stolenhandbag = {points = 150, cash = 300, label = "Käekott (P)"},
        stolengameboy = {points = 150, cash = 300, label = "Gameboy (P)"},
        stolendrill = {points = 150, cash = 300, label = "Trell (P)"},
        stolenlamp = {points = 150, cash = 300, label = "Laualamp (P)"},
        stolenradio = {points = 150, cash = 300, label = "Raadio (P)"}
    }

    for itemName, data in pairs(sellableItems) do
        local item = Player.Functions.GetItemByName(itemName)
        if item and item.amount > 0 then
            Player.Functions.RemoveItem(itemName, 1)
            Player.Functions.AddMoney('cash', data.cash, "drug-sale")
            print(("[selltablet] %s müüdud, +$%d, +%d punkti"):format(data.label, data.cash, data.points))

            updateLeaderboard(identifier, Player.PlayerData.name, data.points, 1)

            TriggerClientEvent('takenncs-tablet:updateLeaderboard', -1)
            TriggerClientEvent('QBCore:Notify', src, ("Müüdud %s! Sa said $%d ja %d punkti"):format(data.label, data.cash, data.points), "success")
            return
        end
    end

    TriggerClientEvent('QBCore:Notify', src, "Sul ei ole midagi müüa", "error")
end)

-- Kontrolli itemit
QBCore.Functions.CreateCallback('takenncs-tablet:checkItem', function(source, cb, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player and Player.Functions.GetItemByName(itemName)
    cb(item ~= nil and item.amount > 0)
end)

-- Punktide pärimine
RegisterNUICallback('getPlayerPoints', function(_, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        cb({ points = 0 })
        return
    end

    local citizenid = Player.PlayerData.citizenid

    MySQL.query('SELECT points FROM drug_sales_leaderboard WHERE identifier = ?', { citizenid }, function(result)
        local points = (result[1] and result[1].points) or 0
        cb({ points = points })
    end)
end)

-- Ostu callback
RegisterNUICallback('buyItemWithPoints', function(data, cb)
    local src = source
    local itemId = data.item
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        cb({ success = false, error = "Mängijat ei leitud" })
        return
    end

    local citizenid = Player.PlayerData.citizenid

    local shopItems = {
        nitro = { price = 5, item = "nitro", label = "Nitro" },
        repairkit = { price = 3, item = "repairkit", label = "Paranduskomplekt" },
        armor = { price = 4, item = "armor", label = "Kevlarvest" }
    }

    local selectedItem = shopItems[itemId]
    if not selectedItem then
        cb({ success = false, error = "Ese puudub" })
        return
    end

    MySQL.query('SELECT points FROM drug_sales_leaderboard WHERE identifier = ?', { citizenid }, function(result)
        if not result or #result == 0 then
            cb({ success = false, error = "Punkte ei leitud" })
            return
        end

        local currentPoints = tonumber(result[1].points)
        if currentPoints < selectedItem.price then
            cb({ success = false, error = "Pole piisavalt punkte" })
            return
        end

        if not exports.ox_inventory:CanCarryItem(src, selectedItem.item, 1) then
            cb({ success = false, error = "Inventar on täis" })
            return
        end

        MySQL.update('UPDATE drug_sales_leaderboard SET points = points - ? WHERE identifier = ?', { selectedItem.price, citizenid }, function(affected)
            if affected == 0 then
                cb({ success = false, error = "Andmebaasi viga" })
                return
            end

            exports.ox_inventory:AddItem(src, selectedItem.item, 1)
            cb({ success = true, newPoints = currentPoints - selectedItem.price })
        end)
    end)
end)
