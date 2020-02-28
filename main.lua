-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end
--kiki mou
require("init")
require("grid")
require("utils")
require("virus")
require("ui")

function love.load()
    print("width:"..width)
    print("height:"..height)
end

function love.update(dt)
    mouseX,mouseY = love.mouse.getPosition()
    updateVirus(dt)
    tick(2)
end

function love.draw()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.draw(bg,-20,0,0,0.8,0.7)
    drawMap()
    drawLines()
    drawVirus()
    drawUi()
end


function love.mousepressed(x, y, btn, istouch, pressed)
    vaccinFactory(x, y, btn, istouch, pressed)
end