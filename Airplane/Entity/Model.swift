//
//  Model.swift
//  Airplane
//
//  Created by Carlos on 23/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation
import Alamofire

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUsers { response in
//     if let users = response.result.value {
//       ...
//     }
//   }

// MARK: - Users
struct Users: Codable {
    let results: [UserResult]?
}

// MARK: - User
struct UserResult: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let dob, registered: Dob?
    let phone, cell: String?
    let picture: Picture?
    let nat: String?
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let coordinates: Coordinates?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
}
