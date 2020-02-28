viruses = {}
foyers = {}
cpFoyer = 0
rndDir = 0
nbVirus = 0
virusHeight = 5
offsetVirus = virusHeight*4
function virusFactory()
    math.randomseed(os.clock())
    rndDir = math.random(1,4) -- random direction

    virus = {   dir = "",
                x = 0,
                y = 0,
                speed = math.random(200,400)}

    if rndDir == 1 then virus.dir="west" virus.x = -20 virus.y = math.floor(math.random(1,9)*40)+offsetVirus elseif
        rndDir == 2 then virus.dir="nord" virus.x = math.floor(math.random(1,20)*40)+offsetVirus virus.y = -20 elseif
        rndDir == 3 then virus.dir="south" virus.x = math.floor(math.random(1,20)*40)+offsetVirus virus.y = 379 elseif
        rndDir == 4 then virus.dir="east" virus.x = 820 virus.y = math.floor(math.random(1,9)*40)-offsetVirus
    end
    table.insert(viruses, virus)
    return viruses
end

function drawVirus()
    for i, virus in ipairs(viruses) do
        love.graphics.setColor(255, 0, 0, 1)
        love.graphics.circle("fill", virus.x, virus.y, virusHeight)
        love.graphics.setColor(255, 255, 255, 1)
    end
end

function updateVirus(dt)
    for idx, v in ipairs(viruses) do
        -- out of screen
        if v.x>850 or v.x < -20 then
            table.remove(viruses, idx)
        end
        if v.y>= 390 or v.y<-20 then
            table.remove(viruses, idx )
        end
        -- from direction
        if v.dir == "west" then
            v.x = v.x + v.speed*dt
        end
        if v.dir == "nord" then
            v.y = v.y + v.speed*dt
        end
        if v.dir == "east" then
            v.x = v.x - v.speed*dt
        end
        if v.dir == "south" then
            v.y = v.y - v.speed*dt
        end
        local l, c = wrapperColLine(v.x, v.y)
        virusIsCollide(l, c, v, idx)
    end
end

 function virusIsCollide(l,c,v,idx)
    -- Detection de collision
    if l>=1 and l<=20 and c >=1 and c<=40 then
        if map[l][c] == 1 then
            table.remove(viruses, idx)
            virusFactory()
            map[l][c] = 0
            nbVaccin = nbVaccin - 1
        end
    end
 end

 function foyerInfection(v)
    local l, c = wrapperColLine(v.y, v.x)
    local foyer = {}
    print(map[l][c])
    if map[l][c] ~= 2 and map[l][c] ~= 1 then
        map[l][c] = 2
        foyer.l = l
        foyer.c = c
        table.insert(foyers, foyer)
        cpFoyer = cpFoyer + 1
    else
        return
    end
 end