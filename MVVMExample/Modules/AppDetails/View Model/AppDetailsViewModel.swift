//  
//  AppDetailsViewModel.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import UIKit

final class AppDetailsViewModel {
	
	
	enum AppDetailsViewSections: Int {
		case AppDetailsViewHeader, AppDetailsViewSummary, AppDetailsViewAction
		
		
		static func numberOfSections() -> Int {
			return 3
		}
	}
	
	private var model: Entry? {
		didSet {
			self.title = self.model?.imName?.label ?? ""
			self.didGetData?()
		}
	}
	private let service: AppDetailsServiceProtocol
	
	var title: String = ""
	var networkStatus = Reach().connectionStatus()

	func setModel(entry: Entry) {
		self.model = entry
	}
	
	
	//MARK: -- Closure Collection
	var didGetData: (() -> ())?
	
	init(withAppDetails serviceProtocol: AppDetailsServiceProtocol = AppDetailsService() ) {
		self.service = serviceProtocol
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
		Reach().monitorReachabilityChanges()
		
	}
	
	//MARK: Internet monitor status
	@objc func networkStatusChanged(_ notification: Notification) {
		self.networkStatus = Reach().connectionStatus()
	}
	
	func getSectionViewModel(section: AppDetailsViewSections) -> BaseCellViewModel? {

		switch section {
			
		case .AppDetailsViewHeader:
			if let appName = self.model?.imName?.label, let appImage = URL(string: self.model?.imImage?.first?.label ?? "") {
				return AppCollectionViewCellModel(appName: appName, imageURL: appImage)
			}
			return nil
			
		case .AppDetailsViewSummary:
			if let currency = self.model?.imPrice?.attributes?.currency, let price = self.model?.imPrice?.attributes?.amount,
				let category = self.model?.category?.attributes?.label,
				let summry = self.model?.summary?.label {
				return AppDetailsSummaryCellModel(price: price, currency: currency, category: category, summary: summry)
			}
			
			return nil

		case .AppDetailsViewAction:
			//has no view model.
			return nil
		}
	}
	
	func openAppLink(viewController: UIViewController) {
		if let link = self.model?.link?.attributes?.href  {
			self.service.presentWebView(from: viewController, with: link)
		}
	}
	
	
}
