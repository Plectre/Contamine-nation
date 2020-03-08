function drawVictory()
    if gameState == "victory" then
        love.graphics.setColor(0, 255, 0, 1)
        love.graphics.print("Time: " ..timeRemaining, 20, 20)
        love.graphics.print("Taux de contamination: " ..getNbZoneConta().."%", 20, 450)
        love.graphics.print("VICTORY IS YOURS !!! ", 200, 200, 0, 4)
        love.graphics.print("You save the world !!! ", 200, 300, 0, 3)
    end
end