 --[[
    Game developed by @math
    Designed by @hug / @drouethug
    Game thought out and produced with both our hearts ❤️

    Join the game with the link: https://app.cu.bzh/?worldID=a98f64ac-2e1f-44ae-9361-48b4e3eb475b
 ]]

Config = {
    Map = "drouethug.ct_map",
    Items = {
        "drouethug.ct_map",
        "drouethug.ct_grass1",
        "drouethug.ct_tree1",

        "drouethug.ct_atm",
        "drouethug.ct_atm_empty",
        "drouethug.ct_atm_overflow",
        "drouethug.ct_workbench",

        "drouethug.ct_collect",
        "drouethug.ct_exclamation",

        "drouethug.ct_building1",
        "drouethug.ct_building2",
        "drouethug.ct_building3",

        "drouethug.ct_house1",
        "drouethug.ct_house2",
        "drouethug.ct_house3",

        "drouethug.ct_school1",
        "drouethug.ct_school2",
        "drouethug.ct_school3a",
        "drouethug.ct_school3b",

        "drouethug.ct_supermarket1",
        "drouethug.ct_supermarket2",
        "drouethug.ct_supermarket3a",
        "drouethug.ct_supermarket3b",

        "drouethug.ct_punch1",
        "drouethug.ct_punch2",
        "drouethug.ct_punch3",

        "drouethug.ct_wood_cutter1",
        "drouethug.ct_wood_cutter2",
        "drouethug.ct_wood_cutter3",

        "drouethug.ct_stone_miner1",
        "drouethug.ct_stone_miner2",
        "drouethug.ct_stone_miner3",

        "drouethug.ct_wip",

        "drouethug.ct_wood_storage",
        "drouethug.ct_wood_storage_empt",
        "drouethug.ct_wood_storage_full",

        "drouethug.ct_stone_storage",
        "drouethug.ct_stone_storage_emp",
        "drouethug.ct_stone_storage_ful",
    },
}

local GAMEMODE = {
    PLAYER = "gmplayer",
    MENU = "gmmenu",
    EDIT = "gmedit",
    NOCLIP = "gmnoclip",
}

local BUILDINGS_ITEMS = {
    grass = Items.drouethug.ct_grass1,
    tree = Items.drouethug.ct_tree1,

    atmOn = Items.drouethug.ct_atm,
    atmOff = Items.drouethug.ct_atm_empty,
    atmOver = Items.drouethug.ct_atm_overflow,
    workbench = Items.drouethug.ct_workbench,

    building_lvl1 = Items.drouethug.ct_building1,
    building_lvl2 = Items.drouethug.ct_building2,
    building_lvl3 = Items.drouethug.ct_building3,

    house_lvl1 = Items.drouethug.ct_house1,
    house_lvl2 = Items.drouethug.ct_house2,
    house_lvl3 = Items.drouethug.ct_house3,

    school_lvl1 = Items.drouethug.ct_school1,
    school_lvl2 = Items.drouethug.ct_school2,
    school_lvl3a = Items.drouethug.ct_school3a,
    school_lvl3b = Items.drouethug.ct_school3b,

    supermarket_lvl1 = Items.drouethug.ct_supermarket1,
    supermarket_lvl2 = Items.drouethug.ct_supermarket2,
    supermarket_lvl3a = Items.drouethug.ct_supermarket3a,
    supermarket_lvl3b = Items.drouethug.ct_supermarket3b,

    punch1 = Items.drouethug.ct_punch1,
    punch2 = Items.drouethug.ct_punch2,
    punch3 = Items.drouethug.ct_punch3,

    miner1 = Items.drouethug.ct_stone_miner1,
    miner2 = Items.drouethug.ct_stone_miner2,
    miner3 = Items.drouethug.ct_stone_miner3,

    cutter1 = Items.drouethug.ct_wood_cutter1,
    cutter2 = Items.drouethug.ct_wood_cutter2,
    cutter3 = Items.drouethug.ct_wood_cutter3,

    wip = Items.drouethug.ct_wip,

    wood_storage = Items.drouethug.ct_wood_storage,
    wood_storage_empty = Items.drouethug.ct_wood_storage_empt,
    wood_storage_full = Items.drouethug.ct_wood_storage_full,

    stone_storage = Items.drouethug.ct_stone_storage,
    stone_storage_empty = Items.drouethug.ct_stone_storage_emp,
    stone_storage_full = Items.drouethug.ct_stone_storage_ful,
}

local PUNCH_DIVIDE = 6

local COIN_NEW_GAME = 80
local COIN_BASE_REVENUS = 10
local COIN_PER_POP = 2

local TEXT_SPACING = 35

local ORIGIN = Number3(60, 20, 60)
local ORIGIN_BY_MAP = Number3(3, 3, 3)
local ITEM_SCALE = 1.25
local BLOCK_SIZE = 20
local BLOCK_HALF_SIZE = 10

function getTilePosition(x, y)
    return Number3(ORIGIN.X + BLOCK_SIZE * x, ORIGIN.Y, ORIGIN.Z + BLOCK_SIZE * y)
end

function getTilePositionForMap(x, y)
    return Number3((ORIGIN_BY_MAP.X + x) * 4, ORIGIN_BY_MAP.Y, (ORIGIN_BY_MAP.Z + y) * 4)
end


---- BUILDINGS DATA ----

local BUILDINGS_DATA = {
    building = {
        {
            name = "Residence",
            type = "building_lvl1",
            power = "population",
            population = 30,
            price = {
                coins = 100
            },
            size = Number2(2, 2)
        },
        {
            name = "Hotel",
            type = "building_lvl2",
            power = "population",
            population = 75,
            price = {
                coins = 5000,
            },
            size = Number2(2, 2)
        },
        {
            name = "Luxury hotel",
            type = "building_lvl3",
            power = "population",
            population = 150,
            price = {
                coins = 100000,
                wood = 5000
            },
            size = Number2(2, 2)
        }
    },
    house = {
        {
            name = "Little house",
            type = "house_lvl1",
            power = "population",
            population = 7,
            price = {
                coins = 50
            },
            size = Number2(1, 1)
        },
        {
            name = "House",
            type = "house_lvl2",
            power = "population",
            population = 18,
            price = {
                coins = 2500,
            },
            size = Number2(1, 1)
        },
        {
            name = "Big house",
            type = "house_lvl3",
            power = "population",
            population = 35,
            price = {
                coins = 50000,
                wood = 2500
            },
            size = Number2(1, 1)
        }
    },
    school = {
        {
            name = "School",
            type = "school_lvl1",
            power = "hapinness",
            multiplier = 1,
            range = 3,
            price = {
                coins = 1000
            },
            size = Number2(3, 2)
        },
        {
            name = "Famous school",
            type = "school_lvl2",
            power = "hapinness",
            multiplier = 2,
            range = 3,
            price = {
                coins = 50000,
            },
            size = Number2(3, 2)
        },
        {
            name = "Public school",
            type = "school_lvl3a",
            power = "hapinness",
            multiplier = 4,
            range = 3,
            price = {
                coins = 300000,
                wood = 5000
            },
            size = Number2(3, 2)
        },
        {
            name = "Private school",
            type = "school_lvl3b",
            power = "hapinness",
            multiplier = 2,
            wood = 900,
            range = 3,
            price = {
                coins = 300000,
                wood = 5000,
                stone = 500
            },
            size = Number2(3, 2)
        },
    },
    supermarket = {
        {
            name = "Supermarket",
            type = "supermarket_lvl1",
            power = "hapinness",
            multiplier = 1,
            range = 3,
            price = {
                coins = 10000,
                wood = 500
            },
            size = Number2(3, 2)
        },
        {
            name = "Big supermarket",
            type = "supermarket_lvl2",
            power = "hapinness",
            multiplier = 2,
            range = 3,
            price = {
                coins = 300000,
                wood = 15000,
                stone = 500
            },
            size = Number2(3, 2)
        },
        {
            name = "Shopping center",
            type = "supermarket_lvl3b",
            power = "hapinness",
            multiplier = 4,
            range = 3,
            price = {
                coins = 1000000,
                wood = 25000,
                stone = 3000,
            },
            size = Number2(3, 2)
        },
        {
            name = "Hardware store",
            type = "supermarket_lvl3a",
            power = "hapinness",
            multiplier = 2,
            stone = 40,
            range = 3,
            price = {
                coins = 1000000,
                wood = 25000,
                stone = 3000,
            },
            size = Number2(3, 2)
        },
    },
    cutter = {
        {
            name = "Wood cutter",
            type = "cutter1",
            power = "wood",
            wood = 200,
            price = {
                coins = 150000,
            },
            size = Number2(3, 2)
        },
        {
            name = "Big wood cutter",
            type = "cutter2",
            power = "wood",
            wood = 700,
            price = {
                coins = 550000,
                wood = 5000,
            },
            size = Number2(3, 2)
        },
        {
            name = "Extra wood cutter",
            type = "cutter3",
            power = "wood",
            wood = 2000,
            price = {
                coins = 2000000,
                wood = 25000,
            },
            size = Number2(3, 2)
        },
    },
    miner = {
        {
            name = "Stone miner",
            type = "miner1",
            power = "miner",
            stone = 30,
            price = {
                coins = 750000,
                wood = 5000
            },
            size = Number2(3, 2)
        },
        {
            name = "Big stone miner",
            type = "miner2",
            power = "miner",
            stone = 80,
            price = {
                coins = 2500000,
                wood = 25000,
                stone = 500
            },
            size = Number2(3, 2)
        },
        {
            name = "Extra stone miner",
            type = "miner3",
            power = "miner",
            stone = 200,
            price = {
                coins = 3000000,
                wood = 50000,
                stone = 5000
            },
            size = Number2(3, 2)
        },
    }
}

