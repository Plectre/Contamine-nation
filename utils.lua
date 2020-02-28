local debug = false
local oldTime = 0

function resetColor(alpha)
    love.graphics.setColor(255, 255, 255, alpha)
end

function tick(tempo)
    local currentTime = os.clock()
    local tic = oldTime + tempo
    if  currentTime >= tic then
        virusFactory()
        oldTime = currentTime
    end
end

function wrapperColLine(x, y)
    local c = math.floor(x/40)+1
    local l = math.floor(y/40)+1
    return l,c
end