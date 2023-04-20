//
//  SingleArtView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.
//

import SwiftUI

struct SingleArtView: View {
    @State var currentArt = artExample
    var body: some View {
        VStack{
            HStack {
                Text(currentArt.title)
                    .font(.title)
                Text(currentArt.date_display)
            }
            
            
            
            VStack{
                Text(currentArt.dimensions)
                Text(currentArt.credit_line)
                
            }
            .padding()
            Text(currentArt.artist_display)
            Text(currentArt.place_of_origin)
            Text(currentArt.style_title)
            
        }
        
        
        
        
    }
}

struct SingleArtView_Previews: PreviewProvider {
    static var previews: some View {
        SingleArtView()
    }
}
