//  
//  AppDetailsServiceProtocol.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import UIKit

protocol AppDetailsServiceProtocol {

	/// Opens webview using a link.
	///
	/// - Parameters:
	///   - viewController: view controller to show from
	///   - link: Link to open
	func presentWebView(from viewController: UIViewController, with link: String)
	
}
