ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'disco', Config.MaxInService)
end

TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	
	if phoneNumber == 'disco' then
		for i=1, #xPlayers, 1 do
			
			local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])

			if xPlayer2.job.name == 'disco' then
				TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, 'Appel Disco')
			end
		end
	end
end)
-------------- Récupération menthe -------------
local function Harvest(source)

	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('menthe').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('menthe', 10)
					
				Harvest(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest')
AddEventHandler('esx_discojob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Menthe~s~...')
	Harvest(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest')
AddEventHandler('esx_discojob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)
------------ Récupération pommedeterre --------------
local function Harvest2(source)

	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local FixToolQuantity  = xPlayer.getInventoryItem('pommedeterre').count
			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~plus de place')				
			else
                xPlayer.addInventoryItem('pommedeterre', 8)
					
				Harvest2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest2')
AddEventHandler('esx_discojob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Pomme de terre~s~...')
	Harvest2(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest2')
AddEventHandler('esx_discojob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)
----------------- Récupération raisin----------------
local function Harvest3(source)

	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('raisin').count
            if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~plus de place')					
			else
                xPlayer.addInventoryItem('raisin', 6)
					
				Harvest3(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest3')
AddEventHandler('esx_discojob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Raisin~s~...')
	Harvest3(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest3')
AddEventHandler('esx_discojob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)
------------ Craft mojito -------------------
local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('menthe').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Menthe')		
			else   
                xPlayer.removeInventoryItem('menthe', 2)
                xPlayer.addInventoryItem('mojito', 1)
					
				Craft(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft')
AddEventHandler('esx_discojob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Mojito~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft')
AddEventHandler('esx_discojob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)
------------ Craft Vodka --------------
local function Craft2(source)

	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local FixToolQuantity  = xPlayer.getInventoryItem('pommedeterre').count
			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Pomme de Terre')				
			else
                xPlayer.removeInventoryItem('pommedeterre', 2)
                xPlayer.addInventoryItem('vodka', 1)
					
				Craft2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft2')
AddEventHandler('esx_discojob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Vodka~s~...')
	Craft2(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft2')
AddEventHandler('esx_discojob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)
----------------- Craft champagne ----------------
local function Craft3(source)

	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('raisin').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Raisin')					
			else
                xPlayer.removeInventoryItem('raisin', 2)
                xPlayer.addInventoryItem('champagne', 1)
					
				Craft3(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft3')
AddEventHandler('esx_discojob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Champagne~s~...')
	Craft3(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft3')
AddEventHandler('esx_discojob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)
