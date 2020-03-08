-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

require("init")
require("splash")
require("grid")
require("utils")
require("virus")
require("ui")
require("victory")
require("loose")

function love.load()
    initGame()
    print("width:"..width)
    print("height:"..height)
end

function love.update(dt)
    mouseX,mouseY = love.mouse.getPosition()
    if gameState == "game" then
        isLooses()
        timeRemaining = math.abs(math.ceil((startTime + timeToEndGame) - updateTime()))
        updateVirus(dt)
        updateTime()
        tick(tic)
        addVaccins()
        timeToEnd()
    end
    if gameState == "gameOver"  then
        initGame()
    end
    if gameState == "victory"  then
        initGame()
        startTime = os.clock()
    end
end

function love.draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.draw(bg,-20,0,0,0.8,0.7)

    if gameState == "splashScreen" then
        drawMap()
        drawLines()
        drawSplashScreen()
    end
    if gameState == "game" then
        drawMap()
        drawLines()
        drawVirus()
        drawUi()
    end
    if gameState == "gameOver" then
        drawGameOver()
    end
    if gameState == "victory"  then
        drawVictory()
        drawMap()
        drawLines()
    end
    if gameState == "loose"  then
        drawLoose()
    end
end

function love.mousepressed(x, y, btn, istouch, pressed)
    if gameState == "game" then
        vaccinFactory(x, y, btn, istouch, pressed)
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        if gameState == "gameOver" then
            gameState = "game"
        end
        if gameState == "victory" then
            gameState = "game"
        end
        if gameState == "splashScreen" then
            gameState = "game"
        end
        if gameState == "loose" then
            gameState = "game"
            initGame()
        end
    end
end