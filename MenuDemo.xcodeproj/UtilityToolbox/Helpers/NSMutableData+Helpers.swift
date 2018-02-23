//
//  NSMutableData+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 24/10/2017.
//  Copyright © 2017 Locatienet BV. All rights reserved.
//

import UIKit

public extension NSMutableData
{
	public func appendString(string : String)
	{
		if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true) {
			append(data)
		}
	}
}
