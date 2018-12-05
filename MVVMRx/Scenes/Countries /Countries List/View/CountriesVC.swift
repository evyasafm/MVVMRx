//
//  ListViewController.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/2/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CountriesVC: UIViewController {
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: CountriesViewModeling!
    
    // Mark - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
    }
    
}

fileprivate extension CountriesVC {
    
    func setupViews() {
        [CountryCell.self].forEach(countriesTableView.register)
    }
    
    func setupObservers() {
        viewModel.outputs.title
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.outputs.countriesViewModel
            .drive(countriesTableView.rx.items(cellIdentifier: CountryCell.reuseID, cellType: CountryCell.self)) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)
    }
    
}
