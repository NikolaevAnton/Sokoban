//
//  ViewGame.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit

class ViewGame : UIViewController {
    
    @IBAction func Up(sender: AnyObject) {
        moves(.Up)
    }
    
    @IBAction func Right(sender: AnyObject) {
        moves(.Right)
    }
    
    
    @IBAction func Down(sender: AnyObject) {
        moves(.Down)
    }
    
    
    @IBAction func Left(sender: AnyObject) {
        moves(.Left)
    }
    
    
    @IBOutlet weak var gameText: UILabel!
    
    var text_x : String?
    var text_y : String?
    var text_walls : String?
    
    func startValues(text_x text_x : String?, text_y : String?, text_walls : String?) {
        var tempX = String()
        var tempY = String()
        var tempWalls = String()
        
        if text_x != nil {
            tempX = text_x!
        } else {
            tempX = "15"
        }
        
        if text_y != nil {
            tempY = text_y!
        } else {
            tempY = "10"
        }
        
        if text_walls != nil {
            tempWalls = text_walls!
        } else {
            tempWalls = "10"
        }
        
        if let x = Int(tempX) {
            if x > 5 && x <= 25 {
                insert_x = x
            } else if x > 25 {
                insert_x = 25
            }
            else {
                insert_x = 15
            }
        } else {
            insert_x = 15
        }
        
        if let y = Int(tempY) {
            if y > 5 && y <= 25 {
                insert_y = y
            } else if y > 25 {
                insert_y = 25
            }
            else {
                insert_y = 15
            }
        } else {
            insert_y = 15
        }
        
        if let count = Int(tempWalls) {
            if count > 0 && count <= 25 {
                insert_walls = count
            } else if count > 25 {
                insert_walls = 25
            }
            else {
                insert_walls = 10
            }
        } else {
            insert_walls = 10
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startValues(text_x: text_x, text_y: text_y, text_walls: text_walls)
        generate(&field, start: true)
        gameText.text = printField(field)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func moves(step : Step) {
        movePerson(step)
        moveBox(step)
        vin()
        generate(&field, start: false)
        gameText.text = printField(field)
    }
}