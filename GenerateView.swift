//
//  GenerateView.swift
//  JaviDALL-E
//
//  Created by Javier Oskar Murillo Cota on 31/03/23.
//

import SwiftUI

struct GenerateView: View {
    @State var text = "Two astronautrs exploring the dark, cavernouse interior of a huge derelict spacecraft"
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Form {
                AsyncImage(url: URL(string: "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                }placeholder: {
                    VStack{
                        Image(systemName: "photo.on.rectangle.angled")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 300, height: 300)
                }
                
                TextField("Describe the image that you want to generate",
                          text: $text,
                          axis: .vertical)
                .lineLimit(10)
                .lineSpacing(5)
                HStack{
                    Spacer()
                    Button("Generate"){
                        //TODO
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(false)
                    .padding(.vertical)
                    Spacer()
                }
            }
        }
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
