gameState = "splashScreen"

nbZoneConta = 0
maxContamination = 2
currentTime = 0
maxVaccins = 5

tileX = 0
tileY = 0
tic = 2
newVacccin = 0
timeBeforeVaccin = 10

function initGame()
    map={}
    viruses = {}
    nbZoneConta = 0
    currentTime = 0
    maxVaccins = 5
    nbVaccin = 0
    initMap()
end

height = love.graphics.getHeight()
width = love.graphics.getWidth()



love.window.setTitle("Contamin Nation")
bg = love.graphics.newImage("img/map.png")