function drawLoose()
    if gameState == "loose" then
        love.graphics.setColor(255, 0, 0, 1)
        love.graphics.print("Time: " ..timeRemaining, 20, 20)
        love.graphics.print("Le taux de contamination maximun est atteint: " ..tostring(getZoneConta()).."/"..maxContamination.."%", 20, 450)
        love.graphics.print("YOU LOOSE ! ", 200, 200, 0, 4)
        drawMap()
    end
end