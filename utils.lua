local debug = false
local oldTime = 0
local oldVaccin = 0


function resetColor(alpha)
    love.graphics.setColor(255, 255, 255, alpha)
end
function getZoneConta()
    local rateOfContamination  = math.floor(nbZoneConta/20*10)
    return rateOfContamination
end
function getNbZoneConta()
    local rateOfContamination  = math.floor(nbZoneConta/20*10)
    if nbZoneConta > 0  then
        if rateOfContamination < maxContamination then
            return tostring(rateOfContamination);
        else
            --nbZoneConta = 0
            --rateOfContamination = 0
            --gameState = "gameOver"
        end
    end
    return 0;
end
function addFoyer()
    nbFoyer = nbFoyer + 1
    if nbFoyer >= 5 then
        local l = math.random(1, 10)
        local c = math.ceil(math.random(1, 20))
        while map[l][c] == 0 do
            map[l][c] = 2
            nbZoneConta = nbZoneConta + 1
            nbFoyer = 0
        end
    end
end

function tick(tempo)
    local currentTime = os.clock()
    local tic = oldTime + tempo
    if  currentTime >= tic then
        virusFactory()
        oldTime = currentTime
    end
end
function addVaccins()
    local cTime = updateTime()
    local newVaccin = oldVaccin + timeBeforeVaccin
    if cTime >= newVaccin then
        maxVaccins = maxVaccins + 1
        oldVaccin = cTime
    end
end
function wrapperColLine(y, x)
    local l = math.floor(y/40)+1
    local c = math.floor(x/40)+1
    return l,c
end

function updateTime()
    currentTime = math.floor(os.clock())
    return currentTime
end
-- Fin du jeu avec victoire
function timeToEnd()
    local gameTime = startTime + timeToEndGame
    if currentTime >= gameTime  then
        gameState = "victory"
        startTime = updateTime()
    end
end
-- Fin du jeu avec defaite
function isLooses()
    if tonumber(getZoneConta()) >= maxContamination then
        gameState = "loose"
    end
end