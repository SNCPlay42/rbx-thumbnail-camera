local plugin = PluginManager():CreatePlugin()
local toolbar = plugin:CreateToolbar("Camera Saving/Loading")

local storageValue = workspace:FindFirstChild("SavedCameraPos")
local focusValue = storageValue and storageValue:FindFirstChild("Focus")

local camera = workspace.CurrentCamera

local buttonSave = toolbar:CreateButton("", "Save the camera postition", "camera_edit.png")
local buttonLoad = toolbar:CreateButton("", "Restore the camera position", "camera_go.png")

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
