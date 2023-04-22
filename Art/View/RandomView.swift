//
//  RandomView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.
//

import SwiftUI

struct RandomView: View {
    @State var currentArt: ArtDataModel?
    @State var artworkImage: Image?
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                if let currentArt = currentArt {
                    VStack{
                        VStack(alignment: .center) {
                            Text(currentArt.title)
                                .font(.title)
                                .fontWeight(.semibold)
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
                        .padding(20)
                        HStack{
                            VStack (alignment: .leading){
                                Text("Artist Information:")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(currentArt.artist_display)
                                    .padding(.bottom)
                                Text("Place of Origin: ")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(currentArt.place_of_origin)
                            }
                            Spacer()
                        }
                        .padding([.leading, .bottom, .trailing])
                        
                        .task {
                            if let imageId = currentArt.image_id {
                                artworkImage = await NetworkService.fetchImage(ArtFor: imageId)
                            }
                        }
                        
                    }
                } else {
                    ProgressView()
                }
                
                Spacer()
                Button(action: {
                    Task {
                        withAnimation {
                            currentArt = nil
                            artworkImage = nil
                        }
                        currentArt = await NetworkService.fetch()
                        if let imageId = currentArt?.image_id {
                            artworkImage = await NetworkService.fetchImage(ArtFor: imageId)
                        }
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .task {
                    currentArt = await NetworkService.fetch()
            }
            .navigationTitle("Random Art")

            
        }
        
        
    }
    
}


struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}
