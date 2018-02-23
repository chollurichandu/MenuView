//
//  CLPlacemark+Helpers.swift
//  Onderweg
//
//  Created by Frank Burgers on 04/05/2017.
//  Copyright © 2017 Locatienet B.V. All rights reserved.
//

import CoreLocation
import UIKit

public extension CLPlacemark
{
	public func makeAddress(withPostCode: Bool = true, withCountry: Bool = true) -> String
	{
		// Make a human readable address from a placemark.
		//
		var locationAsText = ""
		
		if let street = self.thoroughfare {
			locationAsText = "\(street)"
		}
		
		if let number = self.subThoroughfare {
			locationAsText = "\(locationAsText) \(number)"
		}
		
		if let postCode = self.postalCode, withPostCode == true {
			locationAsText = "\(locationAsText)\(locationAsText.isEmpty == true ? "" : ", ")\(postCode)"
		}
		
		if let city = self.locality {
			locationAsText = "\(locationAsText)\(locationAsText.isEmpty == true ? "" : ", ")\(city)"
		}
		
		if let country = self.isoCountryCode, withCountry == true {
			locationAsText = "\(locationAsText)\(locationAsText.isEmpty == true ? "" : ", ")\(country)"
		}
		
		return locationAsText
	}
}
