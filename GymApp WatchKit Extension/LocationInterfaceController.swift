//
//  LocationInterfaceController.swift
//  GymApp
//
//  Created by Antonio on 10/8/15.
//  Copyright (c) 2015 Antonio. All rights reserved.
//

import WatchKit

class LocationInterfaceController: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        setTitle("Localización")
    }

    @IBAction func getLocation() {
        LocationInterfaceController.openParentApplication(["task": "getLocation"], reply: { (replyInfo: [NSObject : AnyObject]!, error: NSError!) -> Void in
            NSLog("%@", replyInfo)
        })
    }
}
