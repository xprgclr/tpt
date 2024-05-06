"use srtict"

const FIELD_SIZE = 20;

function myRnd(min = 0, max = 100) {
  return Math.round((Math.random() * (max - min + 1) + min - 0.5));
}

// n = x (cells) , m = y (rows)
function createMatrix(sizeX = FIELD_SIZE, sizeY = FIELD_SIZE) {
  let myArr = [];
  let key;
  for (let i = 0; i < sizeX; i++) {
    myArr[i] = [];
    for (let j = 0; j < sizeY; j++) {
      key = myRnd(0, 100);
      (key > 80) ? myArr[i][j] = 1: myArr[i][j] = 0;
    }
  }
  return myArr;
}

function createTable(rows = FIELD_SIZE, cells = FIELD_SIZE) {
  let myTable = document.createElement('table');
  myTable.className = "generic_table"
  document.body.appendChild(myTable);
  for (let i = 1; i <= rows; i++) {
    let row = myTable.insertRow();
    for (let j = 1; j <= cells; j++) {
      let cell = row.insertCell();

    }
  }
  return myTable;
}


function Game() {

  let matrix = createMatrix();
  let table = createTable();

  this.matrix = matrix;
  this.table = table;

  this.fillTable = function (symb) {
    for (var i = 0; i < table.rows.length; i++) {
      for (var j = 0; j < table.rows.length; j++) {
        let cell = table.rows[i].cells[j];
        cell.innerHTML = symb;
      }
    }
  }

  this.showTable = function () {
    for (var i = 0; i < table.rows.length; i++) {
      for (var j = 0; j < table.rows.length; j++) {
        let cell = table.rows[i].cells[j];
        (matrix[i][j] == 0) ? cell.classList.add("air"): cell.classList.add("wll");
      }
    }
  }

  this.writexy = function (x = 0, y = 0, text = "", select = 0) {
    // if ((x > n - 1 || y > m - 1) || (x < 0 || y < 0)) return false;
    var coord = table.rows[y].cells[x];
    coord.innerHTML = String(text);
    (!select) ? coord.classList.remove("plr"): coord.classList.add("plr");
    return true;
  }

}

function mouseHandler(event) {

  let target = event.target;
  while (target != game.table) {
    if (target.tagName == "TD") {
      game.writexy(player.x, player.y);
      player.y = target.parentNode.rowIndex;
      player.x = target.cellIndex;
      game.writexy(player.x, player.y, text, 1);
      return;
    }
    target = target.parentNode;
  }
}

function keyHandler(event) {
  game.writexy(player.x, player.y);
  switch (event.code) {
    case "KeyW":
      {
        ((player.y <= 0) || (game.matrix[player.y - 1][player.x] == 1)) ? player.y : player.y--;
        break;
      }
    case "KeyA":
      {
        ((player.x <= 0 || (game.matrix[player.y][player.x - 1] == 1))) ? player.x : player.x--;

        break;
      }
    case "KeyD":
      {
        ((player.x >= FIELD_SIZE - 1 || (game.matrix[player.y][player.x + 1] == 1))) ? player.x : player.x++;
        break;
      }
    case "KeyS":
      {
        ((player.y >= FIELD_SIZE - 1 || (game.matrix[player.y + 1][player.x] == 1))) ? player.y : player.y++;
        break;
      }

  }
  game.writexy(player.x, player.y, text, 1);
  console.log(game.matrix[player.y][player.x]);

}

let player = {
  x: 3,
  y: 0
}



let game = new Game();
game.showTable();
let text = "";
game.writexy(player.x, player.y, text, 1);


game.table.addEventListener("click", mouseHandler);
document.body.addEventListener("keydown", keyHandler);