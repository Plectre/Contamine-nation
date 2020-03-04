local string = "Vous faite parti de l'Organisation des Morts en Sursis (OMS)"
local string_2 = "Votre mission contenir et eradiquer le virus krna_XII. Vous avez à votre disposition un nombre de vaccins limités (5) actifs"
local string_3 = "Le virus se deplace d'Est en Ouest et du Nord au Sud, poser un vaccin sur la trjectoire suffit à le stopper... mais ..."
local string_3 = "Attention des foyers d'infections risque de se propager et contaminer toute le planête"
local string_4 = "Vous etes le dernier espoir professeur"
function drawSplashScreen()
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.print(string, 180, 410)
    love.graphics.print(string_2, 20, 430)
    love.graphics.print(string_3, 20, 450)
    love.graphics.print(string_4, 20, 470)
    love.graphics.print("APPUYER SUR ESPACE POUR JOUER", 200, 550, 0, 2, 2)
end
function drawGameOver()
    drawMap()
    drawLines()
    drawVirus()
    drawUi()
    love.graphics.print("APPUYER SUR ESPACE POUR JOUER", 200, 550, 0, 2, 2)
end