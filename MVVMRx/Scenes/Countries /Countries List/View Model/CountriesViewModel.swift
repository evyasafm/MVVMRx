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
    var selectCountry: PublishRelay<CountryViewModeling> { get }
}

protocol CountriesViewModelingOutputs {
    var title: Driver<String> { get }
    var countriesViewModel: Driver<[CountryViewModeling]> { get }
    var displayCountryDetails: Observable<CountryViewModeling> { get }
}

protocol CountriesViewModeling {
    var inputs: CountriesViewModelingInputs { get }
    var outputs: CountriesViewModelingOutputs { get }
}

class CountriesViewModel: CountriesViewModeling, CountriesViewModelingInputs, CountriesViewModelingOutputs {

    var inputs: CountriesViewModelingInputs { return self }
    var outputs: CountriesViewModelingOutputs { return self }
    
    var selectCountry = PublishRelay<CountryViewModeling>()
    
    lazy var title: Driver<String> = {
       return Driver.just(R.string.localizable.countries_title())
    }()
    
    lazy var countriesViewModel: Driver<[CountryViewModeling]> = {
        return fetchCountries
            .map { (countries) -> [CountryViewModeling] in
                return countries.map { CountryViewModel(countryModel: $0) }
            }
            .asDriver(onErrorJustReturn: [])
    }()
    
    lazy var displayCountryDetails: Observable<CountryViewModeling> = {
        return selectCountry.asObservable()
    }()
    
    private let disposeBag = DisposeBag()
    private let networkClient: NetworkClient
    private let fetchCountries = BehaviorSubject<[CountryModel]>(value: [CountryModel]())
    
    init(networkClient: NetworkClient = NetworkClientHandler.shared) {
        self.networkClient = networkClient
        setupObservers()
    }

}

fileprivate extension CountriesViewModel {

    func setupObservers() {
        networkClient
            .fetchCountries()
            .bind(to: fetchCountries)
            .disposed(by: disposeBag)
    }
    
}
