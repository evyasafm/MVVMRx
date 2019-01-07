//
//  NetworkAPI.swift
//  TestClean
//
//  Created by Evyasaf on 3/11/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya
import RxSwift

protocol NetworkClient {
    
    func fetchCountries() -> Single<[Country]>
    
}

class NetworkClientHandler: NetworkClient {
    
    static let shared: NetworkClient = { NetworkClientHandler() }()
    
    private let provider: MoyaProvider<MyTargetType>
    
    private init() {
        provider = MoyaProvider<MyTargetType>(callbackQueue: DispatchQueue.global(),
                                              manager: MoyaProvider<MyTargetType>.defaultAlamofireManager())
    }
    
    // MARK: NetworkClient Implementation
    
    func fetchCountries() -> Single<[Country]> {
        return provider.rx
            .request(.fetchCountries)
            .map([CountryModel].self)
            .map { $0 }
    }
    
}
