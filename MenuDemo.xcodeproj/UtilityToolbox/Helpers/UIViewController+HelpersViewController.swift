//
//  UIViewController+HelpersViewController.swift
//  UtilityToolbox
//
//  Created by Frank Burgers on 08/01/2018.
//  Copyright © 2018 Frank Burgers. All rights reserved.
//

import UIKit

public extension UIViewController
{
	func showAlert(_ title: String, message: String, completion: (() -> Void)? = nil)
	{
		guard UIApplication.shared.applicationState != .background else {
			return
		}
		
		DispatchQueue.main.async {
			
			let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
			let okAction = UIAlertAction(title: Constants.okText, style: .cancel, handler: { Void in
				alertController.dismiss(animated: true, completion: nil)
			})
			
			alertController.addAction(okAction)
			
			self.present(alertController, animated: true, completion: completion)
		}
	}
}
