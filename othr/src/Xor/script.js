"use strict";

function myXor(argID, argKey) {
    argID = argID || "area"; // if argID = underfined then argID = area
    argKey = argKey || 21; // if argKey = underfined then argKey = 21
    var arr = [];
    var x = document.getElementById(argID).value

    for (var i = 0; i < x.length; i++) {
        arr[i] = x.charCodeAt(i);
        arr[i] = arr[i] ^ argKey;

    }
    document.getElementById(argID).value = String.fromCharCode(...arr);

}

function myClr(argID) {
    argID = "area"
    var x = document.getElementById(argID).value = "";

}