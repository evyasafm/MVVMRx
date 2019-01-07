//
//  CountryModel.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation

protocol Country {
    
    var name: String? { get }
    var nativeName: String? { get }
    var alpha3Code: String? { get }
    var region: String? { get }
    var population: Int? { get }
    var capital: String? { get }
    
}

struct CountryModel: Country, Decodable {
    
    var name: String?
    var nativeName: String?
    var alpha3Code: String?
    var region: String?
    var population: Int?
    var capital: String?
}
