window.Maze =
  moveXBy: 0
  moveYBy: 0
  sensitivity: 2
  context: MazeCanvas.context()
  level: 1
  points: 0
  pointsDisplay: document.getElementById("points")

  start: ->
    @clearCanvas()
    @setBackground()
    Ball.draw()
    @checkGainedPoint()
    @checkOutOfRange()
    Obstructions.draw(@level)
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
      @updateScore()
      if (@points % 3 == 0) then @level++

  updateScore: ->
    @pointsDisplay.innerText = "Score: #{@points}"

  checkOutOfRange: ->
    if(Ball.x > MazeCanvas.width() || Ball.x <= 0 || Ball.y > MazeCanvas.height() || Ball.y < 0)
      @reset()

  clearCanvas: ->
    @context.clearRect(0, 0, MazeCanvas.width(), MazeCanvas.height())

  reset: ->
    Ball.reset()
    @points = 0
    @updateScore()

  fillWithColour: (colour) ->
    @context.fillStyle = colour
    @context.fill()

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
