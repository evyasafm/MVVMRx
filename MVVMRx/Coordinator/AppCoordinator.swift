//
//  AppCoordinator.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/4/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        return coordinate(to: CountriesCoordinator(window: window))
    }
    
}
