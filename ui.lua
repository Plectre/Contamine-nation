function drawUi()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print("Time: " ..currentTime, 20, 20)
    love.graphics.print("Taux de contamination: " ..getNbZoneConta().."%", 20, 450)
    love.graphics.print("Max Vaccin: " ..maxVaccins, 300, 450)
end