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
    var title: Driver<String> { get }
    var countriesViewModel: Driver<[CountryViewModeling]> { get }
    var displayCountryDetails: Observable<CountryDetailsViewModeling> { get }
}

protocol CountriesViewModeling {
    var inputs: CountriesViewModelingInputs { get }
    var outputs: CountriesViewModelingOutputs { get }
}

class CountriesViewModel: CountriesViewModeling, CountriesViewModelingInputs, CountriesViewModelingOutputs {
    
    var test = BehaviorSubject<String?>(value: nil)

    var inputs: CountriesViewModelingInputs { return self }
    var outputs: CountriesViewModelingOutputs { return self }
    
    var searchText = BehaviorRelay<String?>(value: nil)
    var selectCountry = PublishRelay<CountryViewModeling>()
    
    lazy var title: Driver<String> = {
       return Driver.just(R.string.localizable.countries_title())
    }()
    
    lazy var countriesViewModel: Driver<[CountryViewModeling]> = {
        return Observable.combineLatest(searchText, fetchCountries)
            .map { searchText, countries -> [Country] in
                return countries.filter { $0.name.unwrap.hasPrefix(searchText.unwrap) }
            }
            .map { countries -> [CountryViewModeling] in
                return countries.map { CountryViewModel(countryModel: $0) }
            }
            .asDriver(onErrorJustReturn: [])
    }()
    
    lazy var displayCountryDetails: Observable<CountryDetailsViewModeling> = {
        return selectCountry
            .flatMap({ (countryViewModeling) -> Observable<CountryDetailsViewModeling> in
                return countryViewModeling.outputs.displayCountryDetails
            })
    }()
    
    private let disposeBag = DisposeBag()
    private let countriesUseCase: CountriesUseCase
    private let fetchCountries = BehaviorRelay<[Country]>(value: [Country]())
    
    init(countriesUseCase: CountriesUseCase = CountriesUseCaseHandler()) {
        self.countriesUseCase = countriesUseCase
        setupObservers()
    }

}

fileprivate extension CountriesViewModel {

    func setupObservers() {
        countriesUseCase
            .fetchCountries()
            .asObservable()
            .bind(to: fetchCountries)
            .disposed(by: disposeBag)
    }
    
}
