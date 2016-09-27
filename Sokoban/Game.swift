//
//  Game.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
//условия победы, поражения, задание собственно поля игры, также здесь собран основные узлы логики - влияние передвижения персонажа на коробку и влияние
//коробки на цель
var victory = false
var insert_x = 0
var insert_y = 0
var insert_walls = 0

let x_max = insert_x
let y_max = insert_y
let size = x_max*y_max
var person = Person()
var target = Target()
var box = Box()

var field = Array(count: size, repeatedValue: Image.Floor)
var coord = arrayCoord()
var startGenerate = false
var setPerson = false
var setBox = false
var setTarget = false
var introWalls : [(x : Int, y : Int)] = []

func vin() {
    if box.box_x == target.target_x && box.box_y == target.target_y {
        victory = true
    } else {
        victory = false
    }
}