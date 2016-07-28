local composer = require( "composer" )

local scene = composer.newScene()

composer.removeScene( "level_select",false )
composer.removeScene( "level_med",false )
composer.removeScene( "level_easy",false )
local physics=require("physics")
physics.start()

physics.setGravity(0,9.8)
display.setDefault( "background", 0, 0, 0 )

--physics.setDrawMode("hybrid")


display.setStatusBar(displayHiddenStatusBar)

system.activate("multituch")

local background3=display.newImageRect("images/sky1.jpg",display.contentWidth,display.contentHeight)
background3.x=display.contentCenterX
background3.y=display.contentCenterY

local floor=display.newImageRect("images/grass1.png",display.contentWidth,40)
floor.x=display.contentCenterX
floor.y=display.contentHeight-20

local ball1=display.newImage("images/ball5.png",display.contentCenterX-100,display.contentCenterY)
local ball2=display.newImage("images/ball5.png",display.contentCenterX+100,display.contentCenterY)
local ball3=display.newImage("images/ball5.png",display.contentCenterX,display.contentCenterY)

local leftWall=display.newRect(0,0,1,display.contentHeight*2)
local rightWall=display.newRect(display.contentWidth,0,1,display.contentHeight*2)
local ceiling=display.newRect(0,0,display.contentWidth*2,1)

physics.addBody(leftWall,"static",{bounce=0.1,friction=2})
physics.addBody(rightWall,"static",{bounce=0.1,friction=2})
physics.addBody(ceiling,"static",{bounce=0.1,friction=2})


physics.addBody(ball1,{bounce=.4,radius=35,friction=1.0})
physics.addBody(ball2,{bounce=.3,radius=35,friction=1.0})
physics.addBody(ball3,{bounce=.2,radius=35,friction=1.0})

physics.addBody(floor,"static",{bounce=0,friction=10})
local soundTable={
    ballbouncing=audio.loadSound("ball kick.mp3")
}
local backgroundmusic=audio.loadStream("background music.mp3")
audio.play(backgroundmusic,{channel=1,loop=-1,fadein=1500})
audio.setVolume(0.7,{channel=1})


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
    audio.play(soundTable["ballbouncing"])
    scoreText.text=score
    local ball1=event.target
    ball1:applyLinearImpulse(0,-0.6,event.x*1.5,event.y*2)
   -- ball2:applyLinearImpulse(0,-0.6,event.x*1.5,event.y*2)
    
    end
end

ball1:addEventListener("touch",push)
ball2:addEventListener("touch",push)
ball3:addEventListener("touch",push)



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














-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene