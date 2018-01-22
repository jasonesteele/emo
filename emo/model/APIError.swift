//
//  EveApiError.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case encoding
    case decoding
    case server(httpStatus: Int, _: String)
    case internalError(_: String)
}
