local composer = require( "composer" )

local scene = composer.newScene()
--physics.setDrawMode("hybrid")
local composer = require("composer")


display.setDefault( "background", 0, 0, 0)


local myText = display.newText( "SELECT LEVEL", display.contentWidth*.5, 50, "AARDV.ttf",30 )

myText:setFillColor(1,1,1)
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent1( event )

    if ( "ended" == event.phase ) then
      composer.gotoScene("level_easy") 
      display.remove(button1)
      display.remove(button2)
      display.remove(button3) 
    
    end
end


local function handleButtonEvent2( event )

    if ( "ended" == event.phase ) then
      composer.gotoScene("level_med")   
     display.remove(button1) 
     display.remove(button2)
     display.remove(button3)
    end
end

local function handleButtonEvent3( event )

    if ( "ended" == event.phase ) then
      composer.gotoScene("level_hard")  
      display.remove(button1)
      display.remove(button2)
      display.remove(button3)
      
    end
end

-- Create the widget
local button1 = widget.newButton(
    {      
        left =display.contentWidth*.5-100,
        top = 100,
        defaultFile = "images/button1.png",
        id = "button1",
        label = "EASY",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = handleButtonEvent1
    }
    )

local button2 = widget.newButton(
    {      
        left =display.contentWidth*.5-100,
        top = 200,
        defaultFile = "images/button1.png",
        id = "button2",
        label = "MEDIUM",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = handleButtonEvent2
    }
    )

local button3 = widget.newButton(
    {      
        left =display.contentWidth*.5-100,
        top = 300,
        defaultFile = "images/button1.png",
        id = "button3",
        label = "HARD",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = handleButtonEvent3
    }
    )


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

    button1:removeSelf()
    button1=nil
    button2:removeSelf()
    button2=nil
    button3:removeSelf()
    button3=nil
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