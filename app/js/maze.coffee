window.Maze =
  x: 25
  y: 25
  moveXBy: 0
  moveYBy: 0
  sensitivity: 2
  wallsForLevel: []
  context: MazeCanvas.context()

  start: ->
    @clearCanvas()
    @setBackground()
    @drawMaze()
    @drawFinish()
    @checkOutOfRange()
    @checkForCollision()
    @checkForWin()
    @drawBall()
    @x += @moveXBy
    @y += @moveYBy
    window.requestAnimationFrame(Maze.start.bind(Maze))

  setBackground: ->
    @context.beginPath()
    @context.rect(0, 0, MazeCanvas.width(), MazeCanvas.height())
    @fillWithColour "#28475c"

  drawBall: ->
    @context.beginPath()
    @context.arc(@x, @y, 10, 0, Math.PI * 2)
    @context.closePath()
    @fillWithColour("#C4C4C4")

  drawMaze: ->
    @context.beginPath()
    MazeWalls.level1.forEach (wall) =>
      @context.rect(wall.x, wall.y, wall.width, wall.height)
    @fillWithColour "#C4C4C4"

  drawFinish: ->
      @context.beginPath()
      @context.rect(MazeCanvas.width() - 160, MazeCanvas.height() - 450, 30, 30)
      @fillWithColour("#4A6C74")

  checkOutOfRange: ->
    if(@x > MazeCanvas.width() || @x <= 0 || @y > MazeCanvas.height() || @y < 0)
      @resetBall()

  checkForCollision: ->
    MazeWalls.level1.forEach (wall) =>
      if(@x >= wall.x - 5 && @x <= (wall.x + wall.width + 5) && @y >= wall.y - 5 && @y <= (wall.y + wall.height + 5))
        @resetBall()

  checkForWin: ->
      if(@x >= MazeCanvas.width() - 160 && @x <= MazeCanvas.width() - 130 && @y >= MazeCanvas.height() - 450 && @y <= MazeCanvas.height() - 420)
        alert("WIN!!!!!")
        @resetBall()

  clearCanvas: ->
    @context.clearRect(0, 0, MazeCanvas.width(), MazeCanvas.height())

  resetBall: ->
    @x = 15
    @y = 15

  fillWithColour: (colour) ->
    @context.fillStyle = colour
    @context.fill()

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
