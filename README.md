# MulTouch
 Multouch is a libary to love2d framework engine, it's made in lua
and create low and high level functions, this libary was made for mobile devices
and is in the version **0.0.5**, start devlopment **12th octuber 2023**.

# Features
- Free of external dependences
- Works on android
- Simple use
- It is splited in low level and high level functions
- custom screen areas for touch events

# Quick start
```lua
function love.load()
    multouch = require("libs/multouch")
    touches = multouch.new()
end

function love.draw()
    touches:display() --it is a debug function used to show the touches infos
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
```

# [User manual](https://github.com/AyanoTheFox/multouch.wiki.git)