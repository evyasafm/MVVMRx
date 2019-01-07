//  
//  CountryViewModel.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/3/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftExt
import RxCocoa

protocol CountryViewModelingInputs {
    
}

protocol CountryViewModelingOutputs {
    var imageURL: Driver<URL?> { get }
    var name: Driver<String?> { get }
    var nativeName: Driver<String?> { get }
    var displayCountryDetails: Observable<CountryDetailsViewModeling> { get }
}

protocol CountryViewModeling {
    var inputs: CountryViewModelingInputs { get }
    var outputs: CountryViewModelingOutputs { get }
}

class CountryViewModel: CountryViewModeling, CountryViewModelingInputs, CountryViewModelingOutputs {
    
    // Mark - Intenrnal Properties
    
    var inputs: CountryViewModelingInputs { return self }
    var outputs: CountryViewModelingOutputs { return self }
    
    lazy var imageURL: Driver<URL?> = {
        return Observable.just(country.alpha3Code.unwrap.lowercased())
            .map { URL(string: String(format: Constants.URLPath.flagPathFormat, $0)) }
            .asDriver(onErrorJustReturn: nil)
    }()
    
    lazy var name: Driver<String?> = {
        return Driver.just(country.name)
    }()
    
    lazy var nativeName: Driver<String?> = {
        return Driver.just(country.nativeName)
    }()
    
    lazy var displayCountryDetails: Observable<CountryDetailsViewModeling> = {
        return Observable.just(CountryDetailsViewModel(country: country))
    }()
    
    // Mark - Private Properties
    
    private let country: Country
    
    // Mark - Initializer
    
    init(countryModel: Country) {
        self.country = countryModel
    }
    
}
