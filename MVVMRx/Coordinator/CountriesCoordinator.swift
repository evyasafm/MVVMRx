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
import Hero

class CountriesCoordinator: BaseCoordinator<Void> {
    
    private weak var window: UIWindow?
    let heroHelper = HeroHelper()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let navigationVC = R.storyboard.main().instantiateInitialViewController() as! UINavigationController
        heroHelper.configureHero(in: navigationVC)
        let countriesVC = navigationVC.viewControllers[0] as! CountriesVC
        countriesVC.hero.isEnabled = true
        let extractedExpr: CountriesViewModel = CountriesViewModel()
        countriesVC.viewModel = extractedExpr
        countriesVC.viewModel.outputs
            .displayCountryDetails
            .subscribe(onNext: { [weak self] in
                self?.displayCountryDetailsScreen(navigationController: navigationVC, countryDetailsViewModeling: $0)
            }).disposed(by: disposeBag)
        
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return .never()
    }
    
}

fileprivate extension CountriesCoordinator {
    
    func displayCountryDetailsScreen(navigationController: UINavigationController, countryDetailsViewModeling: CountryDetailsViewModeling) {
        let countryDetailsVC = R.storyboard.main.countryDetailsVC()!
        countryDetailsVC.viewModel = countryDetailsViewModeling
        navigationController.pushViewController(countryDetailsVC, animated: true)
    }
    
}
