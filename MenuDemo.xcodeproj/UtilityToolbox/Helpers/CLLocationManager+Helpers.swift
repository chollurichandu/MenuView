//
//  CLLocationManager+Helpers.swift
//  LocAware III
//
//  Created by Frank Burgers on 04/10/2017.
//  Copyright © 2017 Locatienet BV. All rights reserved.
//

import CoreLocation

public extension CLLocationManager
{
	static public func authorisation() -> String
	{
		switch CLLocationManager.authorizationStatus() {
		
		case .authorizedAlways:
			return "authorizedAlways"
			
		case .authorizedWhenInUse:
			return "authorizedWhenInUse"
			
		case .denied:
			return "denied"
			
		case .notDetermined:
			return "notDetermined"
			
		case .restricted:
			return "restricted"
		}
	}
}
