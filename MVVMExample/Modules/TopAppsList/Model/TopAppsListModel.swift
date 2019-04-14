//  
//  TopAppsListModel.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import Foundation
import Alamofire

struct TopAppsListModel: Codable {
	let feed: Feed?
}

fileprivate func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .iso8601
	return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	encoder.dateEncodingStrategy = .iso8601
	return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
	fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
		return DataResponseSerializer { _, response, data, error in
			guard error == nil else { return .failure(error!) }
			
			guard let data = data else {
				return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
			}
			
			return Result { try newJSONDecoder().decode(T.self, from: data) }
		}
	}
	
	@discardableResult
	fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
		return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
	}
	
	@discardableResult
	func responseTopAppsListModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<TopAppsListModel>) -> Void) -> Self {
		return responseDecodable(queue: queue, completionHandler: completionHandler)
	}
}
