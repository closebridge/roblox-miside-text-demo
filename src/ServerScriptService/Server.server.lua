local Players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local textSystem = require(replicatedStorage.Shared["textSystem.module"])

game.Players.PlayerAdded:Connect(function(player: string)
	player.Chatted:Connect(function(message: string)
		print(player, message)

		local character = Players:FindFirstChild(tostring(player)).Character
		local playerHRP: Instance = character:FindFirstChild("HumanoidRootPart")

		print(playerHRP)

		task.spawn(function()
			textSystem.displayText3D({
				Text = message,
				-- Gradient = {
				-- 	Gradient1 = {0.768627, 0.321569, 0.443137},
				-- 	Gradient2 = {0.427451, 0.494118, 0.784314}
				-- },
				Gradient = nil,
				Placement = 0,
				Character = player,
				AppearStyle = 0,
				AnimationTiming = 0.3, -- The default is 0.1
				textXGap = 0.2,
				textYGap = 0.5,
				EndStyle = 0,
				flatTextLocation = playerHRP
		})
		end)
	end)
end)