//
//  LocationService.swift
//  WeatherAppShowcase
//
//  Created by cobe on 14.09.2021..
//

import Foundation
import CoreLocation


class LocationService: NSObject {
    var onCoordinatesFetch: ((Double, Double) -> Void)?
    
    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
    
    func getCurrentLocationURL() {
        locationManager.delegate = self
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            
            latitude = loc.coordinate.latitude
            longitude = loc.coordinate.longitude
            
            if latitude != 0.0 && longitude != 0.0 {
                onCoordinatesFetch?(latitude, longitude)
                locationManager.stopUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print(error.localizedDescription)
    }
}
