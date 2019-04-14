//
//  Category.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation


struct Category: Codable {
	let attributes: CategoryAttributes?
}

struct CategoryAttributes: Codable {
	let imID, term: String?
	let scheme: String?
	let label: String?
	
	enum CodingKeys: String, CodingKey {
		case imID = "im:id"
		case term, scheme, label
	}
}
