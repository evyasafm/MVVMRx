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
import Hero

class CountryDetailsVC: UIViewController {
    
    @IBOutlet weak var countryTableView: UITableView!
    
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
    
}

fileprivate extension CountryDetailsVC {
    
    func setupViews() {
        setupHero()
        setupTableView()
        setupParallaxHeader()
    }
    
    func setupHero() {
        hero.isEnabled = true
    }
    
    func setupTableView() {
        [CountryDetailCell.self].forEach(countryTableView.register)
    }
    
    func setupParallaxHeader() {
        countryTableView.parallaxHeader.view = parallaxImageView
        countryTableView.parallaxHeader.mode = .fill
        countryTableView.parallaxHeader.minimumHeight = 20
        countryTableView.parallaxHeader.height = 300
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
                cell.hero.modifiers = [.fade, .scale(3.0)]
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.name
            .drive(onNext: { [weak self] (name) in
                self?.parallaxImageView.hero.id = name
            })
            .disposed(by: disposeBag)
    }

}
