//
//  ViewModel.swift
//  JaviDALL-E
//
//  Created by Javier Oskar Murillo Cota on 31/03/23.
//

import Foundation

final class ViewModel: ObservableObject{
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    func generateImage(withText text: String){
        
    }
}
