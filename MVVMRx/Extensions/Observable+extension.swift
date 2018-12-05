//
//  Observable+extension.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/4/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Observable {
    
    func asDriverIgnoringErrors() -> Driver<E> {
        return self.map { $0 as E? }
            .asDriver(onErrorJustReturn: nil)
            .filter({ $0 != nil })
            .map({ $0! })
    }
    
}
