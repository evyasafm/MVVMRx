//  
//  CountriesViewModel.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/3/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol CountriesViewModelingInputs {
    var searchText: BehaviorRelay<String?> { get }
    var selectCountry: PublishRelay<CountryViewModeling> { get }
}

protocol CountriesViewModelingOutputs {
    var title: Observable<String?> { get }
    var countriesViewModel: Observable<[CountryViewModeling]> { get }
    var displayCountryDetails: Observable<CountryDetailsViewModeling> { get }
}

protocol CountriesViewModeling {
    var inputs: CountriesViewModelingInputs { get }
    var outputs: CountriesViewModelingOutputs { get }
}

class CountriesViewModel: CountriesViewModeling, CountriesViewModelingInputs, CountriesViewModelingOutputs {

    var inputs: CountriesViewModelingInputs { return self }
    var outputs: CountriesViewModelingOutputs { return self }
    
    // Mark - Inputs
    
    var searchText = BehaviorRelay<String?>(value: nil)
    var selectCountry = PublishRelay<CountryViewModeling>()
    
    // Mark - Outputs
    
    lazy var title: Observable<String?> = {
       return Observable.just(R.string.localizable.countries_title())
    }()
    
    lazy var countriesViewModel: Observable<[CountryViewModeling]> = {
        return Observable.combineLatest(searchText, fetchCountries)
            .map { searchText, countries -> [Country] in
                return countries.filter { $0.name.unwrap.hasPrefix(searchText.unwrap) }
            }
            .map { countries -> [CountryViewModeling] in
                return countries.map { CountryViewModel(countryModel: $0) }
            }
    }()
    
    lazy var displayCountryDetails: Observable<CountryDetailsViewModeling> = {
        return selectCountry
            .flatMap({ (countryViewModeling) -> Observable<CountryDetailsViewModeling> in
                return countryViewModeling.outputs.displayCountryDetails
            })
    }()
    
    // Mark - Private members
    
    private let disposeBag = DisposeBag()
    private let countriesUseCase: CountriesUseCase
    private let fetchCountries = BehaviorRelay<[Country]>(value: [Country]())
    
    // Mark - Initializer
    
    init(countriesUseCase: CountriesUseCase = CountriesUseCaseHandler()) {
        self.countriesUseCase = countriesUseCase
        setupObservers()
    }

}

fileprivate extension CountriesViewModel {

    func setupObservers() {
        countriesUseCase.fetchCountries()
            .asObservable()
            .bind(to: fetchCountries)
            .disposed(by: disposeBag)
    }
    
}
