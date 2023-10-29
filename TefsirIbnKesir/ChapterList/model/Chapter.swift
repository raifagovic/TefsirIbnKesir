//
//  Chapter.swift
//  TefsirIbnKesir
//
//  Created by Raif on 22. 10. 2023..
//

import Foundation

struct Chapter: Codable {
    let number: Int
    let name: String
    let placeOfRevelation: String
    let numberOfVerses: Int
    let verses: [Verse]
}
