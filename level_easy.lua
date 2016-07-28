local composer = require( "composer" )

local scene = composer.newScene()

composer.removeScene( "level_select",false )
composer.removeScene( "level_med",false )
composer.removeScene( "level_hard",false )

local physics=require("physics")
physics.start()

physics.setGravity(0,9.8)
display.setDefault( "background", 0, 0, 0 )

--physics.setDrawMode("hybrid")

display.setStatusBar(displayHiddenStatusBar)

system.activate("multituch")

local background1=display.newImageRect("images/sky1.jpg",display.contentWidth,display.contentHeight)
background1.x=display.contentCenterX
background1.y=display.contentCenterY

local floor=display.newImageRect("images/grass1.png",display.contentWidth,40)
floor.x=display.contentCenterX
floor.y=display.contentHeight-20

local ball=display.newImage("images/ball5.png",display.contentCenterX,display.contentCenterY)

local leftWall=display.newRect(0,0,1,display.contentHeight*2)
local rightWall=display.newRect(display.contentWidth,0,1,display.contentHeight*2)
local ceiling=display.newRect(0,0,display.contentWidth*2,1)

physics.addBody(leftWall,"static",{bounce=0.1,friction=2})
physics.addBody(rightWall,"static",{bounce=0.1,friction=2})
physics.addBody(ceiling,"static",{bounce=0.1,friction=2})


physics.addBody(ball,{bounce=.2,radius=35,friction=1.0})
physics.addBody(floor,"static",{bounce=0,friction=10})
local soundTable={
    ballbouncing=audio.loadSound("ball kick.mp3")
}


local score = 0
local scoreText = display.newText(score, display.contentWidth*0.5+100, 15,native.systemFontBold, 30)
scoreText:setFillColor( 0, 0, 0 )

local high=0;
local highscore=display.newText("Highscore",display.contentWidth*0.1+35,10,"AARDV.ttf", 25)
highscore:setFillColor( 0, 0, 0 )

local highscore=display.newText(high,display.contentWidth*0.1+40,40,native.systemFontBold, 30)
highscore:setFillColor( 0, 0, 0 )



function push(event)
    if ( event.phase == "began" ) then
    score = score + 1
     
     audio.play(soundTable["ballbouncing"],{channel=2})
     audio.setVolume(1,{channel=2})
     scoreText.text=score
    ball:applyLinearImpulse(0,-0.6,event.x*1.5,event.y*2)
    end
end

ball:addEventListener("touch",push)


local function  oncollision( event )
    if (event.phase=="began") then
        if (score>high) then
        high=score
    end 
    score=0
        highscore.text=high
        
        scoreText.text=score
    -- body
end
end
floor:addEventListener("collision",oncollision)


return scene