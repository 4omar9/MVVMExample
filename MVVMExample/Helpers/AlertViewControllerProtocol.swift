//
//  Ext.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import UIKit

/// AlertViewControllerProtocol used to show alert view on view
protocol AlertViewControllerProtocol where Self: UIViewController {
	
	/**
	Call this function to show alert view on view of caller view controller
	
	- Parameter title: The title of alert view
	- Parameter message: The message of alert view
	- Parameter alertStyle: The style of alert view
	- Parameter actions: The actions that need to be showen
	*/
	func showAlert(title: String?, message: String, alertStyle: UIAlertController.Style, actions: [UIAlertAction]?)
	
}

extension UIViewController: AlertViewControllerProtocol {
	
	func showAlert(title: String? = nil, message: String, alertStyle: UIAlertController.Style = .alert, actions: [UIAlertAction]? = nil) {
		
		let alertViewController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
		
		if let actions = actions {
			
			for action in actions {
				
				alertViewController.addAction(action)
				
			}
			
		} else {
			
			alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		}
		
		
		
		self.present(alertViewController, animated: true, completion: nil)
	}
	
}

public extension UIAlertController {
	func show() {
		let window = UIWindow(frame: UIScreen.main.bounds)
		let vc = UIViewController()
		vc.view.backgroundColor = .clear
		window.rootViewController = vc
		window.windowLevel = UIWindow.Level.alert + 1
		window.makeKeyAndVisible()
		vc.present(self, animated: true, completion: nil)
	}
}
