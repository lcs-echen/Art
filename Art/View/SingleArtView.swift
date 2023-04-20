
//  SingleArtView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.


import SwiftUI

struct SingleArtView: View {
    @State var currentArt = artExample
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
                    .scaledToFit()
                    .frame(width: 400)
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
                    Text(currentArt.artist_display)
                    Text(currentArt.place_of_origin)
                }
                Spacer()
            }
            .padding()

           
        }
        .task {
            if let imageId = currentArt.image_id {
                artworkImage = await NetworkService.fetchImage(resultFor: imageId)
            }
        }




    }
}

struct SingleArtView_Previews: PreviewProvider {
    static var previews: some View {
        SingleArtView()
    }
}
