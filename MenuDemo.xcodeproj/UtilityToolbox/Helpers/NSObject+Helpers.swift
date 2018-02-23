//
//  NSObject+Helpers.swift
//  Talking Traffic
//
//  Created by Frank Burgers on 29/08/16.
//  Copyright © 2016 Locatienet BV. All rights reserved.
//

import CoreData
import SystemConfiguration
import UIKit

public extension NSObject
{
	public func toDictionary(managedObjects: [NSManagedObject]) -> [Dictionary<String, String>]
	{
		// Helper method to convert managed objects into dictionaries of string values.
		// This is needed when serialising data to JSON.
		//
		var dictArray = Array<Dictionary<String, String>>()
		
		for managedObject in managedObjects	{
			
			var dict = Dictionary<String, String>()
			let attributes = managedObject.entity.attributesByName as [String: NSAttributeDescription]
			
			for attributeName in attributes.keys  {
				
				guard let managedObjectValue = managedObject.value(forKey: attributeName) else {
					continue
				}
				
				if let numberValue = managedObjectValue as? NSNumber {
					dict[attributeName] = numberValue.stringValue
				}
				else if let dateValue = managedObjectValue as? Date {
					
					let dateFormatter = DateFormatter()
					dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
					
					dict[attributeName] = dateFormatter.string(from: dateValue)
				}
				else if let stringValue = managedObjectValue as? String {
					dict[attributeName] = stringValue
				}
			}
			
			dictArray.append(dict)
		}
		
		return dictArray
	}
}
