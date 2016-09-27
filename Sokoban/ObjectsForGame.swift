//
//  ObjectsForGame.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
//объекты игры: стены, пустые поля, коробка и цель. А также энум их отображений, энум возможных направлений передвижения и
//массив, в котором заключены все
//симольные отображения каждой координаты поля
enum Image : String {
    case Wall     = "⬛️"
    case Man      = "😐"
    case Floor    = "⬜️"
    case Box      = "💰"
    case Target   = "🏁"
    case HappyMan = "🤑"
}

enum Step {
    case Up
    case Right
    case Down
    case Left
}

class Person {
    var person_x = 10
    var person_y = 5
}

class Box {
    var box_x = 8
    var box_y = 5
}

class Target {
    var target_x  = 2
    var target_y = 2
}