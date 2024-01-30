//
//  JokeModel.swift
//  ChuckNorrisJoke
//
//  Created by Alexander on 30.01.2024.
//

import Foundation

struct JokeModel: Codable {
    let category: [String]?
    let icon_url: String?
    let id: String?
    let url: String?
    let value: String?
}
