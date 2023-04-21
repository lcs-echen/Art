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
                    SingleArtView(currentArt: currentArt)
                } else {
                    ProgressView()
                }
                
                Spacer()
            }

            
           
            
            Button(action: {
                Task {
                    withAnimation {
                        currentArt = nil
                    }
                    currentArt = await NetworkService.fetch()
                }
            }, label: {
                Text("Fetch another one")
            })
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            
        }
        .task {
            currentArt = await NetworkService.fetch()
            
        }
        .navigationTitle("Random Art")
    }
    
}


struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}
