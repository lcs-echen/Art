
//  SingleArtView.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.


import SwiftUI

struct SingleArtView: View {
    @State var currentArt = artExample
    var body: some View {
        VStack{
            HStack {
                Text(currentArt.title)
                    .font(.title)
                Spacer()
               Text(currentArt.date_display)
            }
            .padding()



            VStack{
                HStack{
                    Text(currentArt.dimensions)
                        .font(.caption)
                    Spacer()
                }
                HStack{
                    Text(currentArt.credit_line)
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




    }
}

struct SingleArtView_Previews: PreviewProvider {
    static var previews: some View {
        SingleArtView()
    }
}
