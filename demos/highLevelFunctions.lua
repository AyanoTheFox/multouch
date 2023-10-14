function love.load(_argc, _argv)
    --&libs&--
    multouch = require("libs/touches")
    --&vars&--
    --&instances&--
    touches = multouch.new()
    --%data types%--
    font = love.graphics.setNewFont(12) --defaultFont
    --&strings&--
    dir = "none"
    --&numbers&--
    zoom = 1
    --&cmds&--
    love.graphics.setDefaultFilter("nearest", "nearest") --defaultfilter
end

function love.draw()
    love.graphics.print(touches:dist(1, 3), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 - 32, 0, 2, 2, font:getWidth(touches:dist(1, 3)) / 2)
    love.graphics.print(dir, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 2, 2, font:getWidth(dir) / 2, font:getHeight() / 2)
    love.graphics.print(zoom, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 2, 2, font:getWidth(zoom) / 2, -font:getHeight() / 2)
    love.graphics.print(touches:getTimesTouched(), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + 32, 0, 2, 2, font:getWidth(touches:getTimesTouched()) / 2)
    love.graphics.print(tostring(touches:wasTapped(10)), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + 48, 0, 2, 2, font:getWidth(tostring(touches:wasTapped(10))) / 2)
    love.graphics.setColor(1, 1, 1, .25)
    touches:display()
    love.graphics.setColor(1, 1, 1, 1)
end

function love.update(elapsed)
    zoom = touches:pinch(.1, zoom, 2)
    dir = touches:swipe(
        function(id, x, y, dx, dy, pressure)
            return "right"
        end,
        function(id, x, y, dx, dy, pressure)
            return "down"
        end,
        function(id, x, y, dx, dy, pressure)
            return "left"
        end,
        function(id, x, y, dx, dy, pressure)
            return "up"
        end,
        function(id, x, y, dx, dy, pressure)
            return "none"
        end
    )
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    touches:touchpressed(id, x, y, dx, dy, pressure)
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    touches:touchmoved(id, x, y, dx, dy, pressure)
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    touches:touchreleased(id, x, y, dx, dy, pressure)
end