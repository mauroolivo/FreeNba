//
//  ResponseTeams.swift
//  FreeNba
//
//  Created by Mauro Olivo on 12/02/21.
//

import Foundation

// MARK: - Teams
struct ResponseTeams: Codable {
    let data: [Team]?
    let meta: Meta?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let abbreviation, city, conference: String?
    let division, fullName, name: String?

    enum CodingKeys: String, CodingKey {
        case id, abbreviation, city, conference, division
        case fullName = "full_name"
        case name
    }
}

// MARK: - Meta
struct Meta: Codable {
    let totalPages, currentPage, nextPage: Int?
    let perPage, totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}
