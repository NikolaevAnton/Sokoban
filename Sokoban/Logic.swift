//
//  Logic.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
//Описание логики работы программы: получение рандомных значений координат для объектов, пересчитывание координат x и y в индекс в массиве и наоборот
//логика при ходе вверх, вниз, направо и налево

func calculationKoordinate(index : Int) -> (x : Int, y : Int) {
    var xy : (x: Int, y : Int)
    var temp = index
    var y = 0
    while true {
        if temp < x_max {
            break
        }
        temp -= x_max
        y += 1
    }
    xy.x = temp
    xy.y = y
    return xy
}

func calculateIndex(xy : (x : Int, y : Int)) -> Int {
    return x_max*xy.y + xy.x
}

func arrayCoord() -> [(x:Int, y:Int)] {
    var array = [(x:Int, y:Int)]()
    for i in 0 ..< size {
        array.append(calculationKoordinate(i))
    }
    return array
}

//функции для клоужеров
func matematicKoordinat(index index : Int, object : Int, funcMatem : () -> Int) {
    //object - переменная, отвечающая за объект который надо двигать. 1 - Человек, 2 - Коробка
    let temp = index + funcMatem()
    let coord = calculationKoordinate(temp)
    switch object {
    case 1:
        person.person_x = coord.x
        person.person_y = coord.y
    case 2:
        box.box_x = coord.x
        box.box_y = coord.y
    default:
        print("Error item. Only 1 or 2 for value for object")
    }
}

func moveLeft() -> Int {
    return -1
}

func moveRight() -> Int {
    return 1
}

func moveUp() -> Int {
    return x_max
}

func moveDown() -> Int {
    return -x_max
}


//Функции для передвижения предметов
func moveBox(step : Step) {
    let boxIndex = calculateIndex((box.box_x,box.box_y))
    switch step {
    case .Down:
        if besideBoxAndPerson(.Down) && !focusBoxInTheWall(.Down) {
            matematicKoordinat(index: boxIndex, object : 2, funcMatem: { moveDown() })
        } else if besideBoxAndPerson(.Down) && focusBoxInTheWall(.Down) {
            box.box_y += 1
        }
    case .Left:
        if besideBoxAndPerson(.Left) && !focusBoxInTheWall(.Left) {
            matematicKoordinat(index: boxIndex, object : 2, funcMatem: { moveLeft() })
        } else if besideBoxAndPerson(.Left) && focusBoxInTheWall(.Left) {
            box.box_x += 1
        }
    case .Right:
        if besideBoxAndPerson(.Right) && !focusBoxInTheWall(.Right) {
            matematicKoordinat(index: boxIndex, object : 2, funcMatem: { moveRight() })
        } else if besideBoxAndPerson(.Right) && focusBoxInTheWall(.Right) {
            box.box_x -= 1
        }
    case .Up:
        if besideBoxAndPerson(.Up) && !focusBoxInTheWall(.Up) {
            matematicKoordinat(index: boxIndex, object : 2, funcMatem: { moveUp() })
        } else if besideBoxAndPerson(.Up) && focusBoxInTheWall(.Up) {
            box.box_y -= 1
        }
    }
}



func movePerson(step : Step) {
    let coordPerson : (x : Int, y : Int) = (person.person_x, person.person_y)
    let indexPerson = calculateIndex(coordPerson)
    switch step {
    case .Down:
        let inspectionField = calculateIndex((coordPerson.x, coordPerson.y - 1))
        if field[inspectionField] != Image.Wall && !focusBoxInTheWall(.Down) {
            matematicKoordinat(index: indexPerson, object : 1, funcMatem: { moveDown() })
        } else if focusBoxInTheWall(.Down) {
            person.person_y += 1
        }
    case .Left:
        let inspectionField = calculateIndex((coordPerson.x - 1, coordPerson.y))
        if field[inspectionField] != Image.Wall && !focusBoxInTheWall(.Left){
            matematicKoordinat(index: indexPerson, object : 1, funcMatem: { moveLeft() })
        } else if focusBoxInTheWall(.Left) {
            person.person_x += 1
        }
    case .Right:
        let inspectionField = calculateIndex((coordPerson.x + 1, coordPerson.y))
        if field[inspectionField] != Image.Wall && !focusBoxInTheWall(.Right) {
            matematicKoordinat(index: indexPerson, object : 1, funcMatem: { moveRight() })
        } else if focusBoxInTheWall(.Right) {
            person.person_x -= 1
        }
    case .Up:
        let inspectionField = calculateIndex((coordPerson.x, coordPerson.y + 1))
        if field[inspectionField] != Image.Wall && !focusBoxInTheWall(.Up) {
            matematicKoordinat(index: indexPerson, object : 1, funcMatem: { moveUp() })
        } else if focusBoxInTheWall(.Up) {
            person.person_y -= 1
        }
    }
}

