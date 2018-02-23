//
//  MenuView.swift
//  MenuDemo
//
//  Created by Frank Burgers on 16/02/2018.
//  Copyright © 2018 Frank Burgers. All rights reserved.
//

import UIKit

@IBDesignable class MenuView: UIView
{
	fileprivate let defaultMargin = 8.0
	fileprivate let defaultCornerRadius: CGFloat = 4.0
	fileprivate let defaultColorIconContainerBackground = UIColor(white: 0.8, alpha: 0.5)
	fileprivate let springDampingRatio: CGFloat = 0.45
	fileprivate let initialSpringVelocity: CGFloat = 11
	fileprivate let animationDurationShort = 0.25
	fileprivate let animationDuration = 0.4
	fileprivate let iconMenuContainerHeight = 56.0
	fileprivate let iconMenuContainerWidth = 56.0
	fileprivate let iconMenuHeight = 56.0
	fileprivate let iconMenuWidth = 56.0
	fileprivate let iconHeight = 34.0
	fileprivate let iconWidth = 34.0
	fileprivate let iconMenuView = UIButton(type: .custom)
	fileprivate let menuItemsView = MenuItemsView()

	fileprivate var menuExpanded = false
	
	var delegate: MenuViewItemSelectedDelegate? {
		
		get {
			return menuItemsView.delegate
		}
		
		set(del) {
			menuItemsView.delegate = del
		}
	}
	
	var menuHeight: CGFloat {
		
		get {
			return menuItemsView.menuHeight
		}
	}
	
	@IBInspectable var menuBackgroundColor: UIColor {
		
		get {
			return menuItemsView.menuBackgroundColor ?? .clear
		}
		
		set(newColor) {
			menuItemsView.menuBackgroundColor = newColor
		}
	}
	
	@IBInspectable var menuFont: UIFont {
		
		get {
			return menuItemsView.menuItemsFont
		}
		
		set(newFont) {
			menuItemsView.menuItemsFont = newFont
		}
	}

	@IBInspectable var menuTextColor: UIColor {
		
		get {
			return menuItemsView.menuItemsTextColor
		}
		
		set(newColor) {
			menuItemsView.menuItemsTextColor = newColor
		}
	}
	
	convenience init(items: [String])
	{
		self.init(frame: .zero)
		menuItemsView.menuItems = items
	}
	
	override init(frame: CGRect)
	{
		super.init(frame: frame)

		translatesAutoresizingMaskIntoConstraints = false
		clipsToBounds = true
		layer.cornerRadius = defaultCornerRadius
		
		iconMenuView.translatesAutoresizingMaskIntoConstraints = false
		iconMenuView.setImage(UIImage(named: "IconMenu"), for: .normal)
		iconMenuView.showsTouchWhenHighlighted = true
		iconMenuView.backgroundColor = defaultColorIconContainerBackground
		iconMenuView.layer.cornerRadius = defaultCornerRadius
		iconMenuView.addTarget(self, action: #selector(menuIconTapped(_:)), for: .touchUpInside)
		addSubview(iconMenuView)
	
		addSubview(menuItemsView)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
	
	func setPosition(x: Double = 0.0, y: Double = 0.0)
	{
		// Position of menu.
		//
		let _ = layoutAnchorLeft(x, priority: .required)
		let _ = layoutAnchorTop(y, priority: .required)
		let _ = layoutWidth(iconMenuContainerWidth)
		let _ = layoutHeight(iconMenuContainerHeight)
		
		// Hamburger menu icon.
		//
		let _ = iconMenuView.layoutAnchorTop()
		let _ = iconMenuView.layoutAnchorLeft()
		let _ = iconMenuView.layoutWidth(iconMenuContainerWidth)
		let _ = iconMenuView.layoutHeight(iconMenuContainerHeight)
		
		// Menu items view.
		//
		let _ = menuItemsView.layoutAnchorTop(iconMenuContainerHeight, priority: .required)
		let _ = menuItemsView.layoutAnchorLeft()
		let _ = menuItemsView.layoutWidth(250.0)
		let _ = menuItemsView.layoutHeight(Double(menuItemsView.menuHeight) + iconMenuContainerHeight)
	}

	@objc fileprivate func menuIconTapped(_ sender: UIButton)
	{
		toggleMenu()
	}
	
	fileprivate func toggleMenu()
	{
		UIView.animate(withDuration: (self.menuExpanded == true ? animationDurationShort : animationDuration),
			delay: 0,
			usingSpringWithDamping: (self.menuExpanded == true ? 1.0 : springDampingRatio),
			initialSpringVelocity: (self.menuExpanded == true ? 0.0 : initialSpringVelocity),
			options: (self.menuExpanded == true ? .curveLinear : .curveEaseOut),
			animations: {
				
				var frame = self.frame
				
				frame.size = (self.menuExpanded == true ? CGSize(width: self.iconMenuContainerWidth, height: self.iconMenuContainerHeight) : CGSize(width: self.menuItemsView.frame.width, height: self.menuItemsView.frame.height))
				self.frame = frame
			},
			completion: { (Bool) in
				self.menuExpanded = !self.menuExpanded
			})
	}
}
