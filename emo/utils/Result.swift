//
//  Result.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(APIError)
}

public typealias ResultCallback<Value> = (Result<Value>) -> Void
