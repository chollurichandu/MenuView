//
//  AppDelegate.swift
//  MenuDemo
//
//  Created by Frank Burgers on 16/02/2018.
//  Copyright © 2018 Frank Burgers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
	{
		Theme.initAppearance()
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		if let w = window {
			
			w.backgroundColor = Theme.colorScreenBackground
			w.rootViewController = ViewController()
			w.makeKeyAndVisible()
		}
		
		return true
	}
}

