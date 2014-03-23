var canvas = document.getElementById("maze");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
var context = canvas.getContext("2d");
var requestAnimationFrame = window.requestAnimationFrame ||
  window.mozRequestAnimationFrame ||
  window.webkitRequestAnimationFrame ||
  window.msRequestAnimationFrame;
var x = 25;
var y = 25;
var moveXBy = 0;
var moveYBy = 0;
var sensitivity = 2;
var walls = {};

window.ondevicemotion = function(event){
  moveXBy = -sensitivity * event.accelerationIncludingGravity.x;
  moveYBy = sensitivity * event.accelerationIncludingGravity.y;
}

window.addEventListener("resize", function(){
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  setupWalls();
}, false);

function setBackground(){
  context.beginPath();
  context.rect(0, 0, canvas.width, canvas.height);
  fillContextWithColour("#28475C");
}

function resetBall(){
  x = 15;
  y = 15;
}

function clearCanvas(){
  context.clearRect(0, 0, canvas.width, canvas.height);
}

function fillContextWithColour(colour){
  context.fillStyle = colour;
  context.fill();
}

function setupWalls(){
  walls = {
    level1: [
      {x:70, y:0, width:10, height:canvas.height - 80},
      {x:70, y:canvas.height - 80, width:canvas.width - 150, height:10},
      {x:canvas.width - 90, y:70, width:10, height:canvas.height - 150},
      {x:canvas.width - 220, y:70, width:130, height:10},
      {x:canvas.width - 220, y:70, width:10, height:canvas.height - 250}
    ]
  }
}

function drawMaze(){
  context.beginPath();
  walls.level1.forEach(function(wall){
    context.rect(wall.x, wall.y, wall.width, wall.height);
  });
  fillContextWithColour("#C4C4C4");
}

function drawFinish(){
  context.beginPath();
  context.rect(canvas.width - 160, canvas.height - 450, 30, 30);
  fillContextWithColour("#4A6C74");
}

function checkForCollision(){
  walls.level1.forEach(function(wall){
    if(x >= wall.x - 5 && x <= (wall.x + wall.width + 5) && y >= wall.y - 5 && y <= (wall.y + wall.height + 5)) { resetBall(); }
  });
}

function checkForWin(){
  if(x >= canvas.width - 160 && x <= canvas.width - 130 && y >= canvas.height - 450 && y <= canvas.height - 420) { alert("WIN!!!!!"); resetBall(); }
}

function drawGame(){
  clearCanvas();
  checkForCollision();
  checkForWin();
  setBackground();
  drawMaze();
  drawFinish();
  context.beginPath();
  context.arc(x, y, 10, 0, Math.PI * 2);
  context.closePath();
  fillContextWithColour("#C4C4C4");
  if(x > canvas.width || x <= 0 || y > canvas.height || y < 0) { resetBall(); }
  x += moveXBy;
  y += moveYBy;
  requestAnimationFrame(drawGame);
}

function start(){
  setupWalls();
  drawGame();
}

start();
