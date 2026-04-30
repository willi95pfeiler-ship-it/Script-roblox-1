local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local savedPosition = nil

-- Fonction pour récupérer le personnage
local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

-- Quand une touche est pressée
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	local character = getCharacter()
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end
	
	-- Appuie sur Y → sauvegarde position
	if input.KeyCode == Enum.KeyCode.Y then
		savedPosition = humanoidRootPart.Position
		print("Position enregistrée :", savedPosition)
	end
	
	-- Appuie sur F → téléportation
	if input.KeyCode == Enum.KeyCode.F then
		if savedPosition then
			humanoidRootPart.CFrame = CFrame.new(savedPosition + Vector3.new(0, 3, 0))
			print("Téléporté !")
		else
			warn("Aucune position enregistrée !")
		end
	end
end)
