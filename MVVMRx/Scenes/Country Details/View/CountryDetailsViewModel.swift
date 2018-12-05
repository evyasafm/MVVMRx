//  
//  CountryDetailsViewModel.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/5/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol CountryDetailsViewModelingInputs {
    
}

protocol CountryDetailsViewModelingOutputs {
    var imageURL: Driver<URL?> { get }
}

protocol CountryDetailsViewModeling {
    var inputs: CountryDetailsViewModelingInputs { get }
    var outputs: CountryDetailsViewModelingOutputs { get }
}

class CountryDetailsViewModel: CountryDetailsViewModeling, CountryDetailsViewModelingInputs, CountryDetailsViewModelingOutputs {
    var inputs: CountryDetailsViewModelingInputs { return self }
    var outputs: CountryDetailsViewModelingOutputs { return self }
    
    lazy var imageURL: Driver<URL?> = {
        return Observable.just(countryModel.alpha2Code)
            .map { URL(string: String(format: Constants.URLPath.flagPathFormat, $0 ?? "")) }
            .asDriver(onErrorJustReturn: nil)
    }()
    
    // Mark - Private Properties
    
    private let countryModel: CountryModel
    
    // Mark - Initializer
    
    init(countryModel: CountryModel) {
        self.countryModel = countryModel
    }
    
}