func focusBoxInTheWall(step : Step) -> Bool {
    var focus = false
    switch step {
    case .Down:
        let inspectionWall = calculateIndex((box.box_x, box.box_y - 1))
        if besideBoxAndPerson(.Down) && field[inspectionWall] == .Wall {
            focus = true
        }
    case .Left:
        let inspectionWall = calculateIndex((box.box_x - 1, box.box_y))
        if besideBoxAndPerson(.Left) && field[inspectionWall] == .Wall {
            focus = true
        }
    case .Right:
        let inspectionWall = calculateIndex((box.box_x + 1, box.box_y))
        if besideBoxAndPerson(.Right) && field[inspectionWall] == .Wall {
            focus = true
        }
    case .Up:
        let inspectionWall = calculateIndex((box.box_x, box.box_y + 1))
        if besideBoxAndPerson(.Up) && field[inspectionWall] == .Wall {
            focus = true
        }
    }
    return focus
}

func besideBoxAndPerson(step : Step) -> Bool {
    var beside = false
    switch step {
    case .Down:
        if person.person_x == box.box_x && person.person_y == box.box_y {
            beside = true
        }
    case .Left:
        if person.person_x == box.box_x && person.person_y == box.box_y {
            beside = true
        }
    case .Right:
        if person.person_x == box.box_x && person.person_y == box.box_y {
            beside = true
        }
    case .Up:
        if person.person_x == box.box_x && person.person_y == box.box_y {
            beside = true
        }
    }
    return beside
}

//выбор рандомного места для человека, коробки и цели
func randomPlace(countIntroWall countIntroWall : Int) {
    var all : (indexPerson : Int, indexBox : Int, indexTarget : Int, walls : [Int]) = (0,0,0,[])
    //массив стен, обрамляющих комнату
    var wallPlace = Array(count: size, repeatedValue: false)
    for i in 0..<size {
        switch coord[i] {
        case let(x,y) where x == 0 || x == x_max - 1 || y == 0 || y == y_max - 1:
            wallPlace[i] = true
        default:
            break
        }
    }
    var result = Int(arc4random_uniform(UInt32(size)))
    if !setPerson || !setBox || !setTarget{
        while true {
            if wallPlace[result] == false {
                break
            }
            result = Int(arc4random_uniform(UInt32(size)))
        }
        all.indexPerson = result
        setPerson = true
        result = Int(arc4random_uniform(UInt32(size)))
        while true {
            if wallPlace[result] == false && result != all.indexPerson{
                break
            }
            result = Int(arc4random_uniform(UInt32(size)))
        }
        all.indexBox = result
        setBox = true
        while true {
            if wallPlace[result] == false && result != all.indexPerson && result != all.indexBox{
                break
            }
            result = Int(arc4random_uniform(UInt32(size)))
        }
        all.indexTarget = result
        setTarget = true
    }
    
    let coordPerson = calculationKoordinate(all.indexPerson)
    let coordBox = calculationKoordinate(all.indexBox)
    let coordTarget = calculationKoordinate(all.indexTarget)
    person.person_x = coordPerson.x
    person.person_y = coordPerson.y
    box.box_x = coordBox.x
    box.box_y = coordBox.y
    target.target_x = coordTarget.x
    target.target_y = coordTarget.y
    
    result = Int(arc4random_uniform(UInt32(size)))
    for _ in 1...countIntroWall {
        while true {
            if wallPlace[result] == false && result != all.indexPerson &&
                result != all.indexBox && result != all.indexTarget && !all.walls.contains(result) {
                break
            }
            result = Int(arc4random_uniform(UInt32(size)))
            
        }
        all.walls.append(result)
    }
    
    for i in all.walls {
        field[i] = Image.Wall
    }
    
    print("Walls: \(all.walls)")
}