window.Ball =
  x: 25
  y: 25
  radius: 5
  context: MazeCanvas.context()

  draw: ->
    @context.beginPath()
    @context.arc(@x, @y, @radius, 0, Math.PI * 2)
    @context.closePath()
    @context.fillStyle = "#C4C4C4"
    @context.fill()

  hasHit: (x, y, width, height) ->
    @x > x && @y > y && @x < (x + width) && @y < (y + height)

  reset: ->
    @x = 25
    @y = 25
