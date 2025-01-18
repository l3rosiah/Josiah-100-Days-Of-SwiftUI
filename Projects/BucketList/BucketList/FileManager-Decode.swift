//
//  FileManager-Decode.swift
//  BucketList
//
//  Created by Grace Filippi on 1/21/24.
//

import Foundation

extension FileManager {
    func decode<T: Codable>(_ file: String) -> T {
        
        let url = URL.documentsDirectory.appending(path: file)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedFile = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from documents directory.")
        }
        
        return decodedFile
    }
}
