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
import RxCocoa

class CountriesVC: UIViewController {
    
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var countriesSearchBar: UISearchBar!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: CountriesViewModeling!
    
    // Mark - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = countriesTableView.indexPathForSelectedRow {
            countriesTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

fileprivate extension CountriesVC {
    
    func setupViews() {
        [CountryCell.self].forEach(countriesTableView.register)
    }
    
    func setupObservers() {
        countriesSearchBar.rx.text
            .bind(to: viewModel.inputs.searchText)
            .disposed(by: disposeBag)
        
        viewModel.outputs.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.outputs.countriesViewModel
            .bind(to: countriesTableView.rx.items(cellIdentifier: CountryCell.reuseID, cellType: CountryCell.self)) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }.disposed(by: disposeBag)
        
        countriesTableView.rx.modelSelected(CountryViewModeling.self)
            .bind(to: viewModel.inputs.selectCountry)
            .disposed(by: disposeBag)
    }
    
}
