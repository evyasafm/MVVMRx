//
//  CountriesCoordinator.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/4/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CountriesCoordinator: BaseCoordinator<Void> {
    
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let navigationVC = R.storyboard.main().instantiateInitialViewController() as! UINavigationController
        let countriesVC = navigationVC.viewControllers[0] as! CountriesVC
        countriesVC.viewModel = CountriesViewModel()
        
        countriesVC.viewModel.outputs
            .displayCountryDetails
            .subscribe(onNext: { [weak self] in
                self?.displayCountryDetailsScreen(navigationController: navigationVC, countryViewModeling: $0)
            }).disposed(by: disposeBag)
        
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return .never()
    }
    
}

fileprivate extension CountriesCoordinator {
    
    func displayCountryDetailsScreen(navigationController: UINavigationController, countryViewModeling: CountryViewModeling) {
        
    }
    
}