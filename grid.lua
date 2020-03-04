nbVaccin = 0
map = {}

for l=1, 40 do
    map[l] = {}
    for c=1, 20 do
        map[l][c] = 0
    end
end

function initMap()
    for l=1, 40 do
        map[l] = {}
        for c=1, 20 do
            map[l][c] = 0
        end
    end
    return map
end
--[[ map = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        } ]]
-- dimension de la tile
local dim_tile = #map

function drawLines()
    love.graphics.setColor(255, 255, 255, 0.2)
    for x=0, 800, 20 do
        love.graphics.line(x, 0, x, 400 )
    end
    for y=0, 400, 20 do
        love.graphics.line(0, y, 800, y)
    end
    for x=0, 800, 40 do
        love.graphics.line(x, 0, x, 400 )
    end
    for y=0, 400, 40 do
        love.graphics.line(0, y, 800, y)
    end
end

function drawMap()
    for l=1, #map do
        for c=1, #map[l] do
            if map[l][c] == 1 then
                love.graphics.setColor(0, 255, 0, 0.5)
                --love.graphics.rectangle("fill", (l*dim_tile)-dim_tile, (c*dim_tile)-dim_tile, 40, 40)
                love.graphics.circle("fill", c*dim_tile-20, l*dim_tile-20, 20)
            end
            if map[l][c] == 2 then
                love.graphics.setColor(255, 0, 0, 0.5)
                --love.graphics.rectangle("fill", (l*dim_tile)-dim_tile, (c*dim_tile)-dim_tile, 40, 40)
                love.graphics.circle("fill", c*#map-20, math.ceil(l*10-20), 20)
            end
        end
    end
end

function vaccinFactory(x, y, btn, istouch, pressed)
        local l, c = wrapperColLine(y, x)
        --print("ligne: "..l, "colone: "..c)
        local currentItem = map[l][c]
        if btn == 1 then
            --if l<=10 and c<=20 then
                if nbVaccin < maxVaccins then
                    if currentItem == 0 then
                        nbVaccin = nbVaccin + 1
                        map[l][c] = 1
                    end
                end
                    if currentItem == 1 then
                        map[l][c] = 0
                        nbVaccin = nbVaccin - 1
                    end
            --end
    end
end