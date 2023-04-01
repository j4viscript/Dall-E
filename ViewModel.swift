//
//  ViewModel.swift
//  JaviDALL-E
//
//  Created by Javier Oskar Murillo Cota on 31/03/23.
//

import Foundation

final class ViewModel: ObservableObject{
    private let urlSession: URLSession
    @Published var imageURL: URL?

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    func generateImage(withText text: String) async{
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else{
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        let dictionary: [String: Any] = [
            "n": 1,
            "size": "1024x1024",
            "prompt": text
        ]
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        do{
            let (data, _) = try await urlSession.data(for: urlRequest)
            let model = try JSONDecoder().decode(ModelResponse.self, from: data)
            
            DispatchQueue.main.async {
                guard let firstModel = model.data.first else {
                    return
                }
                self.imageURL = URL(string: firstModel.url)
                print(self.imageURL ?? "No Image URL")
            }
            
        }catch{
            print("Semen")
        }
    }
}
