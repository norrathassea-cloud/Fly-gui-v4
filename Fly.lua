local FlySystem = {}

function FlySystem.Start(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")

	local flying = false
	local speed = 50

	local bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(1,1,1) * 100000

	local UIS = game:GetService("UserInputService")
	local RS = game:GetService("RunService")

	UIS.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.F then
			flying = not flying
			
			if flying then
				bodyVelocity.Parent = hrp
			else
				bodyVelocity.Parent = nil
			end
		end
	end)

	RS.RenderStepped:Connect(function()
		if flying then
			local dir = workspace.CurrentCamera.CFrame.LookVector
			bodyVelocity.Velocity = dir * speed
		end
	end)
end

return FlySystem
