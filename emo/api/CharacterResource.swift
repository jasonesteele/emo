//
//  Character.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public struct CharacterResource: APIRequest {
    public typealias Response = Character

    public var resourceName: String {
        return "characters/\(characterId)"
    }

    public let characterId: Int

    public init(_ characterId: Int) {
        self.characterId = characterId
    }
}
