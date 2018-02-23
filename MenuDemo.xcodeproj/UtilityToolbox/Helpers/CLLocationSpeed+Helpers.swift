//
//  CLLocationSpeed+Helpers.swift
//  Onderweg
//
//  Created by Frank Burgers on 09/11/2017.
//  Copyright © 2017 Locatienet B.V. All rights reserved.
//

import CoreLocation
import UIKit

public extension CLLocationSpeed
{
	public func kilometerPerHour() -> CLLocationSpeed
	{
		return self * 3.6
	}
}
