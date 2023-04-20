//
//  ArtModel.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.
//

import Foundation

struct ArtDataModel: Codable{
    
    let id: Int
    let title: String
    let date_display: Double
    let artist_display: String
    let place_of_origin: String
    let dimensions: String
    let style_title: String
    
}

let artExample = (
