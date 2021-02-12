//
//  ResponsePlayers.swift
//  FreeNba
//
//  Created by Mauro Olivo on 12/02/21.
//

import Foundation

// MARK: - ResponsePlayers
struct ResponsePlayers: Codable {
    let data: [Player]?
    let meta: Meta?
}

// MARK: - Datum
struct Player: Codable {
    let id: Int?
    let firstName: String?
    let heightFeet, heightInches: Int?
    let lastName, position: String?
    let team: Team?
    let weightPounds: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
        case lastName = "last_name"
        case position, team
        case weightPounds = "weight_pounds"
    }
}

