//
//  Constants.swift
//  Talking Traffic
//
//  Created by Frank Burgers on 20/06/16.
//  Copyright © 2016 Locatienet B.V. All rights reserved.
//

import UIKit

class Constants: NSObject
{
	static let httpOk = 200
	
	static let cornerSpeedMinimum = 0.0
	static let cornerSpeedThreshold = 0.5
	static let cornerHeadingThreshold = 30.0

	static let deviceIdStorageKey = "\(String(describing: Bundle.main.bundleIdentifier)).UUID"
	static let recentDestinationEntityName = "RecentDestination"
	static let locationWhenInUseDescription = "NSLocationWhenInUseUsageDescription"

	static let okText = "Ok"
	
	static let kilometer = 1000.0
}
