//
//  Product.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC04 on 2024-03-18.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct ProductModel: Codable {
    let id, title: String?
    let price: Int?
    let description, category: String?
    let gender: Gender
    let image: [String?]
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, price, description, category, gender, image
        case v = "__v"
    }
}

enum Gender: String, Codable {
    case men = "MEN"
    case women = "WOMEN"
}
