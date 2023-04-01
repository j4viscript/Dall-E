//
//  Model.swift
//  JaviDALL-E
//
//  Created by Javier Oskar Murillo Cota on 01/04/23.
//

import Foundation


struct DataResponse: Decodable {
    let url: String
}

struct ModelResponse: Decodable{
    let data: [DataResponse]
}
