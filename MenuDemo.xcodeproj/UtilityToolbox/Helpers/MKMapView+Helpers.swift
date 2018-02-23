//
//  MKMapView+Helpers.swift
//  Talking Traffic
//
//  Created by Frank Burgers on 17/01/2017.
//  Copyright © 2017 Frank Burgers. All rights reserved.
//

import MapKit
import UIKit

public extension MKMapView
{
	public func plotPolyline(_ route: MKRoute, zoomOut: Bool = false)
	{
		// Draw a route as a polyline. If zoomOut is true, then the map view will zoom out to show the entire route as an overview.
		//
		removePolylineOverlays()
		
		add(route.polyline)

		if zoomOut == true {

			if overlays.count == 1 {
				setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0), animated: true)
			}
			else {
				
				let polylineBoundingRect =  MKMapRectUnion(visibleMapRect, route.polyline.boundingMapRect)
				setVisibleMapRect(polylineBoundingRect, edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0), animated: true)
			}
		}
	}
	
	public func removePolylineOverlays()
	{
		for overlay in self.overlays {
			
			if overlay is MKPolyline {
				self.remove(overlay)
			}
		}
	}
}