Client.OnStart = function()
    -- Set game Variable --
    game = {
        dev = true,
        load = false,
        mode = GAMEMODE.PLAYER,
        ambience = require("ambience"),
        clock = 0,
    }

    -- Init Map --
    Map.Scale = 5
    -- Map.Palette[3].Light = true

    -- Init Player --
    World:AddChild(Player)
    Player.Position = Number3(60, 20, 60)

    -- Init Settings --
    Pointer:Hide()

    -- Init Inventory --
    inventory = {
        coins = COIN_NEW_GAME,
        wood = 0,
        stone = 0,
        iron = 0,
    }

    -- Init City --
    city = {
        system = {
            atm = {
                shapeOn = nil,
                shapeOff = nil,
                shapeOver = nil,
                value = 0,
                over = false,
                run = 0
            },
            workbench = {
                shape = nil
            },
            wood = {
                enable = false,
                shape = nil,
                value = 0,
                over = false,
                run = 0
            },
            stone = {
                enable = false,
                shape = nil,
                value = 0,
                over = false,
                run = 0
            },
            punch = {
                shape = nil,
                state = 1,
                last = 0
            }
        },
        map = {},
        zone = Number2(20, 20),
    }

    -- Init UI --
    ui = require("uikit")
    uiIGame = {
        hud = initStaticHUD(),
        menu = nil
    }

    -- Init Edit Mode --
    editMode = {
        build = nil,
        mx = 0,
        my = 0,
        shape = nil,
        x = 0,
        y = 0,
        w = 0,
        h = 0,
        lastMove = 0,
        validButton = nil
    }

    -- Init Animations --
    animations = {}

    -- Save data
    Timer(5, true, function()
        if game.load == true then
            saveMyData()
        end
    end)
end

---------------
-- GAME INIT --
---------------

function initNewGame()
    for y = 0, 19 do
        for x = 0, 19 do
            -- Disable actions zone
            if x < 2 and y < 2 then goto continue return end

            -- Add grass to the map
            if math.random(0, 5) == 0 then
                local rotations = { 0, math.pi, math.pi / 2, -math.pi }
                local rotate = math.random(1, 4)
                local grass = addBuilding(x, y, 1, 1, "grass", "vegetable", Number3(0, rotations[rotate], 0))

                grass.shape.CollisionGroups = {}
                grass.shape.CollidesWithGroups = {}
                goto continue
            end

            -- Add tree to the map
            if math.random(0, 15) == 0 then
                local rotations = { 0, math.pi, math.pi / 2, -math.pi }
                local rotate = math.random(1, 4)
                addBuilding(x, y, 1, 1, "tree", "vegetable", Number3(0, rotations[rotate], 0))
                
                goto continue
            end

            ::continue::
        end
    end

    -- Send all data to server
    saveMyData()
end

function initSystemBuildings()
    local atmOn = initSystemATM(BUILDINGS_ITEMS.atmOn)
    local atmOff = initSystemATM(BUILDINGS_ITEMS.atmOff)
    local atmOver = initSystemATM(BUILDINGS_ITEMS.atmOver)
    local wb = initSystemWorkbench()
    local punch = spawnSystemPunch(BUILDINGS_ITEMS.punch1)
    local wood = spawnSystemWood(BUILDINGS_ITEMS.wood_storage_empty)
    local stone = spawnSystemStone(BUILDINGS_ITEMS.stone_storage_empty)

    city.system.atm.shapeOn = atmOn
    city.system.atm.shapeOff = atmOff
    city.system.atm.shapeOver = atmOver
    city.system.workbench.shape = wb
    city.system.punch.shape = punch
    city.system.wood.shape = wood
    city.system.stone.shape = stone

    -- Set atm status
    local state = "empty"

    if city.system.atm.value > 0 then
        state = "fill"
    end
    if city.system.atm.over or city.system.atm.run >= 6 then
        state = "over"
    end
    setAtmState(state)

    -- Set wood status
    local state = "empty"

    if city.system.wood.value > 0 then
        state = "fill"
    end
    if city.system.wood.over or city.system.wood.run >= 6 then
        state = "over"
    end
    setWoodStorageState(state)

    -- Set stone status
    local state = "empty"

    if city.system.stone.value > 0 then
        state = "fill"
    end
    if city.system.stone.over or city.system.stone.run >= 6 then
        state = "over"
    end
    setStoneStorageState(state)

    -- Help infos
    punch:TextBubble(
        "Click on me!",
        -1,
        Number3(8, 15, 8),
        true
    )
end

function spawnSystemWood(item)
    if not city.system.wood.enable then
        local wip = Shape(BUILDINGS_ITEMS.wip)

        wip.Position = getTilePosition(6, -1)
        wip.Scale = ITEM_SCALE

        wip.Position.X = wip.Position.X + BLOCK_HALF_SIZE / 4
        wip.Position.Z = wip.Position.Z + BLOCK_HALF_SIZE / 2

        wip:SetParent(World)
        return wip
    end

    local storage = Shape(item)

    storage.Position = getTilePosition(6, -1)
    storage.Scale = ITEM_SCALE

    storage.Rotation = Number3(0, math.pi, 0)
    storage.Position.X = storage.Position.X + BLOCK_SIZE * 2 - BLOCK_HALF_SIZE / 4
    storage.Position.Z = storage.Position.Z + BLOCK_HALF_SIZE + BLOCK_HALF_SIZE / 1.5

    storage:SetParent(World)
    return storage
end

function spawnSystemStone(item)
    if not city.system.stone.enable then
        local wip = Shape(BUILDINGS_ITEMS.wip)

        wip.Position = getTilePosition(8, -1)
        wip.Scale = ITEM_SCALE

        wip.Position.X = wip.Position.X + BLOCK_HALF_SIZE / 4
        wip.Position.Z = wip.Position.Z + BLOCK_HALF_SIZE / 2

        wip:SetParent(World)
        return wip
    end

    local storage = Shape(item)

    storage.Position = getTilePosition(8, -1)
    storage.Scale = ITEM_SCALE

    storage.Rotation = Number3(0, math.pi, 0)
    storage.Position.X = storage.Position.X + BLOCK_SIZE * 2 - BLOCK_HALF_SIZE / 4
    storage.Position.Z = storage.Position.Z + BLOCK_HALF_SIZE + BLOCK_HALF_SIZE / 1.5

    storage:SetParent(World)
    return storage
end

function initSystemWorkbench()
    local wb = Shape(BUILDINGS_ITEMS.workbench)

    wb.Position = getTilePosition(1, -1)
    wb.Scale = ITEM_SCALE

    wb.Rotation = Number3(0, math.pi, 0)
    wb.Position.X = wb.Position.X + BLOCK_HALF_SIZE
    wb.Position.Z = wb.Position.Z + BLOCK_SIZE

    wb:SetParent(World)
    return wb
end

function initSystemATM(item)
    local atm = Shape(item)

    atm.Position = getTilePosition(-1, 0)
    atm.Scale = ITEM_SCALE

    atm.Rotation = Number3(0, math.pi * 1.5, 0)
    atm.Position.X = atm.Position.X + BLOCK_SIZE
    atm.Position.Z = atm.Position.Z + BLOCK_HALF_SIZE

    atm:SetParent(World)
    return atm
