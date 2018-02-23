//
//  ViewController.swift
//  MenuDemo
//
//  Created by Frank Burgers on 16/02/2018.
//  Copyright © 2018 Frank Burgers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MenuViewItemSelectedDelegate
{
	fileprivate let menuView = MenuView(items: [ "First",
												 "Second",
												 "Third",
												 "Fourth",
												 "Fifth",
												 "Sixth",
												 "Seventh",
												 "Eighth" ])
	
	// MARK: - View lifecycle -
	
	override func viewDidLoad()
	{
		super.viewDidLoad()

		menuView.delegate = self
		menuView.menuBackgroundColor = .red
		menuView.menuFont = Theme.fontMenuItem!
		menuView.menuTextColor = Theme.colorMenuItemText
		
		view.addSubview(menuView)
		
		menuView.setPosition(x: Double(Theme.defaultMargin), y: Double(UIApplication.shared.statusBarFrame.height))
	}
	
	// MARK: - Handler methods -
	
	func didSelectMenuItem(_ itemTitle: String)
	{
		print(itemTitle)
	}
}
