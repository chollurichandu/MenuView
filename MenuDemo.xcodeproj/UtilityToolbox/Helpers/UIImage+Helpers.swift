//
//  UIImage+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 23/10/2017.
//  Copyright © 2017 Locatienet BV. All rights reserved.
//

import CoreGraphics
import UIKit

public extension UIImage
{
	// Put an image right-side up and scale it down to sendable propoertions.
	//
	public func scaleAndRotate(maxResolution: CGFloat = 1024.0) -> UIImage?
	{
		guard let imageRef = self.cgImage else {
			return nil
		}
		
		let width = CGFloat(imageRef.width)
		let height = CGFloat(imageRef.height)
		
		var transform = CGAffineTransform.identity
		var bounds = CGRect(x: 0.0, y: 0.0, width: width, height: height)
		
		if width > maxResolution || height > maxResolution {
			
			let ratio = width / height
			
			if ratio > 1.0 {
				
				bounds.size.width = maxResolution
				bounds.size.height = bounds.width / ratio
			}
			else {
				
				bounds.size.height = maxResolution
				bounds.size.width = bounds.height * ratio
			}
		}
		
		let scaleRatio = bounds.width / width
		let imageSize = CGSize(width: width, height: height)
		
		var boundsHeight: CGFloat = 0.0
		
		switch self.imageOrientation {

			case .up:
				
				transform = .identity
			
			case .upMirrored:
				
				transform = CGAffineTransform(translationX: imageSize.width, y: 0.0)
				transform = transform.scaledBy(x: -1.0, y: -1.0)
			
			case .down:
				
				transform = CGAffineTransform(translationX: imageSize.width, y: imageSize.height)
				transform = transform.rotated(by: CGFloat.pi)
			
			case .downMirrored:
				
				transform = CGAffineTransform(translationX: 0.0, y: imageSize.height)
				transform = transform.scaledBy(x: 1.0, y: -1.0)
			
			case .left:
				
				boundsHeight = bounds.height
				bounds.size.height = bounds.width
				bounds.size.width = boundsHeight
				transform = CGAffineTransform(translationX: 0.0, y: imageSize.width)
				transform = transform.rotated(by: 3.0 * CGFloat.pi / 2.0)

			case .leftMirrored:
				
				boundsHeight = bounds.height
				bounds.size.height = bounds.width
				bounds.size.width = boundsHeight
				transform = CGAffineTransform(translationX: imageSize.height, y: imageSize.width)
				transform = transform.scaledBy(x: -1.0, y: 1.0)
				transform = transform.rotated(by: 3.0 * CGFloat.pi / 2.0)

			case .right:
				
				boundsHeight = bounds.height
				bounds.size.height = bounds.width
				bounds.size.width = boundsHeight
				transform = CGAffineTransform(translationX: imageSize.height, y: 0.0)
				transform = transform.rotated(by: CGFloat.pi / 2.0)

			case .rightMirrored:
				
				boundsHeight = bounds.height
				bounds.size.height = bounds.width
				bounds.size.width = boundsHeight
				transform = transform.scaledBy(x: -1.0, y: 1.0)
				transform = transform.rotated(by: CGFloat.pi / 2.0)
		}

		UIGraphicsBeginImageContext(bounds.size)
		
		guard let context = UIGraphicsGetCurrentContext() else {

			UIGraphicsEndImageContext()
			return nil
		}
		
		if self.imageOrientation == .right || self.imageOrientation == .left {
			
			context.scaleBy(x: -scaleRatio, y: scaleRatio)
			context.translateBy(x: -height, y: 0.0)
		}
		else {
			
			context.scaleBy(x: scaleRatio, y: -scaleRatio)
			context.translateBy(x: 0.0, y: -height)
		}
		
		context.concatenate(transform)
		context.draw(imageRef, in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
		
		let imageCopy = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return imageCopy
	}
}
