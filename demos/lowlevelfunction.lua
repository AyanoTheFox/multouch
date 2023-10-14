function love.load()
    multouch = require("libs/multouch")
    touches = multouch.new()
end

function love.draw()
    love.graphics.setColor(1, 1, 1, .2)
    for x = 0, love.graphics.getWidth(), 32 do
        for y = 0, love.graphics.getHeight(), 32 do
            love.graphics.rectangle("line", x, y, 32, 32)
        end
    end
    love.graphics.setColor(0, 1, 0, 1)
    for _, touch in ipairs(love.touch.getTouches()) do
        local id, x, y, dx, dy, pressure = touches:update(touch)
        love.graphics.rectangle("line", math.floor(x / 32) * 32, math.floor(y / 32) * 32, 32, 32)
    end
    love.graphics.setColor(1, 1, 1, 1)
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