end

function spawnSystemPunch(item)
    local punch = Shape(item)

    punch.Position = getTilePosition(-1, 4)
    punch.Scale = ITEM_SCALE

    punch.Rotation = Number3(0, math.pi * 1.5, 0)
    punch.Position.X = punch.Position.X - BLOCK_HALF_SIZE / 2

    punch:SetParent(World)
    return punch
end

---------------------
-- CUBZH CALLBACKS --
---------------------

Client.Action1 = function()
    if Player.IsOnGround then
        Player.Velocity.Y = 120
    end
end

Client.Action2 = function()
    Player:SwingRight()
    handInteraction()
end

Client.Tick = function(dt)
    game.clock = game.clock + dt

    addAtmRevenus()
    addWoodStorageRevenus()
    addStoneStorageRevenus()
    runAnimations()
    editModeMove()

    -- Reset clock
    if (game.clock > 10) then
        game.clock = 0
        editMode.lastMove = editMode.lastMove - 10
        city.system.punch.last = city.system.punch.last - 10
    end
    if Player.Position.Y < 0 then
        Player.Position = ORIGIN
    end
end

Client.DirectionalPad = function(x, y)
    if game.mode == GAMEMODE.PLAYER then
        dpadX = x dpadY = y
        Player.Motion = (Player.Forward * y + Player.Right * x) * 50
    end
    if game.mode == GAMEMODE.EDIT then
        editModeMove()
        editMode.mx = x
	    editMode.my = y
    end
end

Client.OnChat = function(table)
    if table.message == "reset" and game.dev then
       clearGame()
    end
end

--------------------
--  UI FUNCTIONS  --
--------------------

function initStaticHUD()
    local frame = ui:createFrame(Color(0, 0, 0, 150))
    local coinsText = ui:createText("💰 Coins: " .. inventory.coins, Color.White, "default")
    local woodText = ui:createText("➖ Wood: " .. inventory.wood, Color.White, "default")
    local stoneText = ui:createText("💎 Stone: " .. inventory.stone, Color.White, "default")

    frame.Width = 250
    frame.Height = 110
    frame.LocalPosition = Number3(0, Screen.Height - frame.Height - 50, 0)

    local textPosition = Number2(15, frame.Height - 10)

    coinsText:setParent(frame)
    textPosition.Y = textPosition.Y - coinsText.Height
    coinsText.pos = textPosition

    woodText:setParent(frame)
    textPosition.Y = textPosition.Y - woodText.Height - 10
    woodText.pos = textPosition

    stoneText:setParent(frame)
    textPosition.Y = textPosition.Y - stoneText.Height - 10
    stoneText.pos = textPosition

    return {
        frame = frame,
        coins = coinsText,
        wood = woodText,
        stone = stoneText
    }
end

function refreshHUD()
    uiIGame.hud.coins.Text = "💰 Coins: " .. inventory.coins
    uiIGame.hud.wood.Text = "➖ Wood: " .. inventory.wood
    uiIGame.hud.stone.Text = "💎 Stone: " .. inventory.stone
end

Screen.DidResize = function(width, height)
    uiIGame.hud.frame.LocalPosition = Number3(0, height - uiIGame.hud.frame.Height - 50, 0)
end

