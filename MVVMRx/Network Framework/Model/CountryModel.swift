//
//  CountryModel.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation

struct CountryModel: Decodable {
    
    var name: String?
    var nativeName: String?
    var alpha3Code: String?
    var region: String?
    var population: Int?
    var capital: String?
}
