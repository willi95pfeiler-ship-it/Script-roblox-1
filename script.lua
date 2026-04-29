local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Attendre que tout soit chargé
wait(1)

for _, v in pairs(char:GetDescendants()) do
    if v:IsA("Motor6D") then
        -- Modifier la position des joints
        v.C0 = v.C0 * CFrame.Angles(
            math.rad(math.random(-30,30)),
            math.rad(math.random(-30,30)),
            math.rad(math.random(-30,30))
        )
    end
end
