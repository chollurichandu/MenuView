//
//  NSDictionary+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 19/08/16.
//  Copyright © 2016 Locatienet BV. All rights reserved.
//

import Foundation

public extension NSDictionary
{
	public func jsonString() -> String?
	{
		do {
			
			let jsonObject = self as AnyObject
			let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions())
			let jsonString = String(data: jsonData, encoding: .utf8)
			
			return jsonString
		}
		catch let error {
			NSLog("jsonString() failed: \(error)")
		}

		return nil
	}

	public func jsonData() -> Data?
	{
		return self.jsonString()?.data(using: String.Encoding.utf8)
	}
}
