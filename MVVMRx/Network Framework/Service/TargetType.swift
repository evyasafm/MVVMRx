//
//  ApiProvider.swift
//  TestClean
//
//  Created by Evyasaf on 3/11/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya

public enum MyTargetType {
    case fetch
}

extension MyTargetType: TargetType {
    
    public var baseURL: URL { return URL(string: "https://restcountries.eu/")! }
    
    public var path: String {
        switch self {
        case .fetch:
            return "rest/v2/all"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .fetch:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        switch self {
        case .fetch:
            return .successCodes
        }
        
    }
    
    public var sampleData: Data {
        switch self {
        case .fetch:
            return "[{}]".data(using: String.Encoding.utf8)!
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
}


