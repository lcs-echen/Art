
//  SingleArtView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.


import SwiftUI

struct SingleArtView: View {
    var currentArt: ArtDataModel
    @State var artworkImage: Image?
    
    var body: some View {
        VStack{
            HStack {
                Text(currentArt.title)
                    .font(.title)
                Spacer()
                Text(currentArt.date_display)
            }
            .padding()
            
            if let artworkImage = artworkImage {
                artworkImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60)
            }
            
            VStack{
                HStack{
                    Text(currentArt.dimensions)
                        .font(.caption)
                    Spacer()
                }
            }
            .padding()
            HStack{
                VStack (alignment: .leading){
                    Text("Artist Information:")
                    Text(currentArt.artist_display)
                        .padding(.bottom)
                    Text("Place of Origin: ")
                    Text(currentArt.place_of_origin)
                }
                Spacer()
            }
            .padding()
            
            .task {
                if let imageId = currentArt.image_id {
                    artworkImage = await NetworkService.fetchImage(ArtFor: imageId)
                }
            }
        }
        
    }
    
    
    
    
}


struct SingleArtView_Previews: PreviewProvider {
    static var previews: some View {
        SingleArtView(currentArt: artExample)
    }
}
