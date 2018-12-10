//
//  String+extension.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/10/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    
    var unwrap: String {
        return self ?? ""
    }
    
}

extension Optional where Wrapped == Int {
    
    var toString: String? {
        guard let self = self else {
            return nil
        }
        return String(self)
    }
    
}
