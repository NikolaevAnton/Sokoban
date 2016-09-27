//
//  ViewController.swift
//  Sokoban
//
//  Created by Admin on 27.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var parametr_x: UITextField!
    
    @IBOutlet weak var parametr_y: UITextField!
    
    @IBOutlet weak var countWalls: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NewViewController : ViewGame = segue.destinationViewController as! ViewGame
        NewViewController.text_x = parametr_x.text
        NewViewController.text_y = parametr_y.text
        NewViewController.text_walls = countWalls.text
    }
    
}

