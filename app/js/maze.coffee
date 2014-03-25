window.Maze =
  moveXBy: 0
  moveYBy: 0
  sensitivity: 2
  context: MazeCanvas.context()
  points: 0

  start: ->
    @clearCanvas()
    @setBackground()
    Ball.draw()
    @checkGainedPoint()
    @checkOutOfRange()
    PointSquare.draw()
    @move()
    Ball.draw()
    window.requestAnimationFrame(Maze.start.bind(Maze))

  setBackground: ->
    @context.beginPath()
    @context.rect(0, 0, MazeCanvas.width(), MazeCanvas.height())
    @fillWithColour "#28475c"

  move: ->
    Ball.x += @moveXBy
    Ball.y += @moveYBy

  checkGainedPoint: ->
    if (PointSquare.hit())
      PointSquare.ramdomiseiCoordinates()
      @points++
      console.log(@points)

  checkOutOfRange: ->
    if(Ball.x > MazeCanvas.width() || Ball.x <= 0 || Ball.y > MazeCanvas.height() || Ball.y < 0)
      @reset()

  clearCanvas: ->
    @context.clearRect(0, 0, MazeCanvas.width(), MazeCanvas.height())

  reset: ->
    Ball.reset()
    @points = 0

  fillWithColour: (colour) ->
    @context.fillStyle = colour
    @context.fill()

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
