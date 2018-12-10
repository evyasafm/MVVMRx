//  
//  CountryDetailViewModel.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/10/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol CountryDetailViewModelingInputs {
    
}

protocol CountryDetailViewModelingOutputs {
    var title: Driver<String> { get }
    var detail: Driver<String> { get }
}

protocol CountryDetailViewModeling {
    var inputs: CountryDetailViewModelingInputs { get }
    var outputs: CountryDetailViewModelingOutputs { get }
}

class CountryDetailViewModel: CountryDetailViewModeling, CountryDetailViewModelingInputs, CountryDetailViewModelingOutputs {
    var inputs: CountryDetailViewModelingInputs { return self }
    var outputs: CountryDetailViewModelingOutputs { return self }
    
    let title: Driver<String>
    let detail: Driver<String>
    
    init(title: String, detail: String) {
        self.title = Driver.just(title)
        self.detail = Driver.just(detail)
    }
}