function displayWorkMenu()
    if game.mode ~= GAMEMODE.PLAYER then return end

    -- Frame
    local frame = ui:createFrame(Color(0, 0, 0, 200))

    frame.Width = 450
    frame.Height = 650
    frame.LocalPosition = Number3(
        Screen.Width / 2 - frame.Width / 2,
        Screen.Height / 2 - frame.Height / 2,
        0
    )

    local closeButton = ui:createButton("❌")

    closeButton.pos = Number2(
        frame.Width - closeButton.Width - 15,
        frame.Height - closeButton.Height - 15
    )
    closeButton:setParent(frame)

    closeButton.onRelease = function()
        frame:remove()
        Pointer:Hide()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
    end

    local textPosition = Number2(15, frame.Height - 5)

    -- Stats
    local coinsText = ui:createText("💰 Coins: "..getCoinsRevenus().."/10s", Color.White, "small")

    textPosition.Y = textPosition.Y - coinsText.Height - 15
    coinsText.pos = textPosition
    coinsText:setParent(frame)

    local woodText = ui:createText("➖ Wood: "..getWoodRevenus().."/10s", Color.White, "small")

    textPosition.Y = textPosition.Y - woodText.Height - 10
    woodText.pos = textPosition
    woodText:setParent(frame)

    local stoneText = ui:createText("💎 Stone: "..getStoneRevenus().."/10s", Color.White, "small")

    textPosition.Y = textPosition.Y - stoneText.Height - 10
    stoneText.pos = textPosition
    stoneText:setParent(frame)

    -- Texts

    textPosition.Y = textPosition.Y - 20

    local buildingDataSort = {}
    for k, v in pairs(BUILDINGS_DATA) do
        table.insert(buildingDataSort, {id = k, data = v})
    end
    table.sort(buildingDataSort, function(a, b)
        return a.data[1].price.coins < b.data[1].price.coins
    end)

    for _, building in ipairs(buildingDataSort) do
        local lvl1 = building.data[1]
        local text = ui:createText("- "..lvl1.name, Color.White, "default")

        textPosition.Y = textPosition.Y - text.Height
        text.pos = textPosition
        text:setParent(frame)

        if lvl1.price.coins then
            local textBuy = ui:createText("💰 Coins: "..lvl1.price.coins, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end
        if lvl1.price.wood then
            local textBuy = ui:createText("➖ Wood: "..lvl1.price.wood, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end
        if lvl1.price.stone then
            local textBuy = ui:createText("💎 Stone: "..lvl1.price.stone, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end

        -- Pay button
        local payButton = ui:createButton("🏠 Build")
        if not canPay(lvl1) then
            payButton.disabled = true
        end
        payButton.pos = Number2(
            frame.Width - payButton.Width - 15,
            text.pos.Y + text.Height / 2 - payButton.Height / 2
        )
        payButton:setParent(frame)

        payButton.onRelease = function()
            frame:remove()
            game.mode = GAMEMODE.PLAYER
            Player:SetParent(World)

            lvl1.category = building.id
            enableEditMode(lvl1)
        end

        -- Increment text position
        textPosition.Y = textPosition.Y - text.Height - 10
    end

    -- Sync data globaly
    uiIGame.menu = {
        page = 1,
        frame = frame
    }

    game.mode = GAMEMODE.MENU
    Player:SetParent(nil)
    Pointer:Show()
end

function displayEditMenu()
    -- Frame
    local frame = ui:createFrame(Color(0, 0, 0, 200))

    frame.Width = 400
    frame.Height = 100
    frame.LocalPosition = Number3(
        Screen.Width - frame.Width - 30,
        30,
        0
    )

    local title = ui:createText("Place your building 🏠", Color.White, "default")

    title.pos = Number2(15, frame.Height - 15 - title.Height)
    title:setParent(frame)

    local position = Number2(15, 15)

    local rotateButton = ui:createButton("↻")

    rotateButton.pos = position
    position.X = position.X + 15 + rotateButton.Width
    rotateButton.onRelease = editRotateBuilding
    rotateButton:setParent(frame)

    local cancelButton = ui:createButton("❌")

    cancelButton.pos = position
    position.X = position.X + 15 + cancelButton.Width
    cancelButton.onRelease = function()
        disableEditMode(false)
        frame:remove()
    end
    cancelButton:setParent(frame)

    local validButton = ui:createButton("✅")

    validButton.pos = position
    position.X = position.X + 15 + validButton.Width
    validButton.onRelease = function()
        disableEditMode(true)
        frame:remove()
    end
    validButton:setParent(frame)
    editMode.validButton = validButton
end

function displayBuildingMenu(building)
    if game.mode ~= GAMEMODE.PLAYER then return end

    local categoryInfos = BUILDINGS_DATA[building.category]
    local buildInfos = categoryInfos[building.level]
    
    -- Frame
    local frame = ui:createFrame(Color(248, 196, 113, 150))

    frame.Width = 600
    frame.Height = 500

    if building.level == 2 and categoryInfos[4] then
        frame.Height = 600
    end

    frame.LocalPosition = Number3(
        Screen.Width / 2 - frame.Width / 2,
        Screen.Height / 2 - frame.Height / 2,
        0
    )

    local closeButton = ui:createButton("❌")

    closeButton.pos = Number2(
        frame.Width - closeButton.Width - 15,
        frame.Height - closeButton.Height - 15
    )
    closeButton:setParent(frame)

    closeButton.onRelease = function()
        frame:remove()
        Pointer:Hide()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
    end

    -- Informations texts

    local textPosition = Number2(15, frame.Height - 20)

    local name = ui:createText("🏠 "..buildInfos.name.." - ".."Level "..building.level, Color.White, "default")
    textPosition.Y = textPosition.Y - name.Height
    name.pos = textPosition
    name:setParent(frame)

    if buildInfos.power == "population" then
        local pop = ui:createText("👤 ".."Population - "..buildInfos.population, Color.White, "default")
        textPosition.Y = textPosition.Y - pop.Height - 10
        pop.pos = textPosition
        pop:setParent(frame)

        local bonus = 1
        if building.bonus then
            for _,v in pairs(building.bonus) do
                bonus = bonus + v
            end
        end

        local hap = ui:createText("❤️ ".."Hapinness - "..bonus, Color.White, "default")
        textPosition.Y = textPosition.Y - hap.Height - 10
        hap.pos = textPosition
        hap:setParent(frame)

        local coins = ui:createText("💰 ".."Income - "..getBuildingRevenus(building).."/10s", Color.White, "default")
        textPosition.Y = textPosition.Y - coins.Height - 10
        coins.pos = textPosition
        coins:setParent(frame)
    end

    if buildInfos.power == "hapinness" then
        local hap = ui:createText("❤️ ".."Happiness transmitted +"..buildInfos.multiplier, Color.White, "default")
        textPosition.Y = textPosition.Y - hap.Height - 10
        hap.pos = textPosition
        hap:setParent(frame)

        local range = ui:createText("⚙️ ".."Buildings range - "..buildInfos.range, Color.White, "default")
        textPosition.Y = textPosition.Y - range.Height - 10
        range.pos = textPosition
        range:setParent(frame)
    end

    -- Marge between upgrades
    local upgradesTitles = ui:createText("-- UPGRADE --", Color.White, "default")
    textPosition.Y = textPosition.Y - upgradesTitles.Height - 30
    upgradesTitles.pos = Number2(frame.Width / 2 - upgradesTitles.Width / 2, textPosition.Y)
    upgradesTitles:setParent(frame)

    textPosition.Y = textPosition.Y - 10

    if building.level == 1 or (building.level == 2 and not categoryInfos[4]) then
        local lvl = building.level + 1
        local info = categoryInfos[lvl]

        local name = ui:createText("Level "..lvl.." - "..info.name, Color.White, "default")
        textPosition.Y = textPosition.Y - name.Height - 20
        name.pos = textPosition
        name:setParent(frame)

        if buildInfos.power == "population" then
            local pop = ui:createText("👤 ".."Population - "..info.population, Color.White, "default")
            textPosition.Y = textPosition.Y - pop.Height - 10
            pop.pos = textPosition
            pop:setParent(frame)
        end
        if buildInfos.power == "hapinness" then
            local hap = ui:createText("❤️ ".."Happiness transmitted +"..info.multiplier, Color.White, "default")
            textPosition.Y = textPosition.Y - hap.Height - 10
            hap.pos = textPosition
            hap:setParent(frame)
        end

        local costTitle = ui:createText("Cost ⤵️", Color.White, "default")
        textPosition.Y = textPosition.Y - costTitle.Height - 20
        costTitle.pos = textPosition
        costTitle:setParent(frame)

        if info.price.coins then
            local textBuy = ui:createText("💰 Coins: "..info.price.coins, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end
        if info.price.wood then
            local textBuy = ui:createText("➖ Wood: "..info.price.wood, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end
        if info.price.stone then
            local textBuy = ui:createText("💎 Stone: "..info.price.stone, Color.White, "default")

            textPosition.Y = textPosition.Y - textBuy.Height - 5
            textBuy.pos = textPosition
            textBuy:setParent(frame)
        end

        local payButton = ui:createButton("✨ Upgrade")
        if not canPay(info) then
            payButton.disabled = true
        end
        payButton.pos = Number2(
            frame.Width - payButton.Width - 15,
            textPosition.Y + 10 - payButton.Height / 2
        )
        payButton:setParent(frame)

        payButton.onRelease = function()
            updateBuilding(building)
            payBuild(info)
            
            frame:remove()
            Pointer:Hide()
            game.mode = GAMEMODE.PLAYER
            Player:SetParent(World)
        end
    end

    if building.level == 2 and categoryInfos[4] then
        for lvl = 3, 4 do
            local info = categoryInfos[lvl]

            local name = ui:createText("Level "..lvl.." - "..info.name, Color.White, "default")
            textPosition.Y = textPosition.Y - name.Height - 20
            name.pos = textPosition
            name:setParent(frame)
    
            if info.power == "hapinness" then
                local hap = ui:createText("❤️ ".."Happiness transmitted +"..info.multiplier, Color.White, "default")
                textPosition.Y = textPosition.Y - hap.Height - 10
                hap.pos = textPosition
                hap:setParent(frame)
            end
            if info.wood then
                local wood = ui:createText("➖ ".."Wood generation - "..info.wood.."/10s", Color.White, "default")
                textPosition.Y = textPosition.Y - wood.Height - 10
                wood.pos = textPosition
                wood:setParent(frame)
            end
            if info.stone then
                local stone = ui:createText("💎 ".."Stone generation - "..info.stone.."/10s", Color.White, "default")
                textPosition.Y = textPosition.Y - stone.Height - 10
                stone.pos = textPosition
                stone:setParent(frame)
            end

            local costTitle = ui:createText("Cost ⤵️", Color.White, "default")
            textPosition.Y = textPosition.Y - costTitle.Height - 20
            costTitle.pos = textPosition
            costTitle:setParent(frame)

            if info.price.coins then
                local textBuy = ui:createText("💰 Coins: "..info.price.coins, Color.White, "default")

                textPosition.Y = textPosition.Y - textBuy.Height - 5
                textBuy.pos = textPosition
                textBuy:setParent(frame)
            end
            if info.price.wood then
                local textBuy = ui:createText("➖ Wood: "..info.price.wood, Color.White, "default")

                textPosition.Y = textPosition.Y - textBuy.Height - 5
                textBuy.pos = textPosition
                textBuy:setParent(frame)
            end
            if info.price.stone then
                local textBuy = ui:createText("💎 Stone: "..info.price.stone, Color.White, "default")

                textPosition.Y = textPosition.Y - textBuy.Height - 5
                textBuy.pos = textPosition
                textBuy:setParent(frame)
            end
    
            local payButton = ui:createButton("✨ Upgrade")
            if not canPay(info) then
                payButton.disabled = true
            end
            payButton.pos = Number2(
                frame.Width - payButton.Width - 15,
                textPosition.Y + 10 - payButton.Height / 2
            )
            payButton:setParent(frame)
    
            payButton.onRelease = function()
                updateBuilding(building, lvl)
                payBuild(info)
                
                frame:remove()
                Pointer:Hide()
                game.mode = GAMEMODE.PLAYER
                Player:SetParent(World)
            end
        end
    end

    game.mode = GAMEMODE.MENU
    Player:SetParent(nil)
    Pointer:Show()
end

function woodStorageBuyMenu()
    if game.mode ~= GAMEMODE.PLAYER then return end

    local frame = ui:createFrame(Color(132, 132, 132, 200))
    frame.Width = 400
    frame.Height = 150

    frame.LocalPosition = Number3(
        Screen.Width / 2 - frame.Width / 2,
        Screen.Height / 2 - frame.Height / 2,
        0
    )

    local closeButton = ui:createButton("❌")

    closeButton.pos = Number2(
        frame.Width - closeButton.Width - 15,
        frame.Height - closeButton.Height - 15
    )
    closeButton:setParent(frame)

    closeButton.onRelease = function()
        frame:remove()
        Pointer:Hide()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
    end

    local textPosition = Number2(15, frame.Height - 20)

    local name = ui:createText("🏠 Buy wood storage", Color.White, "default")
    textPosition.Y = textPosition.Y - name.Height
    name.pos = textPosition
    name:setParent(frame)

    local textBuy = ui:createText("💰 Coins: 75000", Color.White, "default")

    textPosition.Y = textPosition.Y - textBuy.Height - 5
    textBuy.pos = textPosition
    textBuy:setParent(frame)

    local payButton = ui:createButton("🏠 Build")
    if inventory.coins < 75000 then
        payButton.disabled = true
    end

    payButton.pos = Number2(15, 15)
    payButton:setParent(frame)

    payButton.onRelease = function()
        frame:remove()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
        Pointer:Hide()

        inventory.coins = inventory.coins - 75000
        city.system.wood.enable = true

        refreshHUD()
        setWoodStorageState("empty")
    end

    game.mode = GAMEMODE.MENU
    Player:SetParent(nil)
    Pointer:Show()
end

function stoneStorageBuyMenu()
    if game.mode ~= GAMEMODE.PLAYER then return end

    local frame = ui:createFrame(Color(132, 132, 132, 200))
    frame.Width = 400
    frame.Height = 150

    frame.LocalPosition = Number3(
        Screen.Width / 2 - frame.Width / 2,
        Screen.Height / 2 - frame.Height / 2,
        0
    )

    local closeButton = ui:createButton("❌")

    closeButton.pos = Number2(
        frame.Width - closeButton.Width - 15,
        frame.Height - closeButton.Height - 15
    )
    closeButton:setParent(frame)

    closeButton.onRelease = function()
        frame:remove()
        Pointer:Hide()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
    end

    local textPosition = Number2(15, frame.Height - 20)

    local name = ui:createText("🏠 Buy stone storage", Color.White, "default")
    textPosition.Y = textPosition.Y - name.Height
    name.pos = textPosition
    name:setParent(frame)

    local textBuy = ui:createText("💰 Coins: 450000", Color.White, "default")

    textPosition.Y = textPosition.Y - textBuy.Height - 5
    textBuy.pos = textPosition
    textBuy:setParent(frame)

    local payButton = ui:createButton("🏠 Build")
    if inventory.coins < 450000 then
        payButton.disabled = true
    end

    payButton.pos = Number2(15, 15)
    payButton:setParent(frame)

    payButton.onRelease = function()
        frame:remove()
        game.mode = GAMEMODE.PLAYER
        Player:SetParent(World)
        Pointer:Hide()

        inventory.coins = inventory.coins - 450000
        city.system.stone.enable = true

        refreshHUD()
        setStoneStorageState("empty")
    end

    game.mode = GAMEMODE.MENU
    Player:SetParent(nil)
    Pointer:Show()
end

-------------------------
--  OBJECTS FUNCTIONS  --
-------------------------

function spawnItem(x, y, w, h, rotation, item)
    local shape = Shape(item)

    shape.Position = getTilePosition(x, y)

    -- Adapt position to a center origine
    shape.Position.X = shape.Position.X + BLOCK_HALF_SIZE * w
    shape.Position.Z = shape.Position.Z + BLOCK_HALF_SIZE * h

    shape.Pivot = { shape.Width * 0.5, 0, shape.Depth * 0.5 }
    shape.Rotation = rotation
    shape.Scale = ITEM_SCALE

    shape:SetParent(World)
    return shape
end

function addBuilding(x, y, w, h, id, category, rotation)
    rotation = rotation or Number3(0, 0, 0)

    local shape = spawnItem(x, y, w, h, rotation, BUILDINGS_ITEMS[id])
    local building = {
        type = id,
        position = Number2(x, y),
        size = Number2(w, h),
        shape = shape,
        rotation = rotation,
        category = category
    }
    local categoryInfos = BUILDINGS_DATA[building.category]
    local buildInfos = categoryInfos[building.level]

    -- Save building to map
    if city.map[y + 1] == nil then
        city.map[y + 1] = {}
    end
    city.map[y + 1][x + 1] = building

    return building
end

function updateBuilding(building, level)
    level = level or building.level + 1
    local categoryInfos = BUILDINGS_DATA[building.category]
    local buildInfos = categoryInfos[level]
    local oldShape = building.shape

    local shape = spawnItem(
        building.position.X,
        building.position.Y,
        building.size.X,
        building.size.Y,
        oldShape.Rotation,
        BUILDINGS_ITEMS[buildInfos.type]
    )

    building.shape:SetParent(nil)
    building.shape = shape
    building.type = buildInfos.type
    building.level = level

    setBonusFromHapinness(building)

    return building
end

function setBuildingBonus(newBuilding)
    local cI = BUILDINGS_DATA[newBuilding.category]
    if not cI then return end

    local bI = cI[newBuilding.level]
    if bI.power ~= "population" then
        return
    end

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local categoryInfos = BUILDINGS_DATA[building.category]
            local buildInfos = categoryInfos[building.level]

            if buildInfos.power ~= "hapinness" then goto continue end

            local zoneCoords = Number2(
                building.position.X - buildInfos.range,
                building.position.Y - buildInfos.range
            )
            local zoneSize = Number2(
                buildInfos.range * 2 + building.size.X,
                buildInfos.range * 2 + building.size.Y
            )

            if
                zoneCoords.X < newBuilding.position.X + newBuilding.size.X and
                zoneCoords.X + zoneSize.X > newBuilding.position.X and
                zoneCoords.Y < newBuilding.position.Y + newBuilding.size.Y and
                zoneCoords.Y + zoneSize.Y > newBuilding.position.Y
            then
                if not newBuilding.bonus then
                    newBuilding.bonus = {}
                end

                if not newBuilding.bonus[building.category] or newBuilding.bonus[building.category] < buildInfos.multiplier then
                    newBuilding.bonus[building.category] = buildInfos.multiplier
                end
            end

            ::continue::
        end
    end
end

function setBonusFromHapinness(hapBuilding)
    local cI = BUILDINGS_DATA[hapBuilding.category]
    if not cI then return end

    local bI = cI[hapBuilding.level]
    if bI.power ~= "hapinness" then
        return
    end

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local categoryInfos = BUILDINGS_DATA[building.category]
            local buildInfos = categoryInfos[building.level]

            if buildInfos.power ~= "population" then goto continue end

            local zoneCoords = Number2(
                hapBuilding.position.X - bI.range,
                hapBuilding.position.Y - bI.range
            )
            local zoneSize = Number2(
                bI.range * 2 + hapBuilding.size.X,
                bI.range * 2 + hapBuilding.size.Y
            )

            if
                zoneCoords.X < building.position.X + building.size.X and
                zoneCoords.X + zoneSize.X > building.position.X and
                zoneCoords.Y < building.position.Y + building.size.Y and
                zoneCoords.Y + zoneSize.Y > building.position.Y
            then
                if not building.bonus then
                    building.bonus = {}
                end

                if not building.bonus[hapBuilding.category] or building.bonus[hapBuilding.category] < bI.multiplier then
                    building.bonus[hapBuilding.category] = bI.multiplier
                end
            end

            ::continue::
        end
    end
end

function clearGame()
    inventory = {
        coins = COIN_NEW_GAME,
        wood = 0,
        stone = 0,
        iron = 0,
    }

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            building.shape:SetParent(nil)
        end
    end

    city.system.atm.value = 0
    city.system.atm.over = false
    city.system.atm.run = 0
    setAtmState("empty")

    city.system.wood.shape:SetParent(nil)
    city.system.wood.value = 0
    city.system.wood.over = false
    city.system.wood.run = 0
    city.system.wood.enable = false
    setWoodStorageState("empty")

    city.system.stone.shape:SetParent(nil)
    city.system.stone.value = 0
    city.system.stone.over = false
    city.system.stone.run = 0
    city.system.stone.enable = false
    setStoneStorageState("empty")

    city.map = {}

    initNewGame()
    refreshHUD()
end

--------------------
--  INTERACTIONS  --
--------------------

function handInteraction()
    atmInteraction()
    punchInteraction()
    workbenchInteraction()
    buildingInteraction()
    woodStorageInteraction()
    stoneStorageInteraction()
end

function allowInteraction(item)
    local cast = Camera:CastRay(item)

    if cast == nil or cast.Distance > 75 then 
        return false
    end
    return true
end

function buildingInteraction()
    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            if not allowInteraction(building.shape)  or building.category == "vegetable" then
                goto continue
            end

            displayBuildingMenu(building)

            ::continue::
        end
    end
end

function atmInteraction()
    if not allowInteraction(city.system.atm.shapeOn) and not allowInteraction(city.system.atm.shapeOver) then
        return
    end

    -- ATM Give
    giveCoins(city.system.atm.value)
    city.system.atm.value = 0
    city.system.atm.over = false
    city.system.atm.run = 0
end

function workbenchInteraction()
    if not allowInteraction(city.system.workbench.shape) then return end

    -- Open menu
    displayWorkMenu()

    -- WORKBENCH Sound
    local audio = AudioSource()
    audio:SetParent(World)

    audio.Sound = "wood_impact_1"
    audio.Volume = 0.80
    audio.Spatialized = false
    audio:Play()
end

function punchInteraction()
    if not allowInteraction(city.system.punch.shape) then return end

    if city.system.punch.last + 0.2 > game.clock then return end

    if city.system.punch.state > 2 then
        city.system.punch.state = 0
        
        inventory.coins = inventory.coins + math.floor(getBuildingsPopulation() / PUNCH_DIVIDE) + 5
        refreshHUD()
    end
    city.system.punch.state = city.system.punch.state + 1

    local newPunch = spawnSystemPunch(BUILDINGS_ITEMS["punch"..city.system.punch.state])
    city.system.punch.shape:SetParent(nil)
    city.system.punch.shape = newPunch

    city.system.punch.last = game.clock
end

function woodStorageInteraction()
    if not allowInteraction(city.system.wood.shape) then return end

    if not city.system.wood.enable then
        return woodStorageBuyMenu()
    end

    if city.system.wood.value > 0 then
        inventory.wood = inventory.wood + city.system.wood.value

        refreshHUD()

        city.system.wood.value = 0
        city.system.wood.over = false
        city.system.wood.run = 0
        setWoodStorageState("empty")

        -- STORAGE Sound
        local audio = AudioSource()
        audio:SetParent(World)

        audio.Sound = "wood_impact_1"
        audio.Volume = 0.80
        audio.Spatialized = false
        audio:Play()
    end
end

function stoneStorageInteraction()
    if not allowInteraction(city.system.stone.shape) then return end

    if not city.system.stone.enable then
        return stoneStorageBuyMenu()
    end

    if city.system.stone.value > 0 then
        inventory.stone = inventory.stone + city.system.stone.value

        refreshHUD()

        city.system.stone.value = 0
        city.system.stone.over = false
        city.system.stone.run = 0
        setStoneStorageState("empty")

        -- STORAGE Sound
        local audio = AudioSource()
        audio:SetParent(World)

        audio.Sound = "wood_impact_1"
        audio.Volume = 0.80
        audio.Spatialized = false
        audio:Play()
    end
end

-------------------------
--  INVENTORY ACTIONS  --
-------------------------

function canPay(buildInfos)
    if buildInfos.price.coins > inventory.coins then
        return false
    end
    if buildInfos.price.wood and buildInfos.price.wood > inventory.wood then
        return false
    end
    if buildInfos.price.stone and buildInfos.price.stone > inventory.stone then
        return false
    end

    return true
end

function giveCoins(value)
    inventory.coins = inventory.coins + value

    if (value > 0) then
        -- ATM Update
        setAtmState("empty")

        -- HUD
        refreshHUD()

        -- ATM Sound
        local audio = AudioSource()
        audio:SetParent(World)

        audio.Sound = "metal_clanging_1"
        audio.Volume = 0.80
        audio.Spatialized = false
        audio:Play()
    end

    saveMyInventory()
end

function getBuildingsPopulation()
    local population = 0

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local catBuild = BUILDINGS_DATA[building.category]
            if not catBuild then goto continue end

            local infosBuild = catBuild[building.level]
            if infosBuild.power ~= "population" then goto continue end

            population = population + infosBuild.population

            ::continue::
        end
    end
    return population
end

function getBuildingRevenus(building)
    local categoryInfos = BUILDINGS_DATA[building.category]
    if not categoryInfos then 
        return 0 
    end

    local buildInfos = categoryInfos[building.level]
    if buildInfos.power ~= "population" then 
        return 0 
    end

    local revenus = buildInfos.population * COIN_PER_POP
    if building.bonus then
        local bonus = 1
    
        for _, b in pairs(building.bonus) do
            bonus = bonus + b
        end

        revenus = revenus * bonus
    end

    return revenus
end

function getWoodRevenus()
    local revenus = 0

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local catBuild = BUILDINGS_DATA[building.category]
            if not catBuild then goto continue end

            local infosBuild = catBuild[building.level]
            if infosBuild.wood then
                revenus = revenus + infosBuild.wood
            end

            ::continue::
        end
    end
    return revenus
end

function getStoneRevenus()
    local revenus = 0

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local catBuild = BUILDINGS_DATA[building.category]
            if not catBuild then goto continue end

            local infosBuild = catBuild[building.level]
            if infosBuild.stone then
                revenus = revenus + infosBuild.stone
            end

            ::continue::
        end
    end
    return revenus
end

function getIronRevenus()
    local revenus = 0

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            local catBuild = BUILDINGS_DATA[building.category]
            if not catBuild then goto continue end

            local infosBuild = catBuild[building.level]
            if infosBuild.iron then
                revenus = revenus + infosBuild.iron
            end

            ::continue::
        end
    end
    return revenus
end

function getCoinsRevenus()
    local revenus = COIN_BASE_REVENUS
    
    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]
            
            revenus = revenus + getBuildingRevenus(building)
        end
    end
    return revenus
end

function addAtmRevenus()
    if (game.clock < 10 or city.system.atm.over) then
        return
    end

    local revenus = getCoinsRevenus()
    city.system.atm.value = city.system.atm.value + revenus
    city.system.atm.run = city.system.atm.run + 1

    -- ATM Update
    if city.system.atm.run >= 6 then
        setAtmState("over")
        city.system.atm.over = true
    else
        setAtmState("fill")
    end
end

function addWoodStorageRevenus()
    if (game.clock < 10 or not city.system.wood.enable or city.system.wood.over) then
        return
    end

    local revenus = getWoodRevenus()

    if revenus < 1 then
        return
    end

    city.system.wood.value = city.system.wood.value + revenus
    city.system.wood.run = city.system.wood.run + 1

    -- Storage Update
    if city.system.wood.run >= 6 then
        setWoodStorageState("over")
        city.system.wood.over = true
    else
        setWoodStorageState("fill")
    end
end

function addStoneStorageRevenus()
    if (game.clock < 10 or not city.system.stone.enable or city.system.stone.over) then
        return
    end

    local revenus = getStoneRevenus()

    if revenus < 1 then
        return
    end

    city.system.stone.value = city.system.stone.value + revenus
    city.system.stone.run = city.system.stone.run + 1

    -- Storage Update
    if city.system.stone.run >= 6 then
        setStoneStorageState("over")
        city.system.stone.over = true
    else
        setStoneStorageState("fill")
    end
end

function setWoodStorageState(state)
    city.system.wood.shape:SetParent(nil)
    removeExclamationAnim("woodfill")
    removeExclamationAnim("woodover")

    if state == "empty" then
        city.system.wood.shape = spawnSystemWood(BUILDINGS_ITEMS.wood_storage_empty)
    end

    if state == "fill" then
        city.system.wood.shape = spawnSystemWood(BUILDINGS_ITEMS.wood_storage)

        local storagePos = city.system.wood.shape.Position
        local animPos = Number3(storagePos.X - 17, storagePos.Y + 22, storagePos.Z - 8)
        return addExclamationAnim(animPos, "woodfill", false)
    end

    if state == "over" then
        city.system.wood.shape = spawnSystemWood(BUILDINGS_ITEMS.wood_storage_full)

        local storagePos = city.system.wood.shape.Position
        local animPos = Number3(storagePos.X - 17, storagePos.Y + 22, storagePos.Z - 8)
        return addExclamationAnim(animPos, "woodover", true)
    end
end

function setStoneStorageState(state)
    city.system.stone.shape:SetParent(nil)
    removeExclamationAnim("stonefill")
    removeExclamationAnim("stoneover")

    if state == "empty" then
        city.system.stone.shape = spawnSystemStone(BUILDINGS_ITEMS.stone_storage_empty)
    end

    if state == "fill" then
        city.system.stone.shape = spawnSystemStone(BUILDINGS_ITEMS.stone_storage)

        local storagePos = city.system.stone.shape.Position
        local animPos = Number3(storagePos.X - 17, storagePos.Y + 22, storagePos.Z - 8)
        return addExclamationAnim(animPos, "stonefill", false)
    end

    if state == "over" then
        city.system.stone.shape = spawnSystemStone(BUILDINGS_ITEMS.stone_storage_full)

        local storagePos = city.system.stone.shape.Position
        local animPos = Number3(storagePos.X - 17, storagePos.Y + 22, storagePos.Z - 8)
        return addExclamationAnim(animPos, "stonefill", true)
    end
end

function setAtmState(state)
    if state == "empty" then
        city.system.atm.shapeOff.Position.Y = ORIGIN.Y
        city.system.atm.shapeOn.Position.Y = -50
        city.system.atm.shapeOver.Position.Y = -50
        removeExclamationAnim("atmfill")
        return removeExclamationAnim("atmover")
    end

    if state == "fill" then
        city.system.atm.shapeOff.Position.Y = -50
        city.system.atm.shapeOver.Position.Y = -50
        city.system.atm.shapeOn.Position.Y = ORIGIN.Y

        local atmPos = city.system.atm.shapeOn.Position
        local animPos = Number3(atmPos.X - 10, atmPos.Y + 42, atmPos.Z + 10)
        return addExclamationAnim(animPos, "atmfill", false)
    end

    if state == "over" then
        city.system.atm.shapeOff.Position.Y = -50
        city.system.atm.shapeOn.Position.Y = -50
        city.system.atm.shapeOver.Position.Y = ORIGIN.Y

        local atmPos = city.system.atm.shapeOver.Position
        local animPos = Number3(atmPos.X - 10, atmPos.Y + 42, atmPos.Z + 10)
        removeExclamationAnim("atmfill")
        return addExclamationAnim(animPos, "atmover", true)
    end
end

function payBuild(build)
    if build.price.coins then
        inventory.coins = inventory.coins - build.price.coins
    end
    if build.price.wood then
        inventory.wood = inventory.wood - build.price.wood
    end
    if build.price.stone then
        inventory.stone = inventory.stone - build.price.stone
    end

    refreshHUD()
end

------------------
--  ANIMATIONS  --
------------------

function runAnimations()
    runExclamationAnim()
end

function runExclamationAnim()
    for _,v in pairs(animations) do
        if v.type == "exclamation" then
            v.shape.Rotation.Y = v.shape.Rotation.Y + 0.06

            if v.shape.Position.Y < v.originY - 3 and v.step == "down" then
                v.step = "up"
            end

            if v.shape.Position.Y > v.originY + 3 and v.step == "up" then
                v.step = "down"
            end

            if v.step == "up" then
                v.shape.Position.Y = v.shape.Position.Y + 0.1
            else 
                v.shape.Position.Y = v.shape.Position.Y - 0.1
            end
        end

    end
end

function addExclamationAnim(pos, asso, warning)
    warning = warning or false
    if haveExclamationAnim(asso) then
        return
    end

    local item = warning and Items.drouethug.ct_exclamation or Items.drouethug.ct_collect
    local animation = {
        type = "exclamation",
        shape = Shape(item),
        associate = asso,
        originY = pos.Y,
        step = "up"
    }

    animation.shape.Position = pos
    animation.shape.Pivot = { animation.shape.Width * 0.5, 0, animation.shape.Depth * 0.5 }
    animation.shape.CollisionGroups = {}
    animation.shape.CollidesWithGroups = {}
    animation.shape:SetParent(World)

    table.insert(animations, animation)
end

function haveExclamationAnim(asso)
    for k,v in pairs(animations) do
        if (v.associate == asso) then
            return true
        end
    end

    return false
end

function removeExclamationAnim(asso)
    for k,v in pairs(animations) do
        if (v.associate == asso) then
            v.shape:SetParent(nil)
            table.remove(animations, k)
        end
    end
end

---------------
-- EDIT MODE --
---------------

function enableEditMode(build)
    Camera:SetModeFree()
	Camera.Position = getTilePosition(10, 10)

    Camera.Position.Y = 430
	Camera.Rotation = Number3(math.pi / 2, 0, 0)

    -- Clear ambience vision
    Fog.Near = 1000

    -- Set gamemode to edit
    game.mode = GAMEMODE.EDIT
    Player:SetParent(nil)

    -- Create the preview building shape
    editMode.shape = Shape(BUILDINGS_ITEMS[build.type])
    editMode.shape:SetParent(World)
    editMode.shape.Position = getTilePosition(10, 10)
    editMode.shape.Scale = ITEM_SCALE
    editMode.shape.Pivot = { editMode.shape.Width * 0.5, 0, editMode.shape.Depth * 0.5}

    editMode.w = build.size.X
    editMode.h = build.size.Y
    editMode.x = 10
    editMode.y = 10

    editMode.shape.Position.X = editMode.shape.Position.X + BLOCK_HALF_SIZE * editMode.w
    editMode.shape.Position.Z = editMode.shape.Position.Z + BLOCK_HALF_SIZE * editMode.h

    editMode.build = build

    displayEditMenu()
    editDisplayZone()
end

function disableEditMode(buyBuilding)
    -- Set Camera to Player
    Camera:SetModeThirdPerson()
    Camera.Rotation = Number3(0, 0, 0)

    -- Reset Fog to default value
    Fog.Near = 300

    -- Set player gamemode
    game.mode = GAMEMODE.PLAYER
    Player:SetParent(World)

    -- Clear building
    editClearZone()
    editDestroyVegetables()
    editMode.shape:SetParent(nil)

    -- Create the building
    if buyBuilding then
        local building = addBuilding(editMode.x, editMode.y, editMode.w, editMode.h, editMode.build.type, editMode.build.category, editMode.shape.Rotation)

        building.level = 1
        payBuild(editMode.build)
        setBuildingBonus(building)
        setBonusFromHapinness(building)
    end

    -- Reset editMode
    editMode = {
        build = nil,
        mx = 0,
        my = 0,
        shape = nil,
        x = 0,
        y = 0,
        w = 0,
        h = 0,
        lastMove = 0,
        validButton = nil
    }

    Pointer:Hide()
end

function editModeMove()
    if game.mode ~= GAMEMODE.EDIT then return end
    
    local timePerSeconds = 6
    local nextMove = editMode.lastMove + 1 / timePerSeconds
    if (nextMove > 10) then
        nextMove = nextMove - 10
        if (game.clock > 9) then
            return
        end
    end

    if game.clock < nextMove then return end
    if editMode.mx == 0 and editMode.my == 0 then return end

    editMode.lastMove = game.clock

    editClearZone()

    -- Move Shape Preview
    if editMode.mx > 0 and editMode.x + 1 < 21 - editMode.w then
        editMode.x = editMode.x + 1
    end
    if editMode.mx < 0 and editMode.x - 1 >= 0 then
        editMode.x = editMode.x - 1
    end
    if editMode.my > 0 and editMode.y + 1 < 21 - editMode.h then
        editMode.y = editMode.y + 1
    end
    if editMode.my < 0 and editMode.y - 1 >= 0 then
        editMode.y = editMode.y - 1
    end

    local tilePosition = getTilePosition(editMode.x, editMode.y)

    editMode.shape.Position = tilePosition
    editMode.shape.Position.X = editMode.shape.Position.X + BLOCK_HALF_SIZE * editMode.w
    editMode.shape.Position.Z = editMode.shape.Position.Z + BLOCK_HALF_SIZE * editMode.h

    editDisplayZone()
end

function editManageOtherBuildings(clean)
    local isOnBuilding = false

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            if building and 
                editMode.x < building.position.X + building.size.X and
                editMode.x + editMode.w > building.position.X and
                editMode.y < building.position.Y + building.size.Y and
                editMode.y + editMode.h > building.position.Y
            then
                if building.category == "vegetable" then
                    if clean then
                        building.shape.Position.Y = 20
                    else
                        building.shape.Position.Y = -50
                    end
                else
                    isOnBuilding = true
                end
            end
        end
    end

    return isOnBuilding
end

function editDisplayZone()
    local color = Color.Green
    local canNotBuild = editManageOtherBuildings(false)

    if canNotBuild then
        color = Color.Red
        editMode.validButton.disabled = true
    else
        editMode.validButton.disabled = false
    end

    if editMode.build.power == "hapinness" and not canNotBuild then
        for x = editMode.x - editMode.build.range, editMode.x + editMode.build.range + editMode.w - 1 do
            for y = editMode.y - editMode.build.range, editMode.y + editMode.build.range + editMode.h - 1 do
                local start = getTilePositionForMap(x, y)

                for sY = 0, 3 do
                    for sX = 0, 3 do
                        local block = Map:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))

                        if block then
                            block:Replace(Color(255, 164, 48, 255))
                        end
                    end
                end
            end
        end
    end

    for x = 0, editMode.w - 1 do
        for y = 0, editMode.h - 1 do
            -- Set block color
            local start = getTilePositionForMap(editMode.x + x, editMode.y + y)
            
            for sY = 0, 3 do
                for sX = 0, 3 do
                    local block = Map:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))

                    if block then
                        block:Replace(color)
                    end
                end
            end
        end
    end
