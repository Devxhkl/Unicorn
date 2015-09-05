//
//  Beacons.swift
//  Unicorn
//
//  Created by Zel Marko on 05/09/15.
//  Copyright (c) 2015 The Unicorns. All rights reserved.
//

import UIKit
import CoreLocation

class Beacons: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var beaconReagion: CLBeaconRegion!

    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        let uuid = NSUUID(UUIDString: "4E455741-4552-544C-4142-5357494E0D0A")
        beaconReagion = CLBeaconRegion(proximityUUID: uuid, identifier: "com.theunicorns.unicorn")
        beaconReagion.notifyOnEntry = true
        beaconReagion.notifyOnExit = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringForRegion(beaconReagion)
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        println("didStartMonitoringForRegion")
        locationManager.requestStateForRegion(beaconReagion)
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        println(state)
        locationManager.startRangingBeaconsInRegion(beaconReagion)
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("Entered region...")
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        println("Exited region...")
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        for beacon in beacons {
            if let b = beacon as? CLBeacon {
                if b.major == 0 {
                    println("One \(b.accuracy)")
//                    oneLabel.text = "One \(b.accuracy)"
                }
                else if b.major == 1 {
                    println("Two \(b.accuracy)")
//                    twoLabel.text = "Two \(b.accuracy)"
                }
                else {
                    println("something")
                }
            }
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!) {
        println(error)
    }
    
    
    func locationManager(manager: CLLocationManager!, rangingBeaconsDidFailForRegion region: CLBeaconRegion!, withError error: NSError!) {
        println(error)
    }
   
}
