//
//  AppDelegate.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


		NetworkActivityLogger.shared.level = .debug
		NetworkActivityLogger.shared.startLogging()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		
	}

	func applicationDidEnterBackground(_ application: UIApplication) {

	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		
	}

	func applicationDidBecomeActive(_ application: UIApplication) {

	}

	func applicationWillTerminate(_ application: UIApplication) {

	}


}

