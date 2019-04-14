//
//  Link.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

struct Link: Codable {
	let attributes: LinkAttributes?
}

struct LinkAttributes: Codable {
	let rel: Rel?
	let type: TypeEnum?
	let href: String?
}

enum Rel: String, Codable {
	case alternate = "alternate"
	case relSelf = "self"
}

enum TypeEnum: String, Codable {
	case textHTML = "text/html"
}