end

function editClearZone()
    local originalMap = Shape(Items.drouethug.ct_map)
    
    editManageOtherBuildings(true)
    for x = 0, editMode.w - 1 do
        for y = 0, editMode.h - 1 do
            local start = getTilePositionForMap(editMode.x + x, editMode.y + y)

            for sY = 0, 3 do
                for sX = 0, 3 do
                    local block = Map:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))
                    local originalBlock = originalMap:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))

                    if block then
                        block:Replace(originalBlock.Color)
                    end
                end
            end
        end
    end

    if editMode.build.power == "hapinness" then
        for x = editMode.x - editMode.build.range, editMode.x + editMode.build.range + editMode.w - 1 do
            for y = editMode.y - editMode.build.range, editMode.y + editMode.build.range + editMode.h - 1 do
                local start = getTilePositionForMap(x, y)

                for sY = 0, 3 do
                    for sX = 0, 3 do
                        local block = Map:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))
                        local originalBlock = originalMap:GetBlock(Number3(start.X + sX, start.Y, start.Z + sY))

                        if block then
                            block:Replace(originalBlock.Color)
                        end
                    end
                end
            end
        end
    end
end

function editRotateBuilding()
    editMode.shape.Rotation.Y = editMode.shape.Rotation.Y + math.pi / 2

    editClearZone()
    
    local saveW = editMode.w
    editMode.w = editMode.h
    editMode.h = saveW

    local tilePosition = getTilePosition(editMode.x, editMode.y)

    editMode.shape.Position = tilePosition
    editMode.shape.Position.X = editMode.shape.Position.X + BLOCK_HALF_SIZE * editMode.w
    editMode.shape.Position.Z = editMode.shape.Position.Z + BLOCK_HALF_SIZE * editMode.h

    editDisplayZone()
