//
//  Feed.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

struct Feed: Codable {
	let author: Author?
	let entry: [Entry]?
	let updated, rights, title, icon: GeneralDataContainer?
	let link: [Link]?
	let id: GeneralDataContainer?
}
