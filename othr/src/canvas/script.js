"use srtict"

let myCanvas = document.getElementById('canvas');
let ctx = myCanvas.getContext('2d');

const palette = ['#efefef ', '#cfdfc4 ', '#fde2a3 ', '#f6c2a8 ', '#9aafc7 ']

const FIELD_SIZE = 20;

function myRnd(min = 0, max = 100) {
  return Math.round((Math.random() * (max - min + 1) + min - 0.5));
}

function fillCanvas(params) {
  for (let i = 0; i < FIELD_SIZE; i++) {
    for (let j = 0; j < FIELD_SIZE; j++) {
      putRect(i, j, palette[myRnd(0, 4)]);
    }
  }
}

function putRect(x, y, color) {
  let xx = x * 32;
  let yy = y * 32;
  ctx.fillStyle = color;
  ctx.fillRect(xx, yy, 32, 32);
}

fillCanvas();

myCanvas.addEventListener("click", fillCanvas);
document.body.addEventListener("keydown", fillCanvas);
document.querySelector("button").addEventListener("click", fillCanvas);