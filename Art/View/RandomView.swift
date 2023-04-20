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
                    
                    List(currentArt) { art in
                        VStack {
                            SingleArtView(currentArt: art)
                        }
                        
                    }
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
