//
//  GenerateView.swift
//  JaviDALL-E
//
//  Created by Javier Oskar Murillo Cota on 31/03/23.
//

import SwiftUI

struct GenerateView: View {
    @StateObject var viewModel = ViewModel()
    @State var text = "A cute baby sea otter"
    
    var body: some View {
        VStack {
            Text("Create Images by IA")
            Form {
                AsyncImage(url: viewModel.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    VStack{
                        if !viewModel.isLoading{
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                        }else{
                            ProgressView()
                                .padding(.bottom, 12)
                            Text("Cargando..")
                        }
                    }
                    .frame(width: 300, height: 300)
                }//:ASYNC IMAGE
                TextField("Describe the image that you want to generate",
                          text: $text,
                          axis: .vertical)
                .lineLimit(10)
                .lineSpacing(5)
                HStack{
                    Spacer()
                    Button("Generate Image"){
                        Task{
                            await viewModel.generateImage(withText: text)
                        }//:TASK
                    }//:BUTTON
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.isLoading)
                    .padding(.vertical)
                    Spacer()
                }
            }//:FORM
            Spacer()
            HStack{
                Text("Desarrollado por Javier Murillo&reg;")
            }//:HSTACK
        }//:VSTACK
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
