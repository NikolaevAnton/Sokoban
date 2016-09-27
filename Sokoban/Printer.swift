//
//  Printer.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
//отрисовщик массива изображений
//switch coord {
//case (let x, let y) where x == 0 || x == x_max || y == 0 || y == y_max:
//
//}

func printField(array : [Image]) -> String {
    var result = ""
    var resArr = [String]()
    var index = 0
    for _ in 0..<y_max {
        var temp = ""
        for _ in 0..<x_max {
            temp += array[index].rawValue
            index += 1
        }
        resArr.append(temp)
    }
    resArr = resArr.reverse()
    for str in resArr {
        result += str + "\n"
    }
    print("Person: x\(person.person_x) y\(person.person_y) Box: x\(box.box_x) y\(box.box_y)")
    return result
}

func generate(inout array : [Image],  start: Bool) {
    if start {
        randomPlace(countIntroWall : insert_walls)
    }
    for i in 0..<size {
        switch coord[i] {
        case let(x,y) where x == 0 || x == x_max - 1 || y == 0 || y == y_max - 1:
            array[i] = Image.Wall
        case let(x,y) where x == person.person_x && y == person.person_y:
            if victory {
                array[i] = Image.HappyMan
            } else {
                array[i] = Image.Man
            }
        case let(x,y) where x == box.box_x && y == box.box_y:
            array[i] = Image.Box
        case let(x,y) where x == target.target_x && y == target.target_y:
            array[i] = Image.Target
        default:
            if array[i] == Image.Wall {
                //array[i] = Image.Wall
            } else {
                array[i] = Image.Floor
            }
        }
    }
}