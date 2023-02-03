//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Ugur Aker on 2.02.2023.
//

import Foundation

struct Theme<CardContent> {
    let name: String
    let color: String
    let values: [CardContent]
}
