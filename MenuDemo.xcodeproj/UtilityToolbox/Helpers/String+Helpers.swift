//
//  String+Helpers.swift
//  De Leukste Sint
//
//  Created by Frank Burgers on 29/07/16.
//  Copyright © 2016 Frank Burgers. All rights reserved.
//

import UIKit

public extension String
{
	public func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat
	{
		let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
		
		return boundingBox.height
	}

	public func jsonStringToDictionary() -> [String: AnyObject]?
	{
		if let data = self.data(using: String.Encoding.utf8) {
			
			do {
				return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
			}
			catch let error {
				NSLog("jsonStringToDictionary() failed: \(error.localizedDescription)")
			}
		}
		
		return nil
	}
}
