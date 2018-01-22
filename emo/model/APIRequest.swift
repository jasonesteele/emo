//
//  APIRequest.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
    /// Response (will be wrapped with a DataContainer)
    associatedtype Response: Decodable

    /// Endpoint for this request (the last part of the URL)
    var resourceName: String { get }
}
