//
//  Price.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

struct IMPrice: Codable {
	let label: IMPriceLabel?
	let attributes: IMPriceAttributes?
}

struct IMPriceAttributes: Codable {
	let amount: String?
	let currency: String?
}

enum IMPriceLabel: String, Codable {
	case labelGet = "Get"
}

struct IMReleaseDate: Codable {
	let label: Date?
	let attributes: GeneralDataContainer?
}
