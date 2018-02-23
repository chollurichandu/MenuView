//
//  MKPolyline_Helpers.swift
//  Talking Traffic
//
//  Created by Frank Burgers on 13/04/2017.
//  Copyright © 2017 Locatienet B.V. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

public extension MKPolyline
{
	// MARK: - Public methods -
	
	var coordinates: [CLLocationCoordinate2D]
	{
		// Returns all coordinates contained in a polyline.
		//
		var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid, count: self.pointCount)
		
		self.getCoordinates(&coords, range: NSRange(location: 0, length: self.pointCount))
		
		return coords
	}
	
	public func course(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) -> CLLocationDirection
	{
		// Calculates the course of a polyline.
		//
		let x = destination.latitude - source.latitude
		let y = destination.longitude - source.longitude
		let degrees = radiansToDegrees(atan2(y, x)).truncatingRemainder(dividingBy: 360.0)
		
		return (degrees >= 0.0 ? degrees : degrees + 360.0)
	}
	
	// MARK: - Internal helper methods -
	
	private func radiansToDegrees(_ radians: Double) -> Double
	{
		return radians * 180.0 / Double.pi
	}
	
	private func degreesToRadians(_ degrees: Double) -> Double
	{
		return degrees * Double.pi / 180.0
	}
}
