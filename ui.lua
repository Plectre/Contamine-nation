function drawUi()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print("Time: " ..timeRemaining, 20, 20)
    love.graphics.print("Taux de contamination: " ..tostring(getNbZoneConta()).." / "..maxContamination.."%", 20, 450)
    love.graphics.print("Max Vaccin: "..nbVaccin.." / " ..maxVaccins, 300, 450)
end