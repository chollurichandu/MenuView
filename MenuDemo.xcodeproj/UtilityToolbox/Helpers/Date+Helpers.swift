//
//  Date+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 24/08/16.
//  Copyright © 2016 Locatienet BV. All rights reserved.
//

import CoreLocation
import Foundation

public extension Date
{
	public func startTime() -> NSNumber
	{
		return (self.timeIntervalSince1970 - 1.0) as NSNumber		// Offset by one second to compensate for server-side processing time.
	}
	
	public func isDistantPast() -> Bool
	{
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy"
		
		return dateFormatter.string(from: Date.distantPast) == dateFormatter.string(from: self)
	}
	
	public func isDistantFuture() -> Bool
	{
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy"
		
		return dateFormatter.string(from: Date.distantFuture) == dateFormatter.string(from: self)
	}
	
	public func timeDifference(toDate: Date, requiredUnits: NSCalendar.Unit = [.day, .hour, .minute, .second]) -> Int
	{
		// Returns time difference between two Dates in seconds.
		//
		let difference = (Calendar.current as NSCalendar).components(requiredUnits, from: self, to: toDate, options: [])
		
		return (difference.day! * 86400) + (difference.hour! * 3600) + (difference.minute! * 60) + difference.second!
	}
	
	public func timeDifferenceFormatted(toDate: Date, requiredUnits: NSCalendar.Unit = [.day, .hour, .minute, .second]) -> String
	{
		// Returns time difference between two Dates as a nicely formatted string.
		//
		let difference = (Calendar.current as NSCalendar).components(requiredUnits, from: self, to: toDate, options: [])
		
		var seconds = ""
		var minutes = ""
		var hours = ""
		var days = ""
		
		if requiredUnits.contains(.second) == true {
			seconds = "\(difference.second ?? 0) sec"
		}
		
		if requiredUnits.contains(.minute) == true {
			minutes = (requiredUnits.contains(.second) == true ? "\(difference.minute ?? 0) min " + seconds : "\((difference.minute ?? 0)) min ")
		}
		
		if requiredUnits.contains(.hour) == true {
			hours = "\(difference.hour ?? 0) h" + " " + minutes
		}
		
		if requiredUnits.contains(.day) == true {
			days = "\(difference.day ?? 0) d" + " " + hours
		}
		
		if let d = difference.day, d > 0 {
			return days
		}
		if let h = difference.hour, h > 0 {
			return hours
		}
		if let m = difference.minute, m > 0 {
			return minutes
		}
		if let s = difference.second, s > 0 {
			return seconds
		}

		return ""
	}

	static public func unixTimeToString(_ timestamp: Double) -> String
	{
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
		
		return dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
	}
}
