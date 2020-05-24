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
    let results: [User]
    let info: Info
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseInfo { response in
//     if let info = response.result.value {
//       ...
//     }
//   }

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseResult { response in
//     if let result = response.result.value {
//       ...
//     }
//   }

// MARK: - User
struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDob { response in
//     if let dob = response.result.value {
//       ...
//     }
//   }

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseID { response in
//     if let iD = response.result.value {
//       ...
//     }
//   }

// MARK: - ID
struct ID: Codable {
    let name, value: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLocation { response in
//     if let location = response.result.value {
//       ...
//     }
//   }

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCoordinates { response in
//     if let coordinates = response.result.value {
//       ...
//     }
//   }

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStreet { response in
//     if let street = response.result.value {
//       ...
//     }
//   }

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTimezone { response in
//     if let timezone = response.result.value {
//       ...
//     }
//   }

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLogin { response in
//     if let login = response.result.value {
//       ...
//     }
//   }

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseName { response in
//     if let name = response.result.value {
//       ...
//     }
//   }

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePicture { response in
//     if let picture = response.result.value {
//       ...
//     }
//   }

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }

    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    @discardableResult
    func responseUsers(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Users>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
