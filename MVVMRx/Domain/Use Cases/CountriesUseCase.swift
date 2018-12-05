//
//  CountriesInteractor.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/2/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift

protocol CountriesUseCase {
    
    func fetchCountries() -> Observable<[CountryModel]>
    
}

class CountriesUseCaseHandler: CountriesUseCase {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = NetworkClientHandler.shared) {
        self.networkClient = networkClient
    }
    
    func fetchCountries() -> Observable<[CountryModel]> {
        return networkClient.fetchCountries()
    }
    
}
