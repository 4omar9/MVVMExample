//
//  ID.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

struct ID: Codable {
	let label: String?
	let attributes: IDAttributes?
}

struct IDAttributes: Codable {
	let imID, imBundleID: String?
	
	enum CodingKeys: String, CodingKey {
		case imID = "im:id"
		case imBundleID = "im:bundleId"
	}
}
