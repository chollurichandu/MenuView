//
//  CLLocation+Helpers.swift
//  Talking Traffic
//
//  Created by Frank Burgers on 27/01/2017.
//  Copyright © 2017 Frank Burgers. All rights reserved.
//

import CoreLocation
import UIKit

public extension CLLocation
{
	public func intersectsWith(_ otherLocation: CLLocation, minDistance: Double) -> Bool
	{
		return self.distance(from: otherLocation) < minDistance
	}
	
	public func isCorner(_ otherLocation: CLLocation) -> Bool
	{
		let calculatedDistance = self.distance(from: otherLocation)
		let calculatedTime = abs(self.timestamp.timeIntervalSince(otherLocation.timestamp))
		let calculatedSpeed = Double(calculatedDistance) / Double(calculatedTime)
		
		// Speed is less than 0.5 m/s (1.8 km/h) -> not a corner.
		//
		if (self.speed > Constants.cornerSpeedMinimum && self.speed < Constants.cornerSpeedThreshold) || calculatedSpeed < Constants.cornerSpeedThreshold {
			return false
		}
		
		// No heading data present: can't determine if this is a corner.
		//
		if self.course < 0.0 || otherLocation.course < 0.0 {
			return false
		}
		
		var calculatedHeadingDifference = abs(self.course - otherLocation.course)
		
		if calculatedHeadingDifference > 180.0 {
			calculatedHeadingDifference = 360.0 - calculatedHeadingDifference
		}
		
		return calculatedHeadingDifference > Constants.cornerHeadingThreshold
	}

	public func distanceFromPoint(_ pPoint: CLLocationCoordinate2D, toLineSegment vPoint: CLLocationCoordinate2D, and wPoint: CLLocationCoordinate2D) -> CGFloat
	{
		// Calculate the shortest distance from point to line (v,w).
		//
		let p = CGPoint(x: pPoint.latitude, y: pPoint.longitude)
		let v = CGPoint(x: vPoint.latitude, y: vPoint.longitude)
		let w = CGPoint(x: wPoint.latitude, y: wPoint.longitude)
		
		let pv_dx = p.x - v.x
		let pv_dy = p.y - v.y
		let wv_dx = w.x - v.x
		let wv_dy = w.y - v.y
		
		let dot = pv_dx * wv_dx + pv_dy * wv_dy
		let len_sq = wv_dx * wv_dx + wv_dy * wv_dy
		let param = dot / len_sq
		
		var int_x, int_y: CGFloat
		
		if param < 0 || (v.x == w.x && v.y == w.y) {

			int_x = v.x
			int_y = v.y
		}
		else if param > 1 {
		
			int_x = w.x
			int_y = w.y
		}
		else {
		
			int_x = v.x + param * wv_dx
			int_y = v.y + param * wv_dy
		}
		
		let dx = p.x - int_x
		let dy = p.y - int_y
		
		return sqrt(dx * dx + dy * dy) * 100000.0
	}
}
