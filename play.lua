local composer = require( "composer" )

local scene = composer.newScene()
display.setDefault( "background",  0, 0, 0)
local background=display.newImageRect("images/logo1.png",display.contentWidth*.5,display.contentHeight*.5)
background.x=display.contentCenterX
background.y=display.contentCenterY-100
 widget = require( "widget" )



-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
      
         composer.gotoScene("level_select") 
         display.remove(background)
         background=nil
        return background
    end
end

-- Create the widget
button1 = widget.newButton(
    {      
        left =display.contentWidth*.5-100,
        top = 300,
        defaultFile = "images/button1.png",
        id = "button",
        label = "PLAY",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        onEvent = handleButtonEvent
    }
    )

 



return scene