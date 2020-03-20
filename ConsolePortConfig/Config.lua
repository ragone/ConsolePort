local UI, an, L = ConsolePortUI, ...
local db = ConsolePort:GetData()
local Config = ConsolePortConfig

Config:LoadArt()
Config:StartEnvironment()

UI:RegisterFrame(Config, 'Config', false, true)
	-- Call Frame:LoadArt() to initiate art handler -->
	-- Call Frame:DrawIndex(headerFunc) to draw headers -->
	-- Call Frame:StartEnvironment() to initiate secure environment -->


Config:SetClassGradient(Config.BG, 1)
Config:SetClassGradient(Config.Container.BG, 0.75)
Config:SetClassGradient(Config.Footer.BG, 1)

Config:AddHeader({
	name = 'Test',
	text = 'Test',
	redraw = true,
})


Config:AddHeader({
	name = 'Test2',
	text = 'Test2',
	redraw = true,
})
