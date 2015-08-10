//
//  MenuInterfaceController.swift
//  GymApp
//
//  Created by Antonio on 10/8/15.
//  Copyright (c) 2015 Antonio. All rights reserved.
//

import WatchKit
import Foundation

class MenuInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    let model = [0: "Donde está mi coche", 1: "Descansos", 2: "Calorías quemadas", 3: "Compartir"]
    
    override func awakeWithContext(context: AnyObject?) {
        setTitle("Menú")
        setUpTable()
    }
    
    func setUpTable() {
        table.setNumberOfRows(model.count, withRowType: "myRow")
        for (var i: Int = 0; i < model.count; i++) {
            let row = table.rowControllerAtIndex(i) as! RowController
            row.textLabel.setText(model[i])
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        var controllerIdentifier: String
        
        switch (rowIndex) {
        case 0:
            controllerIdentifier = "location"
            break
        case 1:
            controllerIdentifier = "breakModes"
            break
        case 2:
            controllerIdentifier = "calories"
            break
        case 3:
            controllerIdentifier = "shared"
            break
        default:
            controllerIdentifier = ""
            break
        }
        
        pushControllerWithName(controllerIdentifier, context: nil)
    }

}
