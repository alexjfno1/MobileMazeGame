window.ondevicemotion = (event) ->
  Maze.moveXBy = -(Maze.sensitivity * event.accelerationIncludingGravity.x)
  Maze.moveYBy = Maze.sensitivity * event.accelerationIncludingGravity.y
