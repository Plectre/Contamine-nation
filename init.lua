gameState = "splashScreen"

nbZoneConta = 0
maxContamination = 5
currentTime = 0
maxVaccins = 5
tileX = 0
tileY = 0
tic = 0.2 -- Vitesse du jeux
newVacccin = 0
timeBeforeVaccin = 8 -- Nombre de virus stoppés avant nouveau vaccin
startTime = 0
timeToEndGame = 5 -- Temps de jeu avant victoire
timeRemaining = 0

function initGame()
    viruses = {}
    nbZoneConta = 0
    currentTime = 0
    maxVaccins = 5
    nbVaccin = 0
    nbZoneConta = 0
    initMap()
    startTime = updateTime()
end

height = love.graphics.getHeight()
width = love.graphics.getWidth()

love.window.setTitle("Contamin Nation")
bg = love.graphics.newImage("img/map.png")