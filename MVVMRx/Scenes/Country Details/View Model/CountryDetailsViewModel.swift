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
    
    var title: Driver<String> { get }
    var imageURL: Driver<URL?> { get }
    var name: Driver<String?> { get }
    var detailsViewModels: Driver<[CountryDetailViewModeling]> { get }
    
}

protocol CountryDetailsViewModeling {
    
    var inputs: CountryDetailsViewModelingInputs { get }
    var outputs: CountryDetailsViewModelingOutputs { get }
    
}

class CountryDetailsViewModel: CountryDetailsViewModeling, CountryDetailsViewModelingInputs, CountryDetailsViewModelingOutputs {
    
    var inputs: CountryDetailsViewModelingInputs { return self }
    var outputs: CountryDetailsViewModelingOutputs { return self }
    
    lazy var title: Driver<String> = {
        return Driver.just("\(country.name.unwrap)(\(country.alpha3Code.unwrap.lowercased()))")
    }()
    
    lazy var imageURL: Driver<URL?> = {
        return Observable.just(country.alpha3Code.unwrap.lowercased())
            .map { URL(string: String(format: Constants.URLPath.flagPathFormat, $0)) }
            .asDriver(onErrorJustReturn: nil)
    }()
    
    lazy var name: Driver<String?> = {
        return Driver.just(country.name)
    }()
    
    lazy var detailsViewModels: Driver<[CountryDetailViewModeling]> = {
       return Driver.just(country)
        .map { [CountryDetailViewModel(title: R.string.localizable.detail_native(), detail: $0.nativeName.unwrap),
                CountryDetailViewModel(title: R.string.localizable.detail_region(), detail: $0.region.unwrap),
                CountryDetailViewModel(title: R.string.localizable.detail_capital(), detail: $0.capital.unwrap),
                CountryDetailViewModel(title: R.string.localizable.detail_population(), detail: $0.population.toString.unwrap)]
            
        }
    }()
    
    // Mark - Private Properties
    
    private let country: Country
    
    // Mark - Initializer
    
    init(country: Country) {
        self.country = country
    }
    
}
