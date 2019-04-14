//  
//  TopAppsListViewModel.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

final class TopAppsListViewModel {

    private let service: TopAppsListServiceProtocol

	private var model: TopAppsListModel? {
        didSet {
			self.count = self.model?.feed?.entry?.count ?? 0
			self.title = self.model?.feed?.title?.label ?? ""
        }
    }

    /// Count your data in model
    var count: Int = 0
	var title: String = ""

    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withTopAppsList serviceProtocol: TopAppsListServiceProtocol = TopAppsListService() ) {
		self.service = serviceProtocol
		
		NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
		Reach().monitorReachabilityChanges()
		
	}

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    //MARK: -- Example Func
    func requestData() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            // call your service here
			self.service.fetchTopAppsList(success: { (topList) in
				self.isLoading = false
				self.model = topList
				self.didGetData?()
			}) {
				self.isLoading = false
			}
        default:
            break
        }
    }

	/// Used to get app at specific index
	///
	/// - Parameter row: index of the item
	/// - Returns: The app Object if it is exisit.
	func getItemFor(index: Int) -> Entry? {
		if let item = self.model?.feed?.entry?[index] {
			return item
		}
		return nil
	}
	
	/// Returns app name at specific index
	func getAppNameFor(index: Int) -> String? {
		return self.getItemFor(index: index)?.imName?.label
		
	}
	
	/// Returns app image at spoecific Index
	func getAppImageURLFor(index: Int) -> URL? {
		return URL(string: self.getItemFor(index: index)?.imImage?.first?.label ?? "")
	}
	

}

