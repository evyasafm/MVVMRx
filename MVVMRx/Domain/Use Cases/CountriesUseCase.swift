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
    
    func fetchCountries() -> Single<[Country]>
    
}

class CountriesUseCaseHandler: CountriesUseCase {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = NetworkClientHandler.shared) {
        self.networkClient = networkClient
    }
    
    func fetchCountries() -> Single<[Country]> {
        return networkClient.fetchCountries()
    }
    
}
