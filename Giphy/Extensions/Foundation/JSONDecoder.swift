//
//  JSONDecoder.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

extension JSONDecoder {
    func decode<T>(_ type: T.Type, from url: URL) throws -> T where T: Decodable {
        do {
            let data = try Data(contentsOf: url)
            return try decode(type, from: data)
        } catch {
            throw error
        }
    }
}