end

function editDestroyVegetables()
    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            if building and 
                editMode.x < building.position.X + building.size.X and
                editMode.x + editMode.w > building.position.X and
                editMode.y < building.position.Y + building.size.Y and
                editMode.y + editMode.h > building.position.Y
            then
                if building.category == "vegetable" then
                    building.shape:SetParent(nil)
                    city.map[y][x] = nil
                end
            end
        end
    end
end

-----------------
-- EVENTS PART --
-----------------

Client.DidReceiveEvent = function(event)
    getMyData(event)
end

function askServer(eventName)
    local event = Event()

    event.action = eventName
    event:SendTo(Server)
end

function saveMyData()
    local event = Event()

    event.action = "savePlayerData"
    
    event.inventory = inventory
    event.city = simplifyCity()
    
    event:SendTo(Server)
end

function saveMyInventory()
    local event = Event()

    event.action = "savePlayerInventory"
    event.inventory = inventory
    event:SendTo(Server)
end

function saveMyCity()
    local event = Event()

    event.action = "savePlayerCity"
    event.city = simplifyCity()

    event:SendTo(Server)
end

function getMyData(event)
    if event.action ~= "getPlayerData" then return end

    if not event.city and not event.inventory and not game.load then
        game.load = true
        initSystemBuildings()
        return initNewGame()
    end

    inventory = event.inventory

    if not game.load then
        respawnCity(event)
        game.load = true
    end
