//
//  ViewController.swift
//  Klimov_maps
//
//  Created by WSR on 22.01.2021.
//

import UIKit
import CoreLocation


class LocationVC: UIViewController, CLLocationManagerDelegate {
    
    let LocationManager = CLLocationManager()
    
    @IBOutlet weak var dataLat: UILabel!
    @IBOutlet weak var dataLon: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
        // Do any additional setup after loading the view.
    }
    func checkAuthorization(){
        switch  CLLocationManager.authorizationStatus() {
        case.authorizedWhenInUse:
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationManager.startUpdatingLocation()
            print("Error")
        case .notDetermined:
            LocationManager.requestWhenInUseAuthorization()
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        if let location  = locations.last?.coordinate {
            dataLat.text = String(location.latitude)
            dataLat.text = String(location.longitude)
            LocationManager.stopUpdatingLocation()
        
    }
    }
    }





