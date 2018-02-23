//
//  Int+Helpers.swift
//  ParkBuddy
//
//  Created by Frank Burgers on 06/07/16.
//  Copyright © 2016 Locatienet B.V. All rights reserved.
//

import UIKit

public extension Int
{
	public func sum(_ x: Int, y: Any) -> Int
	{
		return x + (y as AnyObject).intValue
	}
}
