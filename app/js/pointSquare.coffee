window.PointSquare =
  x: 0
  y: 0
  width: 20
  height: 20
  context: MazeCanvas.context()

  ramdomiseiCoordinates: ->
    newX = Math.random() * MazeCanvas.width()
    newY = Math.random() * MazeCanvas.height()
    if (newX > MazeCanvas.width() - @width) then newX -= @width
    if (newY > MazeCanvas.height() - @height) then newY -= @height
    @x = newX
    @y = newY

  draw: ->
    @context.beginPath()
    @context.rect(@x, @y, @width, @height)
    @context.fillStyle = "#C4C4C4"
    @context.fill()

  hit: ->
    Ball.x > @x && Ball.x < @x + @width && Ball.y > @y && Ball.y < @y + @height