end

function simplifyCity()
    local simpCity = {
        system = {
            atm = {
                value = city.system.atm.value,
                run = city.system.atm.run,
                over = city.system.atm.over
            },
            wood = {
                enable = city.system.wood.enable,
                value = city.system.wood.value,
                run = city.system.wood.run,
                over = city.system.wood.over
            },
            stone = {
                enable = city.system.stone.enable,
                value = city.system.stone.value,
                run = city.system.stone.run,
                over = city.system.stone.over
            },
            workbench = {}
        },
        map = {},
        zone = city.zone
    }

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            if not simpCity.map[y] then
                simpCity.map[y] = {}
            end

            simpCity.map[y][x] = {
                type = building.type,
                category = building.category,
                position = number2ToTable(building.position),
                size = number2ToTable(building.size),
                rotation = number3ToTable(city.map[y][x].shape.Rotation),
                level = building.level,
            }
        end
    end

    return simpCity
end

function respawnCity(event)
    city = {
        system = {
            atm = {
                value = event.city.system.atm.value or 0,
                over = event.city.system.atm.over or false,
                run = event.city.system.atm.run or 0
            },
            wood = {
                enable = event.city.system.wood.enable or false,
                value = event.city.system.wood.value or 0,
                over = event.city.system.wood.over or false,
                run = event.city.system.wood.run or 0
            },
            stone = {
                enable = event.city.system.stone.enable or false,
                value = event.city.system.stone.value or 0,
                over = event.city.system.stone.over or false,
                run = event.city.system.stone.run or 0
            },
            workbench = {},
            punch = {
                state = 1,
                last = 0
            },
        },
        map = {},
        zone = event.city.zone
    }

    initSystemBuildings()
    refreshHUD()

    -- Add all buildings

    for y, _ in pairs(event.city.map) do
        for x, _ in pairs(event.city.map[y]) do
            local building = event.city.map[y][x]
            local pos = tableToNumber2(building.position)
            local size = tableToNumber2(building.size)
            local rotation = tableToNumber3(building.rotation)

            local newBuild = addBuilding(
                pos.X,
                pos.Y,
                size.X,
                size.Y,
                building.type,
                building.category,
                rotation
            )

            -- Utils builds
            newBuild.level = building.level
            
            -- Grass specific
            if newBuild.type == "grass" then
                newBuild.shape.CollisionGroups = {}
                newBuild.shape.CollidesWithGroups = {}
            end
        end
    end

    -- Add all bonus

    for y, _ in pairs(city.map) do
        for x, _ in pairs(city.map[y]) do
            local building = city.map[y][x]

            setBuildingBonus(building)
        end
    end
