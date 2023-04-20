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
    let date_display: String
    let artist_display: String
    let credit_line: String
    let place_of_origin: String
    let dimensions: String
    let style_title: String
    
}

let artExample = ArtDataModel(id: 129884, title: "Starry Night and the Astronauts", date_display: "1972", artist_display: "Alma Thomas\nAmerican, 1891–1978", credit_line: "Purchased with funds provided by Mary P. Hines in memory of her mother, Frances W. Pick", place_of_origin: "United States", dimensions: "152.4 × 134.6 cm (60 × 53 in.)", style_title: "Contemporary Art")
