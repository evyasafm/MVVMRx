//
//  CountryDetailsTableVC.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/5/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import MXParallaxHeader
import RxCocoa
import RxSwift

class CountryDetailsVC: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var countriesSearchBar: UISearchBar!
    
    var viewModel: CountryDetailsViewModeling!
    
    private var disposeBag = DisposeBag()
    
    private lazy var parallaxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // Mark - view controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        countryTableView.parallaxHeader.height = (countryTableView.parallaxHeader.view?.frame.width ?? 0) * 2 / 3
    }
    
}

fileprivate extension CountryDetailsVC {
    
    func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Country Table View
        [CountryDetailCell.self].forEach(countryTableView.register)
        countryTableView.parallaxHeader.view = parallaxImageView
        countryTableView.parallaxHeader.mode = .fill
        countryTableView.parallaxHeader.minimumHeight = 20
    }
    
    func setupObservers() {
        disposeBag = DisposeBag()
        
        viewModel.outputs
            .title
            .drive(rx.title)
            .disposed(by: disposeBag)
        
        viewModel.outputs
            .imageURL
            .drive(parallaxImageView.rx.imageUrl())
            .disposed(by: disposeBag)
        
        viewModel.outputs
            .detailsViewModels
            .drive(countryTableView.rx.items(cellIdentifier: CountryDetailCell.reuseID, cellType: CountryDetailCell.self)) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)
    }
    
}
