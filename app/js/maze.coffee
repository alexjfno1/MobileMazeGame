window.Maze =
  x: 25
  y: 25
  moveXBy: 0
  moveYBy: 0
  sensitivity: 2
  context: MazeCanvas.context()
  points: 0

  start: ->
    @clearCanvas()
    @setBackground()
    PointSquare.draw()
    @checkGainedPoint()
    @checkOutOfRange()
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
    @context.arc(@x, @y, 5, 0, Math.PI * 2)
    @context.closePath()
    @fillWithColour("#C4C4C4")

  drawFinish: ->
      @context.beginPath()
      @context.rect(MazeCanvas.width() - 160, MazeCanvas.height() - 450, 30, 30)
      @fillWithColour("#4A6C74")

  checkGainedPoint: ->
    if(@x > PointSquare.x && @x < PointSquare.x + PointSquare.width && @y > PointSquare.y && @y < PointSquare.y + PointSquare.height)
      PointSquare.ramdomiseiCoordinates()
      @points++
      console.log(@points)

  checkOutOfRange: ->
    if(@x > MazeCanvas.width() || @x <= 0 || @y > MazeCanvas.height() || @y < 0)
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
    @points = 0

  fillWithColour: (colour) ->
    @context.fillStyle = colour
    @context.fill()

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
