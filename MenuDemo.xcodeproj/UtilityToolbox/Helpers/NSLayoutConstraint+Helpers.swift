//
//  NSLayoutConstraint+Helpers.swift
//  LocAware
//
//  Created by Frank Burgers on 02/08/16.
//  Copyright © 2016 Locatienet BV. All rights reserved.
//

import UIKit

protocol MarginElement
{
	var margins: UIEdgeInsets? {get}
}

public func visualFormat(_ format: String, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), views: [String : AnyObject]) -> [NSLayoutConstraint]?
{
	return NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: views) as [NSLayoutConstraint]
}

public extension NSLayoutConstraint
{
    class public func constraintForMatchingBounds(_ view: UIView, matchedView: UIView) -> [NSLayoutConstraint]?
	{
        let constraints = [NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: matchedView, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: matchedView, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: matchedView, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: matchedView, attribute: .bottom, multiplier: 1.0, constant: 0)]

        return constraints
    }

    class public func constraintsWithVisualFormat(_ format: String, views: [String : AnyObject]) -> [NSLayoutConstraint]?
	{
        return self.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: views) as [NSLayoutConstraint]
    }

    class public func constraintsWithVisualFormat(_ format: String, options: NSLayoutFormatOptions, views: [String : AnyObject]) -> [NSLayoutConstraint]?
	{
        return self.constraints(withVisualFormat: format, options: options, metrics: nil, views: views) as [NSLayoutConstraint]
    }

    class public func constraintsForCentering(_ view: UIView, inView: UIView) -> [NSLayoutConstraint]?
	{
        let centerYConstraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.centerY,
            relatedBy: NSLayoutRelation.equal,
            toItem: inView,
            attribute: NSLayoutAttribute.centerY,
            multiplier: 1.0,
            constant: 0.0)

        let centerXConstraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: inView,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0.0)

        return [centerXConstraint, centerYConstraint]
    }
}