end

function number2ToTable(number)
    return {X=number.X, Y=number.Y}
end

function number3ToTable(number)
    return {X=number.X, Y=number.Y, Z=number.Z}
end

function tableToNumber2(table)
    return Number2(table.X, table.Y)
end

function tableToNumber3(table)
    return Number3(table.X, table.Y, table.Z)
end

-----------------
-- SERVER PART --
-----------------

local ERROR = {
    SAVE_DATA = "💀 Error during the save of your data",
    GET_DATA = "💀 Error during the fetch of your data",
}

Server.DidReceiveEvent = function(event)
    serverStorePlayerData(event)
    serverStorePlayerCity(event)
    serverStorePlayerInventory(event)
end

Server.OnPlayerJoin = function(player)
    serverSendPlayerData(player)
end

function serverStorePlayerData(event)
    if event.action ~= "savePlayerData" then return end

    local store = KeyValueStore(event.Sender.UserID)

    store:Set("city", JSON:Encode(event.city), "inventory", JSON:Encode(event.inventory), function(success)
        if not success then
            print(ERROR.SAVE_DATA)
        end
    end)
end

function serverStorePlayerCity(event)
    if event.action ~= "savePlayerCity" then return end

    local store = KeyValueStore(event.Sender.UserID)

    store:Set("city", JSON:Encode(event.city), function(success)
        if not success then
            print(ERROR.SAVE_DATA)
        end
    end)
end

function serverStorePlayerInventory(event)
    if event.action ~= "savePlayerInventory" then return end

    local store = KeyValueStore(event.Sender.UserID)

    store:Set("inventory", JSON:Encode(event.inventory), function(success)
        if not success then
            print(ERROR.SAVE_DATA)
        end
    end)
end

function serverSendPlayerData(player)
    local store = KeyValueStore(player.UserID)

    store:Get("city", "inventory", function(success, results)
        if not success then
            print(ERROR.GET_DATA)
        end

        local response = Event()

        response.action = "getPlayerData"

        if (results.city) then
            response.city = JSON:Decode(results.city)
        end
        
        if (results.inventory) then
            response.inventory = JSON:Decode(results.inventory)
        end

        response:SendTo(player)
    end)
end