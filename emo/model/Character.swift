//
//  Character.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public struct Character: Decodable {
    enum CharacterKeys: String, CodingKey {
        case corporationId = "corporation_id"
        case birthday
        case name
        case gender
        case raceId = "race_id"
        case bloodlineId = "bloodline_id"
        case description
        case allianceId = "alliance_id"
        case ancestryId = "ancestry_id"
        case securityStatus = "security_status"
    }

    let corporationId: Int
    let birthday: Date?
    let name: String
    let gender: String
    let raceId: Int
    let bloodlineId: Int
    let description: String
    let allianceId: Int
    let ancestryId: Int
    let securityStatus: Double

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CharacterKeys.self)

        corporationId = try container.decode(Int.self, forKey: .corporationId)

        let birthdayStr = try container.decode(String.self, forKey: .birthday)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        birthday = dateFormatter.date(from: birthdayStr)

        name = try container.decode(String.self, forKey: .name)
        gender = try container.decode(String.self, forKey: .gender)
        raceId = try container.decode(Int.self, forKey: .raceId)
        bloodlineId = try container.decode(Int.self, forKey: .bloodlineId)
        description = try container.decode(String.self, forKey: .description)
        allianceId = try container.decode(Int.self, forKey: .allianceId)
        ancestryId = try container.decode(Int.self, forKey: .ancestryId)
        securityStatus = try container.decode(Double.self, forKey: .securityStatus)
    }
}
