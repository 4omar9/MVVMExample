//
//  Entry.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation

struct Entry: Codable {
	let imName: GeneralDataContainer?
	let imImage: [IMImage]?
	let summary: GeneralDataContainer?
	let imPrice: IMPrice?
	let imContentType: IMContentType?
	let rights, title: GeneralDataContainer?
	let link: Link?
	let id: ID?
	let imArtist: IMArtist?
	let category: Category?
	let imReleaseDate: IMReleaseDate?
	
	enum CodingKeys: String, CodingKey {
		case imName = "im:name"
		case imImage = "im:image"
		case summary
		case imPrice = "im:price"
		case imContentType = "im:contentType"
		case rights, title, link, id
		case imArtist = "im:artist"
		case category
		case imReleaseDate = "im:releaseDate"
	}
}


struct IMArtist: Codable {
	let label: String?
	let attributes: IMArtistAttributes?
}

struct IMArtistAttributes: Codable {
	let href: String?
}

struct IMContentType: Codable {
	let attributes: IMContentTypeAttributes?
}

struct IMContentTypeAttributes: Codable {
	let term, label: TermEnum?
}

enum TermEnum: String, Codable {
	case application = "Application"
}

struct IMImage: Codable {
	let label: String?
	let attributes: IMImageAttributes?
}

struct IMImageAttributes: Codable {
	let height: String?
}
