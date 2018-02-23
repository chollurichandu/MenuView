//
//  UIView+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 08/08/16.
//  Copyright © 2016 Locatienet BV. All rights reserved.
//

import UIKit

public extension UIView
{
	public func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
	{
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}

	public func firstResponder() -> UIView?
	{
		if self.isFirstResponder {
			return self
		}
		
		for subview in self.subviews {

			if let firstResponder = subview.firstResponder() {
				return firstResponder
			}
		}
		
		return nil
	}

	public func layoutAnchorTop(_ margin: Double = 0, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("V:|-(\(margin)@\(priority.rawValue))-[self]")
	}
	
	public func layoutAnchorBottom(_ margin: Double = 0, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("V:[self]-(\(margin)@\(priority.rawValue))-|")
	}
	
	public func layoutAnchorRight(_ margin: Double = 0, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("H:[self]-(\(margin)@\(priority.rawValue))-|")
	}
	
	public func layoutAnchorLeft(_ margin: Double = 0, priority: UILayoutPriority = UILayoutPriority.required) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("H:|-(\(margin)@\(priority.rawValue))-[self]")
	}
	
	public func layoutMatchHeightToWidth(_ view: UIView, multiplier: CGFloat = 1.0) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: multiplier, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func layoutMatchWidthToheight(_ view: UIView, multiplier: CGFloat = 1.0) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: multiplier, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func layoutMatchCenterX(_ view: UIView) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func layoutMatchCenterY(_ view: UIView) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func layoutMatchBottomY(_ view: UIView) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func layoutMatchLeft(_ view: UIView) -> [NSLayoutConstraint]
	{
		let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
		
		if let s = self.superview {
			s.addConstraint(constraint)
		}
		
		return [constraint]
	}
	
	public func clearConstraints()
	{
		self.removeConstraints(self.constraints)
	}
	
	public func layoutFullWidth(_ leftMargin: CGFloat = 0.0, rightMargin: CGFloat = 0.0) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("H:|-(\(leftMargin))-[self]-(\(rightMargin))-|")
	}
	
	public func layoutHeight(_ height: Double) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("V:[self(\(height))]")
	}
	
	public func layoutFullHeight(_ topMargin: CGFloat = 0.0, bottomMargin: CGFloat = 0.0) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("V:|-(\(topMargin))-[self]-(\(bottomMargin))-|")
	}
	
	fileprivate func applyVisualFormat(_ format: String) -> [NSLayoutConstraint]?
	{
		if let s = self.superview {
			
			if let constraints = visualFormat(format, views: ["self" : self]) {
				
				s.addConstraints(constraints)
				return constraints
			}
		}
		
		return nil
	}
	
	public func layoutFillSuperview(_ margin: CGFloat = 0) -> [NSLayoutConstraint]?
	{
		var combinedConstraints = [NSLayoutConstraint]()
		
		if let widthConstraints = layoutFullWidth(margin, rightMargin: margin) {
			combinedConstraints += widthConstraints
		}
		
		if let heightConstraints = layoutFullHeight(margin, bottomMargin: margin) {
			combinedConstraints += heightConstraints
		}
		
		return combinedConstraints
	}
	
	public func layoutSize(_ size: Double = 0) -> [NSLayoutConstraint]?
	{
		var combinedConstraints = [NSLayoutConstraint]()
		
		if let widthConstraints = layoutWidth(size) {
			combinedConstraints += widthConstraints
		}
		
		if let heightConstraints = layoutHeight(size) {
			combinedConstraints += heightConstraints
		}
		
		return combinedConstraints
	}
	
	
	public func layoutWidth(_ width: Double) -> [NSLayoutConstraint]?
	{
		return applyVisualFormat("H:[self(\(width))]")
	}
	
	public func layoutCenterHorizontally() -> [NSLayoutConstraint]?
	{
		if let s = self.superview {
			
			let centerXConstraint = NSLayoutConstraint(item: self,
													   attribute: NSLayoutAttribute.centerX,
													   relatedBy: NSLayoutRelation.equal,
													   toItem: s,
													   attribute: NSLayoutAttribute.centerX,
													   multiplier: 1.0,
													   constant: 0.0)
			
			s.addConstraint(centerXConstraint)
			
			return [centerXConstraint]
		}
		
		return nil
	}
	
	public func layoutCenterVertically() -> [NSLayoutConstraint]?
	{
		if let s = self.superview {
			
			let centerYConstraint = NSLayoutConstraint(item: self,
													   attribute: NSLayoutAttribute.centerY,
													   relatedBy: NSLayoutRelation.equal,
													   toItem: s,
													   attribute: NSLayoutAttribute.centerY,
													   multiplier: 1.0,
													   constant: 0.0)
			
			s.addConstraint(centerYConstraint)
			
			return [centerYConstraint]
		}
		
		return nil
	}
	
	public func layoutSubviewsHorizontal(_ views: [UIView]?, startMargin: Double = 0, endMargin: Double = 0, margin: Double = 0, capEnd: Bool = true, formatOptions: NSLayoutFormatOptions = NSLayoutFormatOptions()) -> [NSLayoutConstraint]?
	{
		return layoutSubviewsLineair(views, startMargin: startMargin, endMargin: endMargin, margin: margin, orientation: "H", capEnd: capEnd, formatOptions: formatOptions)
	}
	
	public func layoutSubviewsVertical(_ views: [UIView], topMargin: Double = 0, bottomMargin: Double = 0, margin: Double = 0, capEnd: Bool = true, formatOptions: NSLayoutFormatOptions = NSLayoutFormatOptions()) -> [NSLayoutConstraint]?
	{
		return layoutSubviewsLineair(views, startMargin: topMargin, endMargin: bottomMargin, margin: margin, orientation: "V", capEnd: capEnd, formatOptions: formatOptions)
	}
	
	fileprivate func layoutSubviewsLineair(_ views: [UIView]?, startMargin: Double = 0, endMargin: Double = 0, margin: Double = 0, orientation: String, capEnd: Bool = true, formatOptions: NSLayoutFormatOptions = NSLayoutFormatOptions()) -> [NSLayoutConstraint]?
	{
		guard let views = views else {
			return nil
		}
		
		if views.count == 0 {
			return nil
		}
		
		var viewDictionary = [String :UIView]()
		var vflStrings = [String]()
		
		for i in 0 ..< views.count {
			
			let view = views[i]
			viewDictionary["view\(i)"] = view
			vflStrings.append("[view\(i)]")
		}
		
		var stringSeperator = ""
		
		if margin > 0 {
			stringSeperator = "-\(margin)-"
		}
		
		var vfl = "\(orientation):|-\(startMargin)-"
		
		for (index, vflString) in vflStrings.enumerated() {
			
			if let customMargins = (views[index] as? MarginElement)?.margins {
				vfl += orientation == "V" ? "-\(customMargins.top)-" : "-\(customMargins.left)-"
				vfl += vflString
			}
			else if index == 0 {
				vfl += vflString
			}
			else {
				vfl += stringSeperator+vflString
			}
		}
		
		if capEnd {
			vfl += "-\(endMargin)-|"
		}
		
		if let constraints = visualFormat(vfl, options: formatOptions, views: viewDictionary) {
			
			self.addConstraints(constraints)
			return constraints
		}
		
		return nil
	}
}
