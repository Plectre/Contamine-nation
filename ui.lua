function drawUi()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print("Time: " ..currentTime, 200, 450)
    local percent = math.floor(nbZoneConta/2)
    love.graphics.print("Taux de contamination: " ..percent.."%", 200, 500)
    love.graphics.print("Max Vaccin: " ..maxVaccins, 200, 550)
end