//
//  ApiProvider.swift
//  TestClean
//
//  Created by Evyasaf on 3/11/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya

public enum MyTargetType {
    case fetchCountries
}

extension MyTargetType: TargetType {
    
    public var baseURL: URL { return URL(string: "https://restcountries.eu/")! }
    
    public var path: String {
        switch self {
        case .fetchCountries:
            return "rest/v2/all"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchCountries:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .fetchCountries:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        switch self {
        case .fetchCountries:
            return .successCodes
        }
        
    }
    
    public var sampleData: Data {
        switch self {
        case .fetchCountries:
            return "[{}]".data(using: String.Encoding.utf8)!
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
}


