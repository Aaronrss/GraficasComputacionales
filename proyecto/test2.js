// pock movement for the boss #2
function ballPhysics2() {
  // if ball goes off the 'left' side (Player's side)
  if (
    ball.position.x <= -fieldWidth / 2 + 6 &&
    ball.position.y >= -30 &&
    ball.position.y <= 30
  ) {
    // CPU scores
    score2++;
    sminus.play();
    // update scoreboard HTML
    document.getElementById("scores").innerHTML = score1 + "-" + score2;
    // reset ball to center
    resetBall(2);
    matchScoreCheck();
  } else if (ball.position.x <= -fieldWidth / 2 + 6) {
    ballDirX = 1;
    sbounce.play();
  }

  // if ball goes off the 'right' side (CPU's side)
  if (
    ball.position.x >= fieldWidth / 2 &&
    ball.position.y >= -30 &&
    ball.position.y <= 30
  ) {
    // Player scores
    score1++;
    splus.play();
    // update scoreboard HTML
    document.getElementById("scores").innerHTML = score1 + "-" + score2;
    // reset ball to center
    resetBall(1);
    matchScoreCheck();
  } else if (ball.position.x >= fieldWidth / 2) {
    ballDirX = -1;
    sbounce.play();
  }

  // MODS
  // if ball goes off the top side (side of table)
  if (ball.position.y <= -fieldHeight / 2 + 5) {
    ballDirY = -ballDirY;
    sbounce.play();
  }
  // if ball goes off the bottom side (side of table)
  if (ball.position.y >= fieldHeight / 2 - 5) {
    ballDirY = -ballDirY;
    sbounce.play();
  }

  // update ball position over time
  ball.position.x += ballDirX * ballSpeed;
  ball.position.y += ballDirY * ballSpeed;

  // limit ball's y-speed
  // this is so the ball doesn't speed from left to right super fast
  // keeps game playable for humans
  if (ballDirY > ballSpeed * 1.05) {
    ballDirY = ballSpeed * 1.05;
  } else if (ballDirY < -ballSpeed * 1.05) {
    ballDirY = -ballSpeed * 1.05;
  }
}
