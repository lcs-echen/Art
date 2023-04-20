//
//  RandomView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.
//

import SwiftUI

struct RandomView: View {
    @State var currentArt: [ArtDataModel] = []
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                if currentArt.count > 0 {
                    
                    List(currentArt, id: \.id) { art in
                        VStack {
                            Text(art.title)
                            Text(art.date_display)
                        }
                        
                    }
                    .task {
                        currentArt = await NetworkService.fetch()
                    }
                   
//                   HStack {
//                        Text(currentArt.title)
//                        Text(currentArt.date_display)
//                    }
//
//                    VStack{
//                        Text(currentArt.dimensions)
//                        Text(currentArt.credit_line)
//
//                    }
//                    .padding()
                    
//                    Text(currentArt.artist_display)
//                    Text(currentArt.place_of_origin)
//                    Text(currentArt.style_title)
                }
                else {
                    Text("No")
                }
                Spacer()
                
//                Button(action: {
//                    Task {
//
//                        withAnimation {
//                            currentArt = nil
//                        }
//                        currentArt = await NetworkService.fetch()
//                    }
//                }, label: {
//                    Text("Fetch another one")
//                })
//                .buttonStyle(.borderedProminent)
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
