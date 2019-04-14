//  
//  AppDetailsService.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import Alamofire
import SafariServices

class AppDetailsService: AppDetailsServiceProtocol {
	
	func presentWebView(from viewController: UIViewController, with link: String) {
		
		guard let url = URL(string: link) else {
			return
		}
		let svc = SFSafariViewController(url: url)
		viewController.present(svc, animated: true, completion: nil)
	}
	
	
}
