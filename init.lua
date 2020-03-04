gameState = "splashScreen"

height = love.graphics.getHeight()
width = love.graphics.getWidth()

tileX = 0
tileY = 0
tic = 0
currentTime = 0
maxVaccins = 5

newVacccin = 0
timeBeforeVaccin = 10

love.window.setTitle("Contamin Nation")
bg = love.graphics.newImage("img/map.png")