//  
//  TopAppsListService.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import Alamofire

class TopAppsListService: TopAppsListServiceProtocol {
	
	func fetchTopAppsList(success: @escaping(_ data: TopAppsListModel) -> (), failure: @escaping() -> ()) {
		
		let url = "https://itunes.apple.com/jo/rss/topfreeapplications/limit=50/json"
		
		Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseTopAppsListModel { response in
			if let topAppsListModel = response.result.value {
				success(topAppsListModel)
			} else {
				failure()
			}
		}
	}

}
