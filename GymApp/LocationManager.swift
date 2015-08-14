//
//  LocationManager.swift
//  GymApp
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 10/08/15.
//  Copyright (c) 2015 Antonio. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    private var lastLocation: CLLocation?
    
    class var sharedInstance: LocationManager {
        struct Static {
            static var oncetoken: dispatch_once_t = 0
            static var instance: LocationManager? = nil
        }
        
        dispatch_once(&Static.oncetoken) {
            Static.instance = LocationManager()
        }
        
        return Static.instance!
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.requestAlwaysAuthorization()
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        NSLog("%@", locations)
        if (locations.first != nil) {
            lastLocation = locations.first as? CLLocation
        }
    }
}

extension LocationManager {
    func myLastLocation() -> CLLocation? {
        return self.lastLocation
    }
}
