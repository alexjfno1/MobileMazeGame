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
    @checkIfLost()
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

  checkIfLost: ->
    if (@outOfRange() || Obstructions.hit(@level)) then @reset()

  updateScore: ->
    @pointsDisplay.innerText = "Score: #{@points}"

  outOfRange: ->
    Ball.x > MazeCanvas.width() || Ball.x <= 0 || Ball.y > MazeCanvas.height() || Ball.y < 0

  clearCanvas: ->
    @context.clearRect(0, 0, MazeCanvas.width(), MazeCanvas.height())

  reset: ->
    Ball.reset()
    @points = 0
    @updateScore()
    @level = 1

  fillWithColour: (colour) ->
    @context.fillStyle = colour
    @context.fill()

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
