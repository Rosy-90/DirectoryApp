//
//  JsonDecodable.swift
//  DirectoryApp
//
//  Created by Rosy Patel on 09/05/2022.
//

import Foundation

protocol JsonDecodable {
    func decode<T: Codable>(input: Data, type: T.Type) -> [T]?
}

extension JsonDecodable {
    func decode<T: Codable>(input: Data, type: T.Type) -> [T]? {
        return try? JSONDecoder().decode([T].self, from: input)
    }
}
