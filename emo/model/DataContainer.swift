//
//  DataWrapper.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public struct DataContainer<Data: Decodable>: Decodable {
    public let lastModified: Date?
    public let expires: Date?
    public let data: Data

    public init(lastModified: Date?,
                expires: Date?,
                data: Data) {
        self.lastModified = lastModified
        self.expires = expires
        self.data = data
    }
}
