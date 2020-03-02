local debug = false
local oldTime = 0
local oldVaccin = 0
function resetColor(alpha)
    love.graphics.setColor(255, 255, 255, alpha)
end

function addFoyer()
    nbFoyer = nbFoyer + 1
    if nbFoyer >= 5 then
        local l = math.random(1, #map)
        local c = math.ceil(math.random(1, #map)/2)
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
function wrapperColLine(x, y)
    local c = math.floor(x/40)+1
    local l = math.floor(y/40)+1
    return l,c
end

function updateTime()
    currentTime = math.floor(os.clock())
    return currentTime
end