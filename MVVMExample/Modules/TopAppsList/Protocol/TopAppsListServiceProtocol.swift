//  
//  TopAppsListServiceProtocol.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

protocol TopAppsListServiceProtocol {


    /// Fetch top apps list from App store.
    func fetchTopAppsList(success: @escaping(_ data: TopAppsListModel) -> (), failure: @escaping() -> ())

}
