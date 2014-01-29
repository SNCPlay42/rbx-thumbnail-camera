local toolbar = plugin:CreateToolbar("Camera Saving/Loading")

local storageValue = workspace:FindFirstChild("SavedCameraPos")
local focusValue = storageValue and storageValue:FindFirstChild("Focus")

while not workspace.CurrentCamera do wait() end
local camera = workspace.CurrentCamera

local buttonSave = toolbar:CreateButton("", "Save the camera postition", "http://www.roblox.com/asset/?id=2611425")
local buttonLoad = toolbar:CreateButton("", "Restore the camera position", "http://www.roblox.com/asset/?id=2611441")

buttonSave.Click:connect(function()
	if not storageValue then
		storageValue = Instance.new("CFrameValue", workspace)
		storageValue.Name = "SavedCameraPos"
		focusValue = Instance.new("CFrameValue", storageValue)
		focusValue.Name = "Focus"
	end
	storageValue.Value = camera.CoordinateFrame
	focusValue.Value = camera.Focus
end)

buttonLoad.Click:connect(function()
	if not storageValue then print"No camera to restore!"; return end
	camera.CoordinateFrame = storageValue.Value
	camera.Focus = focusValue.Value
end)
